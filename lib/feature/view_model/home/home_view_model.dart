import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

enum UserFilterQuery {
  name,
  shortBio,
  userName,
}

extension IterableExtension<T> on Iterable<T?> {
  List<T> makeSafe() {
    return where((element) => element != null).cast<T>().toList();
  }
}

final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;

  User? user;
  List<BaseFirebaseModel<User>> _userList = [];
  List<BaseFirebaseModel<User>> get userList => _userList;

  final Map<UserFilterQuery, List<User>> filterQueryMap = {};

  void makeFilter() {
    final userList = _userList.map((e) => e.data).toList();

    final nameUserList =
        userList.where((e) => e.name.ext.isNotNullOrNoEmpty).makeSafe();

    final shortBioUserList =
        userList.where((e) => e.shortBio.ext.isNotNullOrNoEmpty).makeSafe();

    final userNameUserList =
        userList.where((e) => e.userName.ext.isNotNullOrNoEmpty).makeSafe();

    // entegre todo
    final nameList = _userList.map((e) => e.data.name).makeSafe();
    final shortBioList = _userList.map((e) => e.data.shortBio).makeSafe();
    final userNameList = _userList.map((e) => e.data.userName).makeSafe();
    filterQueryMap[UserFilterQuery.name] = nameUserList;
    filterQueryMap[UserFilterQuery.shortBio] = shortBioUserList;
    filterQueryMap[UserFilterQuery.userName] = userNameUserList;
  }

  Future<void> fetchAllUserInformation() async {
    final allUserQueryResponse =
        await FirebaseQueries.users.reference.withConverter(
      fromFirestore: (snapshot, options) {
        if (snapshot.data()?.isEmpty ?? true) return null;
        return BaseFirebaseModel(
          id: snapshot.id,
          data: User.fromJson(snapshot.data()!),
        );
      },
      toFirestore: (value, options) {
        throw UnimplementedError();
      },
    ).get();

    _userList = allUserQueryResponse.docs
        .map((e) => e.data())
        .where((element) => element != null)
        .cast<BaseFirebaseModel<User>>()
        .toList();
  }

  Future<bool> checkUserGithubLogin() async {
    // //1- check user data from local state
    // user = _fetchUserProviderData();
    // if (user != null) return true;

    //2- when can not find any user, it will open outh screen for github
    final response = await _signInWithGitHub();
    user = response;
    return response != null;
  }

  Future<User?> _signInWithGitHub() async {
    final instance = auth.FirebaseAuth.instance;
    auth.UserCredential userCredential;

    if (kIsWeb) {
      userCredential = await instance.signInWithPopup(
        auth.GithubAuthProvider(),
      );
    } else {
      userCredential = await instance.signInWithProvider(
        auth.GithubAuthProvider(),
      );
    }
    final response = userCredential.additionalUserInfo?.profile;
    // userCredential.
    if (response == null) return null;
    final githubProfile = GithubProfile.fromJson(response);

    return User(
      name: githubProfile.name,
      shortBio: githubProfile.bio,
      photo: githubProfile.avatarUrl,
      githubUrl: githubProfile.url,
      userName: githubProfile.login,
      githubId: githubProfile.id,
    );
  }

  Future<List<BaseFirebaseModel<User>>> getUserList() async {
    final items = await usersQuery
        .withConverter<BaseFirebaseModel<User>?>(
          fromFirestore: (snapshot, options) {
            if (snapshot.data()?.isEmpty ?? true) return null;
            return BaseFirebaseModel(
              id: snapshot.id,
              data: User.fromJson(snapshot.data()!),
            );
          },
          toFirestore: (value, options) => throw Exception('-'),
        )
        .get();

    final userItems = items.docs
        .map((e) => e.data())
        .where((element) => element != null)
        .cast<BaseFirebaseModel<User>>()
        .toList();

    return userItems;
  }
}
