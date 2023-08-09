import 'package:mycodingsetup/feature/models/user.dart';

import 'package:mycodingsetup/product/database/hive/core/hive_operation.dart';

/// The class `UserHiveOperation` is a subclass of `HiveDatabaseOperation` specifically designed for performing operations
/// on `User` objects in a Hive database.
class UserHiveOperation extends HiveDatabaseOperation<User> {
  UserHiveOperation({required super.primitiveDatabase});
}
