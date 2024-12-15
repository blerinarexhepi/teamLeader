import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.padding,
    this.isEnabled = false,
    this.textColor = AppColors.white,
    this.fontWeight = FontWeight.w500,
    this.backgroundColor = AppColors.irisBlue,
  });

  final String title;
  final String? icon;
  final bool isEnabled;
  final Color textColor;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed!(),
      style: TextButton.styleFrom(
        foregroundColor: isEnabled ? textColor : AppColors.charcoal,
        backgroundColor: isEnabled ? backgroundColor : AppColors.gainsboro,
        padding: padding ??
            CustomEdgeInsets.all(
              all: 13.5,
              size: context.screenSize,
            ),
        textStyle: context.textTheme.labelMedium!
            .r(context.screenSize)!
            .copyWith(fontWeight: fontWeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: CustomSizedBox(
        width: context.screenSize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Assets.fromSvg(svgPath: icon!, color: textColor),
            Text(title),
          ],
        ),
      ),
    );
  }
}
