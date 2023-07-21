import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:mycodingsetup/feature/models/github_profile.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/state/user_context.dart';

final class UserGithubManager {
  const UserGithubManager(this.userContext);
  final UserContext userContext;

  /// Fetch user information data to transform our [User] model
  static Future<User?> signUpWithGithub() async {
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

  /// Save user information to memory
  void saveUserInformationToMemory(
    User? user,
  ) {
    if (user == null) return;
    userContext.updateUserState(user);
  }

  Future<bool> fetchGithubProfileAndSaveMemory() async {
    final user = await signUpWithGithub();
    if (user == null) return false;
    saveUserInformationToMemory(user);
    return true;
  }
}
