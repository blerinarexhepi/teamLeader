import 'package:flutter/material.dart';
import 'package:teamleader/core/assets/assets.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.width = 24,
    this.height = 24,
  });

  final String icon;
  final double width;
  final double height;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          null;
        }
      },
      child: Assets.fromSvg(
        width: width,
        svgPath: icon,
        height: height,
        color: iconColor,
      ),
    );
  }
}
