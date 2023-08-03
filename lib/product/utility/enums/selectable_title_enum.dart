import 'package:easy_localization/easy_localization.dart';
import 'package:mycodingsetup/product/utility/translation/locale_keys.g.dart';

enum SelectableTitleEnum {
  copyAll(LocaleKeys.homeDetail_selectableTitle_copyAll),
  copyAllShare(LocaleKeys.homeDetail_selectableTitle_copyAllShare),
  share(LocaleKeys.homeDetail_selectableTitle_share);

  const SelectableTitleEnum(this._title);
  final String _title;

  String get title => _title.tr();
}
