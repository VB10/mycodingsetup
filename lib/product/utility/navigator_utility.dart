import 'package:flutter/material.dart';

@immutable
final class NavigatorUtility {
  const NavigatorUtility(BuildContext context) : _context = context;

  final BuildContext _context;

  void pushAndReplace(Widget child) {
    Navigator.of(_context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => child,
      ),
    );
  }
}
