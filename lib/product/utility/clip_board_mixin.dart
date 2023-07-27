import 'package:mycodingsetup/product/utility/clip_board_manager.dart';
import 'package:mycodingsetup/product/utility/snackbar/custom_snackbar.dart';

final class ClipBoarWithMessagedManager {
  const ClipBoarWithMessagedManager._();
  static Future<void> copyToClipBoardAndShowMessage(String text) async {
    await CLipBoardManager.copyToClipBoard(text);

    CustomSnackbar.showSnackBar(
      message: 'Your message has copied to clipboard \n $text',
    );
  }
}
