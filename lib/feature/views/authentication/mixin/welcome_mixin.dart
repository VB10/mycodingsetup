import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/sub_feature/github/user_github_manager.dart';
import 'package:mycodingsetup/feature/view_model/authentication/welcome_view_model.dart';
import 'package:mycodingsetup/feature/views/authentication/welcome_view.dart';
import 'package:mycodingsetup/feature/views/main/tab/main_tab_view.dart';
import 'package:mycodingsetup/product/extension/state_extension.dart';
import 'package:mycodingsetup/product/state/user_context.dart';
import 'package:mycodingsetup/product/utility/navigator_utility.dart';

mixin WelcomeMixin on StatelessWidget, IWelcomeView {
  static final WelcomeViewModel _welcomeViewModel = WelcomeViewModel();

  void init() {}

  Future<void> _initialize(UserContext userContext) async {
    await userContext.initDatabase();
  }

  Future<void> navigateToHome(BuildContext context) async {
    await _initialize(context.read<UserContext>());
    if (!context.mounted) return;
    NavigatorUtility(context).pushAndReplace(const MainTabView());
  }

  Future<void> onSignUpPressed(BuildContext context) async {
    await _initialize(context.read<UserContext>());
    final user = await UserGithubManager.signUpWithGithub();
    if (user == null) return;
    if (!context.mounted) return;
    _welcomeViewModel.saveUserToStateAndNavigate(user, UserContext.of(context));
    await navigateToHome(context);
  }
}
