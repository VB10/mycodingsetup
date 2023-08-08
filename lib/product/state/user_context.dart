import 'package:flutter/material.dart';

import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/database/hive/operation/user_hive_operation.dart';
import 'package:mycodingsetup/product/database/secure/secure_database_manager.dart';

final class UserContext extends InheritedWidget {
  UserContext({
    required super.child,
    super.key,
  });

  final ValueNotifier<UserState> userState = ValueNotifier(UserState());

  User? get user => userState.value.user;
  final UserHiveOperation _userDatabaseOperation = UserHiveOperation(
    primitiveDatabase: SecureDatabaseManager(),
  );

  // Databasecontext need
  Future<void> initDatabase() async {
    await _userDatabaseOperation.start();

    final user = _userDatabaseOperation.getItem(User.userKey);
    if (user != null) {
      updateUserState(user, isUpdate: false);
    }
  }

  void updateUserState(User user, {bool isUpdate = true}) {
    userState.value = UserState()..setUser(user);
    if (!isUpdate) return;
    _updateUserFromDatabase(user);
  }

  Future<void> _updateUserFromDatabase(User user) async {
    await _userDatabaseOperation.addOrUpdateItem(user);
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
