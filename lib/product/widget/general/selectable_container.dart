import 'package:flutter/material.dart';
import 'package:mycodingsetup/product/widget/general/selectable/copy_all_clipboard.dart';
import 'package:mycodingsetup/product/widget/general/selectable/copy_all_item.dart';
import 'package:mycodingsetup/product/widget/general/selectable/share_menu_item.dart';
import 'package:selectable/selectable.dart';

class SelectableContainer extends StatefulWidget {
  const SelectableContainer({required this.child, super.key});
  final Widget child;

  @override
  State<SelectableContainer> createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  final SelectableController _selectionController = SelectableController();
  @override
  Widget build(BuildContext context) {
    return Selectable(
      selectionController: _selectionController,
      selectWordOnDoubleTap: true,
      popupMenuItems: [
        ShareMenuItem(),
        CopyAllShareItem(),
        CopyAllClipBoardItem()
      ],
      child: widget.child,
    );
  }
}
