import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UtilService {
  UtilService._init();
  static final UtilService _instance = UtilService._init();
  static UtilService get instance => _instance;
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  void showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text.tr()));

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void errorSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text.tr(),
        style: const TextStyle(color: Colors.red),
      ),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
