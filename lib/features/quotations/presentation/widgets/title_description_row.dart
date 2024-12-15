import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class TitleDescriptionRow extends StatelessWidget {
  const TitleDescriptionRow({
    super.key,
    required this.title,
    this.description,
    this.titleSize = 14,
    this.descriptionColor = AppColors.darkGreen,
  });
  final String title;
  final double titleSize;
  final String? description;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium!
              .copyWith(
                fontSize: titleSize,
                color: AppColors.grey,
              )
              .r(context.screenSize),
        ),
        const CustomSizedBox(height: 6),
        Text(
          description != null ? description! : '-',
          style: context.textTheme.labelMedium!
              .copyWith(color: descriptionColor)
              .r(context.screenSize),
        )
      ],
    );
  }
}
