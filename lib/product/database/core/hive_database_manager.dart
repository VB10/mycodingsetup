import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mycodingsetup/feature/models/user.dart';

abstract class IDatabaseManager {
  Future<void> start();
  Future<void> clear();
}

@immutable
final class HiveDatabaseManager implements IDatabaseManager {
  @override
  Future<void> start() async {
    await _open();
    _initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  /// Open your database connection
  /// Now using [Hive]
  Future<void> _open() async {
    await Hive.initFlutter();
  }

  /// Register your generic model or make your operation before start
  void _initialOperation() {
    Hive.registerAdapter(UserAdapter());
  }
}
