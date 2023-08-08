import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mycodingsetup/feature/models/user.dart';
import 'package:mycodingsetup/product/database/hive/core/hive_database_manager.dart';
import 'package:mycodingsetup/product/database/hive/operation/user_hive_operation.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'fake_path_provider.dart';
import 'test_primitive_database.dart';

void main() {
  final hiveDatabaseManager = HiveDatabaseManager();
  final userDatabaseOperation = UserHiveOperation(
    primitiveDatabase: PrimitiveDatabaseTest(),
  );

  /// create dumy user
  const user = User(
    githubId: 1234,
    name: 'test',
    photo: 'test',
    githubUrl: 'test',
    shortBio: 'test',
    userName: 'vb10',
  );
  setUp(
    () {
      PathProviderPlatform.instance = FakePathProviderPlatform();

      Hive.init('test/database/vb10/');
      hiveDatabaseManager.initialOperation();
    },
  );
  test('Database test for sample user', () async {
    await userDatabaseOperation.start();
    await userDatabaseOperation.addOrUpdateItem(user);
  });

  test('Database test for sample user with listen', () async {
    await userDatabaseOperation.start();
    userDatabaseOperation.streamItems().listen(print);
    await userDatabaseOperation.addOrUpdateItem(user);
  });

  test('Database remove', () async {
    await userDatabaseOperation.start();
    await userDatabaseOperation.addOrUpdateItem(user);

    await hiveDatabaseManager.clear();
  });
}
