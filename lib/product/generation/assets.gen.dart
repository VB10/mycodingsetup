/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ic_github.png
  AssetGenImage get icGithub =>
      const AssetGenImage('assets/icon/ic_github.png');

  /// List of all assets
  List<AssetGenImage> get values => [icGithub];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_code_welcome.png
  AssetGenImage get imgCodeWelcome =>
      const AssetGenImage('assets/images/img_code_welcome.png');

  /// List of all assets
  List<AssetGenImage> get values => [imgCodeWelcome];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
