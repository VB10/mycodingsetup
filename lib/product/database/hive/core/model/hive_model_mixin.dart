part of '../hive_operation.dart';

abstract class HiveManagerInitialModel {
  HiveEncryption get _encryption;
}

/// The `HiveModelMixin` mixin in Dart is defining a mixin that adds a `key` property to classes that use it. The `key`
/// You have to register [T] your model in app initialize
/// You can use [DatabaseManager.initialze]
mixin HiveManagerMixin<T> on HiveManagerInitialModel {
  final String _key = T.toString();

  /// The `box` property is a Hive box of type `T` with the given key.
  late Box<T> _box;

  /// The function `start` opens a Hive box of type `T` with the given key asynchronously.
  Future<void> start() async {
    if (Hive.isBoxOpen(_key)) {
      _box = Hive.box(_key);
      return;
    }
    final encryptionKey = await _encryption.getSecureKey();
    _box = await Hive.openBox<T>(
      _key,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  /// The `clear` function clears all data in the `box`.
  Future<void> clear() => _box.clear();
}
