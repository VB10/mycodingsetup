import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable

// This class will be change to appbar style from white
final class CustomRegion extends AnnotatedRegion {
  CustomRegion({required super.child, super.key})
      : super(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.white,
          ),
        );
}
