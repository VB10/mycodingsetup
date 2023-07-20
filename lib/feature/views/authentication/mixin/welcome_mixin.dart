import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/sub_feature/github/user_github_manager.dart';
import 'package:mycodingsetup/feature/view_model/authentication/welcome_view_model.dart';
import 'package:mycodingsetup/feature/views/authentication/welcome_view.dart';
import 'package:mycodingsetup/feature/views/main/tab/main_tab_view.dart';
import 'package:mycodingsetup/product/state/user_context.dart';
import 'package:mycodingsetup/product/utility/navigator_utility.dart';

mixin WelcomeMixin on StatelessWidget, IWelcomeView {
  static final WelcomeViewModel _welcomeViewModel = WelcomeViewModel();

  void navigateToHome(BuildContext context) {
    NavigatorUtility(context).pushAndReplace(const MainTabView());
  }

  Future<void> onSignUpPressed(BuildContext context) async {
    final user = await UserGithubManager.signUpWithGithub();
    if (user == null) return;
    if (!context.mounted) return;
    _welcomeViewModel.saveUserToStateAndNavigate(user, UserContext.of(context));
    navigateToHome(context);
  }
}
