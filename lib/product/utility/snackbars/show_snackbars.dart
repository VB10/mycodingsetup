import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class ShowSnackbars {
  ShowSnackbars._init();
  final ShowSnackbars _instance = ShowSnackbars._init();
  ShowSnackbars get instance => _instance;
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  void showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text.tr()));

    messengerKey.currentState?.showSnackBar(snackBar);
  }

  void errorSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text.tr(),
        style: const TextStyle(color: Colors.red),
      ),
    );

    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
