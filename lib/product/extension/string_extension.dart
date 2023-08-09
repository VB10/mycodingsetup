extension StringGenericExtension on String {
  /// The function `item()` attempts to parse a given value into a specified type (`bool`, `int`, `double`, or `String`) and
  /// returns it, or returns `null` if the parsing fails.
  ///
  /// Returns:
  ///   The method is returning a value of type T. The specific type that is being returned depends on the type of T. If T is
  /// bool, it returns a bool value. If T is int, it returns an int value. If T is double, it returns a double value. If T is
  /// String, it returns a String value. If T is none of these types, it returns null.
  T? item<T>() {
    if (T == bool) return bool.fromEnvironment(this) as T;
    if (T == int) return int.tryParse(this) as T?;
    if (T == double) return double.parse(this) as T;
    if (T == String) return this as T;
    return null;
  }
}
