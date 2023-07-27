import 'package:kartal/kartal.dart';
import 'package:selectable/selectable.dart';

final class CopyAllShareItem extends SelectableMenuItem {
  CopyAllShareItem()
      : super(
          title: 'Copy all Share',
          isEnabled: (controller) =>
              (controller?.isTextSelected ?? false) &&
              (controller?.getSelection()?.text?.isNotEmpty ?? false),
          handler: (controller) {
            if (controller == null) return false;
            controller.selectAll();
            final selection = controller.getSelection();

            selection?.text.ext.share().whenComplete(() async {
              controller
                ..hide()
                ..deselectAll();
            });

            return true;
          },
        );
}
