import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class RadiusContainer extends StatelessWidget {
  const RadiusContainer({
    super.key,
    this.width,
    this.radius = 8,
    required this.widget,
    this.color = AppColors.white,
    this.padding,
    this.height,
  });

  final Color color;
  final double? width;
  final Widget widget;
  final double radius;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:
          padding ?? CustomEdgeInsets.all(size: context.screenSize, all: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: widget,
    );
  }
}
