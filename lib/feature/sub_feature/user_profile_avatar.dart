import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/sub_feature/github/user_github_manager.dart';
import 'package:mycodingsetup/feature/sub_feature/user_state_widget.dart';
import 'package:mycodingsetup/product/extension/state_extension.dart';
import 'package:mycodingsetup/product/generation/assets.gen.dart';
import 'package:mycodingsetup/product/state/user_context.dart';

final class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return UserStateListener(
      onListen: (user) {
        final userPhotoUrl = user?.photo;
        if (userPhotoUrl == null || userPhotoUrl.isEmpty) {
          return InkWell(
            onTap: () async {
              await UserGithubManager(context.read<UserContext>())
                  .fetchGithubProfileAndSaveMemory();
            },
            child: CircleAvatar(
              child: Assets.icon.icGithub.image(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
