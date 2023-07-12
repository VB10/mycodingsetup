import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;

  User? user;

  Future<bool> checkUserGithubLogin() async {
    // //1- check user data from local state
    // user = _fetchUserProviderData();
    // if (user != null) return true;

    //2- when can not find any user, it will open outh screen for github
    final response = await _signInWithGitHub();
    user = response;
    return response != null;
  }

  /// It will control any data has in state
  /// it it found github domain then it will return user
  User? _fetchUserProviderData() {
    final instance = auth.FirebaseAuth.instance;

    final githubUserFromState =
        instance.currentUser?.providerData.firstWhereOrNull(
      (element) => element.providerId == 'github.com',
    );

    if (githubUserFromState != null) {
      return User(
        name: githubUserFromState.displayName,
        photo: githubUserFromState.photoURL,
        githubId: int.tryParse(githubUserFromState.uid ?? ''),
      );
    }
    return null;
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
