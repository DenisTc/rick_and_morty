/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/character_gender
  $AssetsIconsCharacterGenderGen get characterGender =>
      const $AssetsIconsCharacterGenderGen();

  /// Directory path: assets/icons/character_species
  $AssetsIconsCharacterSpeciesGen get characterSpecies =>
      const $AssetsIconsCharacterSpeciesGen();

  /// Directory path: assets/icons/character_status
  $AssetsIconsCharacterStatusGen get characterStatus =>
      const $AssetsIconsCharacterStatusGen();
}

class $AssetsIconsCharacterGenderGen {
  const $AssetsIconsCharacterGenderGen();

  /// File path: assets/icons/character_gender/female.webp
  AssetGenImage get female =>
      const AssetGenImage('assets/icons/character_gender/female.webp');

  /// File path: assets/icons/character_gender/male.webp
  AssetGenImage get male =>
      const AssetGenImage('assets/icons/character_gender/male.webp');

  /// File path: assets/icons/character_gender/unknown.webp
  AssetGenImage get unknown =>
      const AssetGenImage('assets/icons/character_gender/unknown.webp');

  /// List of all assets
  List<AssetGenImage> get values => [female, male, unknown];
}

class $AssetsIconsCharacterSpeciesGen {
  const $AssetsIconsCharacterSpeciesGen();

  /// File path: assets/icons/character_species/alien.webp
  AssetGenImage get alien =>
      const AssetGenImage('assets/icons/character_species/alien.webp');

  /// File path: assets/icons/character_species/human.webp
  AssetGenImage get human =>
      const AssetGenImage('assets/icons/character_species/human.webp');

  /// List of all assets
  List<AssetGenImage> get values => [alien, human];
}

class $AssetsIconsCharacterStatusGen {
  const $AssetsIconsCharacterStatusGen();

  /// File path: assets/icons/character_status/alive.webp
  AssetGenImage get alive =>
      const AssetGenImage('assets/icons/character_status/alive.webp');

  /// File path: assets/icons/character_status/dead.webp
  AssetGenImage get dead =>
      const AssetGenImage('assets/icons/character_status/dead.webp');

  /// File path: assets/icons/character_status/unknown.webp
  AssetGenImage get unknown =>
      const AssetGenImage('assets/icons/character_status/unknown.webp');

  /// List of all assets
  List<AssetGenImage> get values => [alive, dead, unknown];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
