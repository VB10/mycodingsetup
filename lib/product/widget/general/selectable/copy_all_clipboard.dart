import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/product/utility/clip_board_mixin.dart';
import 'package:selectable/selectable.dart';

final class CopyAllClipBoardItem extends SelectableMenuItem {
  CopyAllClipBoardItem()
      : super(
          title: 'Copy all',
          isEnabled: (controller) =>
              (controller?.isTextSelected ?? false) &&
              (controller?.getSelection()?.text?.isNotEmpty ?? false),
          handler: (controller) {
            if (controller == null) return false;
            controller.selectAll();
            final selection = controller.getSelection();
            if (selection == null) return false;
            if (selection.text.ext.isNullOrEmpty) return false;

            ClipBoarWithMessagedManager.copyToClipBoardAndShowMessage(
              selection.text!,
            ).whenComplete(() {
              controller
                ..hide()
                ..deselectAll();
            });

            return true;
          },
        );
}
