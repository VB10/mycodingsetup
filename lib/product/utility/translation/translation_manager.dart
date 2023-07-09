import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationManager extends EasyLocalization {
  TranslationManager({
    required super.child,
    super.key,
  }) : super(
          path: 'assets/translation',
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('tr', 'TR'),
          ],
          startLocale: const Locale('en', 'US'),
        );
}
