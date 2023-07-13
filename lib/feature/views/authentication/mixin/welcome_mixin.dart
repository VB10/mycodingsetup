import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/view_model/authentication/welcome_view_model.dart';
import 'package:mycodingsetup/feature/views/authentication/welcome_view.dart';
import 'package:mycodingsetup/feature/views/home/home_view.dart';
import 'package:mycodingsetup/product/utility/navigator_utility.dart';

mixin WelcomeMixin on StatelessWidget, IWelcomeView {
  static final WelcomeViewModel _welcomeViewModel = WelcomeViewModel();

  Future<void> onSignUpPressed(BuildContext context) async {
    final user = await _welcomeViewModel.signUpWithGithub();
    if (user == null) return;
    if (!context.mounted) return;
    NavigatorUtility(context).pushAndReplace(const HomeView());
  }
}
