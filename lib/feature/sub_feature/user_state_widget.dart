import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/state/user_context.dart';

class UserStateListener extends StatelessWidget {
  const UserStateListener({required this.onListen, super.key});

  final Widget Function(User? userContext) onListen;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserState>(
      valueListenable: UserContext.of(context).userState,
      builder: (context, value, child) {
        final userPhotoUrl = value.user?.photo;

        if (userPhotoUrl == null || userPhotoUrl.isEmpty) {
          return onListen(value.user);
        }
        return CircleAvatar(
          backgroundImage: NetworkImage(userPhotoUrl),
        );
      },
    );
  }
}
