import '../../regexp_utills.dart';
import 'custom_validator.dart';

class UrlValidator extends CustomValidator {
  @override
  bool hasMatch(String text) {
    return RegExputils.url.regex.hasMatch(text);
  }
}
