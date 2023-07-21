import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/feature/view_model/home/home_view_model.dart';
import 'package:mycodingsetup/feature/views/main/home/index.dart';
import 'package:mycodingsetup/product/utility/firebase/firebase_base_model.dart';
import 'package:mycodingsetup/product/utility/translation/locale_keys.g.dart';

import 'package:mycodingsetup/product/widget/button/white_eleveted_button.dart';
import 'package:mycodingsetup/product/widget/card/rating_review_card.dart';

part 'mixin/home_view_mixin.dart';
part 'widget/home_github_view.dart';
part 'widget/home_extension_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: context.padding.horizontalNormal,
        children: [
          context.sized.emptySizedHeightBoxLow,
          _ActionButtons(
            updateExtensionOrGithub,
          ),
          Padding(
            padding: context.padding.onlyTopNormal,
            child: ValueListenableBuilder(
              valueListenable: homeTabListener,
              builder: (context, value, child) {
                return AnimatedCrossFade(
                  duration: context.duration.durationLow,
                  firstChild: _ListBodyItems(
                    userListNotifier: userListNotifier,
                  ),
                  secondChild: _GithubExtensionView(mapUserFilterListener),
                  crossFadeState: value == HomeTabItems.github
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons(this.onPressed);
  final ValueSetter<HomeTabItems> onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 5,
          child: ElevatedButton(
            onPressed: () {
              onPressed.call(HomeTabItems.extension);
            },
            child: const Text(LocaleKeys.button_extension).tr(),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 5,
          child: WhiteElevatedButton(
            title: LocaleKeys.button_github.tr(),
            onPressed: () {
              onPressed.call(HomeTabItems.github);
            },
          ),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
