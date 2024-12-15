import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class BorderIconTextButton extends StatelessWidget {
  const BorderIconTextButton({
    super.key,
    required this.onTap,
    this.icon,
    this.title,
    this.iconColor,
    this.radius = 12,
    this.centerTitle = true,
    this.textColor = AppColors.charcoal,
    this.borderColor = AppColors.gainsboro,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 14,
    ),
  });

  final String? icon;
  final double radius;
  final String? title;
  final Color? iconColor;
  final Color? textColor;
  final bool centerTitle;
  final Color borderColor;
  final VoidCallback onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        padding: title != null && icon != null
            ? CustomEdgeInsets.symmetric(
                vertical: 7,
                size: context.screenSize,
              )
            : title == null
                ? CustomEdgeInsets.all(size: context.screenSize, all: 10)
                : padding,
        child: Row(
          mainAxisAlignment:
              centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (!centerTitle && icon != null) const CustomSizedBox(width: 16),
            if (icon != null)
              Assets.fromSvg(
                svgPath: icon!,
                color: iconColor,
              ),
            if (icon != null && title != null) const CustomSizedBox(width: 4),
            if (title != null)
              Text(
                title!,
                style: context.textTheme.labelMedium!
                    .copyWith(fontSize: 12, color: textColor)
                    .r(context.screenSize),
              ),
          ],
        ),
      ),
    );
  }
}
