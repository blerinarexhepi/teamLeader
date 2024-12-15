import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/widgets/border_icon_text_button.dart';
import 'package:teamleader/features/quotations/presentation/widgets/widgets.dart';

class QuotationsCount extends StatelessWidget {
  const QuotationsCount({
    super.key,
    required this.total,
    required this.title,
    required this.description,
    this.onTap,
    this.titleSize = 11,
  });

  final String total;
  final String title;
  final double titleSize;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RadiusContainer(
      width: context.screenSize.width,
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall!
                    .copyWith(color: AppColors.grey)
                    .r(context.screenSize),
              ),
              const CustomSizedBox(height: 6),
              RichText(
                text: TextSpan(
                  text: total,
                  style: context.textTheme.titleMedium!
                      .copyWith(fontSize: 24)
                      .r(context.screenSize),
                  children: [
                    TextSpan(
                      text: ' $description',
                      style: context.textTheme.labelMedium!.copyWith(
                        fontSize: 16,
                        color: AppColors.darkGray,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          BorderIconTextButton(
            icon: Assets.icons.add,
            onTap: () => onTap!(),
          ),
        ],
      ),
    );
  }
}
// 