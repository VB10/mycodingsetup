import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class CLipBoardManager {
  const CLipBoardManager._();

  static Future<void> copyToClipBoard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
