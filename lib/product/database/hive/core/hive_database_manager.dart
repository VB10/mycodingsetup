import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/utility/file_operation.dart';

abstract class IDatabaseManager {
  Future<void> start();
  Future<void> clear();
}

@immutable
final class HiveDatabaseManager implements IDatabaseManager {
  final String _subDirectory = 'vb10';
  @override
  Future<void> start() async {
    await _open();
    initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
    await FileOperation.instance.removeSubDirectory(_subDirectory);
  }

  /// Open your database connection
  /// Now using [Hive]
  Future<void> _open() async {
    final subPath =
        await FileOperation.instance.createSubDirectory(_subDirectory);
    await Hive.initFlutter(subPath);
  }

  /// Register your generic model or make your operation before start
  void initialOperation() {
    Hive.registerAdapter(UserAdapter());
  }
}

class Directory {}
