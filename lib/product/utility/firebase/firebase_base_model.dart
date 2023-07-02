import 'package:flutter/foundation.dart';

@immutable
base class BaseFirebaseModel<T> {
  const BaseFirebaseModel({
    required this.id,
    required this.data,
  });
  final String id;
  final T data;
}
