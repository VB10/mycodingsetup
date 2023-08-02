import 'package:flutter/material.dart';

@immutable

/// The code is defining a class called `PageKeys` with a private constructor `_()`. The class is marked as `final`, which
/// means it cannot be extended.
final class PageKeys {
  const PageKeys._();
  static const Key welcomeWithoutLogin =
      Key('authentication_welcome_getStarted');
}

enum PageKeyValues {
  welcomeWithoutLogin;

  Key get currentKey => Key(name);
}

@immutable
final class PageKeyItems extends Key {
  factory PageKeyItems(String value) => PageKeyItems(value);

  factory PageKeyItems.welcome() => PageKeyItems('auth_welcome');
}
