import 'package:mycodingsetup/product/database/core/primitive_keys.dart';

abstract class PrimitiveDatabase {
  /// The `Future<T?> read<T>(PrimitiveKeys key)` method is a generic method that is used to read data from a database.
  Future<T?> read<T>(PrimitiveKeys key);

  /// The `write` method is a generic method that takes two required parameters: `key` of type `PrimitiveKeys` and `data` of
  /// type `T`. It returns a `Future<bool>` which indicates whether the write operation was successful or not.
  Future<bool> write<T>({required PrimitiveKeys key, required T data});
}
