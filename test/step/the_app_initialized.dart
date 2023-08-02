import 'package:flutter_test/flutter_test.dart';
import 'package:mycodingsetup/index.dart';

Future<void> theAppInitialized(WidgetTester tester) async {
  await AppInitialize.initialize();
}
