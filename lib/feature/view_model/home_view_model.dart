import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';

final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;

  User? user;
  Future<bool> checkUserGithubLogin() async {
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

    final userItems =
        items.docs.map((e) => e.data()).where((element) => element != null).cast<BaseFirebaseModel<User>>().toList();

    return userItems;
  }
}
