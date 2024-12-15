import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamleader/core/extensions/responsive/custom_sized_box.dart';

class $AssetsIcons {
  const $AssetsIcons();

  /// File path: assets/icons/add.svg
  String get add => 'assets/icons/add.svg';

  /// File path: assets/icons/arrow-left.svg
  String get arrowLeft => 'assets/icons/arrow-left.svg';

  /// File path: assets/icons/arrow-down.svg
  String get arrowDown => 'assets/icons/arrow-down.svg';

  /// File path: assets/icons/arrow.svg
  String get arrowUp => 'assets/icons/arrow.svg';

  /// File path: assets/icons/close.svg
  String get close => 'assets/icons/close.svg';
}

class $AssetsImages {
  const $AssetsImages();
}

class Assets {
  const Assets._();

  static const $AssetsIcons icons = $AssetsIcons();
  static const $AssetsImages images = $AssetsImages();

  static Widget fromSvg({
    required String svgPath,
    Key? key,
    Color? color,
    double width = 24,
    double height = 20,
    double padding = 0,
    BoxFit fit = BoxFit.contain,
    BlendMode blendMode = BlendMode.srcIn,
  }) {
    return CustomSizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(
          key: key,
          svgPath,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(
                  color,
                  blendMode,
                ),
          fit: fit,
        ),
      ),
    );
  }
}
