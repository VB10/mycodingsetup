import 'package:flutter/material.dart';

import 'package:mycodingsetup/feature/models/user.dart';

final class UserContext extends InheritedWidget {
  UserContext({
    required super.child,
    super.key,
  });

  final ValueNotifier<UserState> userState = ValueNotifier(UserState());

  User? get user => userState.value.user;

  void updateUserState(User user) {
    userState.value = UserState()..setUser(user);
  }

  @override
  bool updateShouldNotify(covariant UserContext oldWidget) {
    return true;
  }

  static UserContext of(BuildContext context) {
    final userContext =
        context.dependOnInheritedWidgetOfExactType<UserContext>();
    assert(userContext != null, 'No UserContext found in context');
    return userContext!;
  }
}

class UserState {
  User? _user;
  User? get user => _user;

  void setUser(User user) {
    _user = user;
  }
}
