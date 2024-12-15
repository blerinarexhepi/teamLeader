import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    required this.onTap,
    required this.title,
    super.key,
    this.showIcon = true,
    this.color = AppColors.irisBlue,
  });

  final Color color;
  final String title;
  final bool showIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          Row(
            children: [
              if (showIcon) ...[
                Assets.fromSvg(
                  width: 14,
                  svgPath: Assets.icons.add,
                  color: color,
                ),
                const CustomSizedBox(width: 4),
              ],
              Text(
                title,
                style: context.textTheme.bodySmall!
                    .copyWith(fontSize: 13, color: color)
                    .r(context.screenSize),
              ),
            ],
          ),
          if (showIcon)
            Divider(
              height: 0,
              color: color,
              endIndent: context.screenSize.width / 2.3,
            ),
        ],
      ),
    );
  }
}
