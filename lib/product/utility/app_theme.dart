import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mycodingsetup/product/generation/colors.gen.dart';

@immutable
final class AppTheme {
  AppTheme() {
    _themeData = ThemeData.dark();
  }
  late final ThemeData _themeData;

  ThemeData get currentTheme => _themeData.copyWith(
        scaffoldBackgroundColor: ColorName.cynicalBlack,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.lust,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            elevation: 0,
            foregroundColor: Colors.white,
            textStyle: _themeData.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: const ColorScheme.dark(
          onSecondary: Colors.white,
          onPrimaryContainer: ColorName.potBlack,
        ),
        textTheme: _themeData.textTheme.copyWith(
          headlineLarge: ThemeData.dark().textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
          titleMedium: _themeData.textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
          titleSmall: _themeData.textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
      );
}
