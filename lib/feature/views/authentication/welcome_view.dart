import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/views/authentication/mixin/welcome_mixin.dart';
import 'package:mycodingsetup/product/generation/assets.gen.dart';
import 'package:mycodingsetup/product/utility/translation/locale_keys.g.dart';
import 'package:mycodingsetup/product/widget/button/white_eleveted_button.dart';

mixin class IWelcomeView {}

class WelcomeView extends StatelessWidget with IWelcomeView, WelcomeMixin {
  const WelcomeView({super.key});
  //  {
  //   init();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalLow,
          child: Column(
            children: [
              Assets.images.imgCodeWelcome.image(),
              Text(
                LocaleKeys.authentication_welcome_title.tr(),
                style: context.general.textTheme.headlineLarge?.copyWith(),
              ),
              Text(
                LocaleKeys.authentication_welcome_description.tr(),
                style: context.general.textTheme.titleSmall,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => navigateToHome(context),
                child: Center(
                  child:
                      Text(LocaleKeys.authentication_welcome_getStarted.tr()),
                ),
              ),
              Padding(
                padding: context.padding.onlyTopNormal,
                child: WhiteElevatedButton(
                  onPressed: () async {
                    await onSignUpPressed(context);
                  },
                  title: LocaleKeys.authentication_welcome_withoutAccount.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
