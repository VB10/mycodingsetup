import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
final class TranslationManager extends EasyLocalization {
  TranslationManager({
    required super.child,
    super.key,
  }) : super(
          path: _assetPath,
          supportedLocales: LocaleItems.supportedLocalize,
          startLocale: LocaleItems.en.item,
        );
  static const String _assetPath = 'assets/translations';
}

enum LocaleItems {
  en(Locale('en', 'US'));

  static final List<Locale> supportedLocalize = <Locale>[
    en.item,
  ];

  final Locale item;
  const LocaleItems(this.item);
}
