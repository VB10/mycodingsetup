import 'package:flutter/foundation.dart';

@immutable
final class ImageConstants {
  const ImageConstants._();
  // Home
  static final String icGithub = 'ic_github'.toPng;
}

extension on String {
  String get toPng => 'assets/$this.png';
}
