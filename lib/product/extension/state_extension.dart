import 'package:flutter/widgets.dart';

extension StateExtension on BuildContext {
  T read<T extends InheritedWidget>() {
    final state = dependOnInheritedWidgetOfExactType<T>();
    if (state == null) {
      throw Exception('No $T found in context');
    }
    return state;
  }

  // TODO: watch
}
