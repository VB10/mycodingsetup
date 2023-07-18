import 'package:flutter/material.dart';

import 'package:mycodingsetup/feature/models/user.dart';

final class UserContext extends InheritedWidget {
  const UserContext({
    required super.child,
    required this.userState,
    super.key,
  });

  final UserState userState;
  @override
  bool updateShouldNotify(covariant UserContext oldWidget) {
    return userState != oldWidget.userState;
  }

  static UserContext of(BuildContext context) {
    final userContext =
        context.dependOnInheritedWidgetOfExactType<UserContext>();
    assert(userContext != null, 'No UserContext found in context');
    return userContext!;
  }
}

class UserState {
  late User _user;
  User get user => _user;

  void setUser(User user) {
    _user = user;
  }
}
