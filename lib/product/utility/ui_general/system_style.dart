import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class SystemGeneralStyle {
  const SystemGeneralStyle._();

  /// 1- it will set to white status bar color
  static void make() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
  }
}
