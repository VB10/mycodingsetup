import 'custom_validator.dart';

final class PointValidator extends CustomValidator {
  @override
  bool hasMatch(String text) {
    return int.tryParse(text) != null;
  }
}
