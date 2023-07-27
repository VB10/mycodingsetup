import 'package:flutter/material.dart';
import 'package:mycodingsetup/product/utility/project_manager.dart';

@immutable
final class CustomSnackbar {
  const CustomSnackbar._();

  static void showSnackBar({
    required String message,
  }) {
    ProjectManager.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
