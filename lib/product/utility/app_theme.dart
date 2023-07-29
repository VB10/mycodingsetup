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
        useMaterial3: true,
        tabBarTheme: const TabBarTheme(
          labelColor: ColorName.lust,
          indicatorColor: ColorName.lust,
          dividerColor: Colors.transparent,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: ColorName.lust,
        ),
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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorName.lust,
          foregroundColor: Colors.white,
          shape: CircleBorder(),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: const ColorScheme.dark(
          onSecondary: Colors.white,
          onPrimaryContainer: ColorName.potBlack,
          onBackground: ColorName.direWolf,
          onError: ColorName.lust,
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
