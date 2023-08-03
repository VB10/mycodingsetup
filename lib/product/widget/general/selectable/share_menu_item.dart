import 'package:kartal/kartal.dart';
import 'package:mycodingsetup/product/utility/enums/selectable_title_enum.dart';
import 'package:selectable/selectable.dart';

final class ShareMenuItem extends SelectableMenuItem {
  ShareMenuItem()
      : super(
          title: SelectableTitleEnum.share.title,
          isEnabled: (controller) {
            if (controller == null) return false;
            if (!controller.isTextSelected) return false;
            return controller.getSelection()?.text?.isNotEmpty ?? false;
          },
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
