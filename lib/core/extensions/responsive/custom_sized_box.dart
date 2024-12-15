import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key, this.width, this.height, this.child});

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h(context.screenSize) == 0
          ? null
          : height.h(context.screenSize),
      width:
          width.w(context.screenSize) == 0 ? null : width.w(context.screenSize),
      child: child,
    );
  }
}
