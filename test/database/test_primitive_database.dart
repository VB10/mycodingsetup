import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/product/database/core/primitive_database.dart';
import 'package:mycodingsetup/product/database/core/primitive_keys.dart';
import 'package:mycodingsetup/product/extension/string_extension.dart';

final class PrimitiveDatabaseTest extends PrimitiveDatabase {
  final List<MapEntry<PrimitiveKeys, String>> _items = [];

  @override
  Future<T?> read<T>(PrimitiveKeys key) async {
    final response =
        _items.firstWhereOrNull((element) => element.key == key)?.value;
    if (response == null || response.isEmpty) return null;
    return response.item<T>();
  }

  @override
  Future<bool> write<T>({required PrimitiveKeys key, required T data}) async {
    _items.add(MapEntry(key, data.toString()));
    return true;
  }
}
