import 'dart:convert';
import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycodingsetup/product/database/core/primitive_database.dart';

import 'package:mycodingsetup/product/database/core/primitive_keys.dart';

class HiveEncryption {
  HiveEncryption({required this.primitiveDatabase});

  Uint8List? _encryptionKeyUint8List;
  final PrimitiveDatabase primitiveDatabase;

  Future<Uint8List> getSecureKey() async {
    if (_encryptionKeyUint8List != null) return _encryptionKeyUint8List!;
    // if key not exists return null
    final encryptionKeyString = await primitiveDatabase.read<String?>(
      PrimitiveKeys.secureDatabaseKey,
    );
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await primitiveDatabase.write(
        key: PrimitiveKeys.secureDatabaseKey,
        data: base64UrlEncode(key),
      );
    }

    final key = await primitiveDatabase.read<String>(
      PrimitiveKeys.secureDatabaseKey,
    );
    if (key == null) throw Exception('key is null');
    final encryptionKeyUint8List = base64Url.decode(key);

    _encryptionKeyUint8List = encryptionKeyUint8List;
    return encryptionKeyUint8List;
  }
}
