import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/enums/firestore_queries.dart';

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
}
