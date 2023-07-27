import 'package:kartal/kartal.dart';
import 'package:selectable/selectable.dart';

final class ShareMenuItem extends SelectableMenuItem {
  ShareMenuItem()
      : super(
          title: 'Share',
          isEnabled: (controller) =>
              (controller?.isTextSelected ?? false) &&
              (controller?.getSelection()?.text?.isNotEmpty ?? false),
          handler: (controller) {
            if (controller == null) return false;
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
