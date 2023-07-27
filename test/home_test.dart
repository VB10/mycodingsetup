import 'package:flutter_test/flutter_test.dart';
import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/feature/models/index.dart';
import 'package:mycodingsetup/feature/view_model/index.dart';

void main() {
  final homeFormViewModel = HomeFormViewModel(
    const User(
      name: 'name',
      shortBio: 'shortBio',
      userName: 'userName',
    ),
  );

  test('user detail from json', () async {
    const userDetailJson = '''
{
  "computer": "MacBook Pro",
  "computerUrl": "https://example.com/computer",
  "extensions": ["VSCode", "Sublime Text", "IntelliJ IDEA"],
  "theme": "Dark",
  "settingValue": 42
}
''';

    final jsonData =
        await userDetailJson.ext.safeJsonDecodeCompute<Map<String, dynamic>>();

    if (jsonData == null) {
      throw Exception('json data is null');
    }
    final userDetail = homeFormViewModel.userDetailFromJson(jsonData);

    expect(userDetail?.computer ?? '', 'MacBook Pro');
  });
}
