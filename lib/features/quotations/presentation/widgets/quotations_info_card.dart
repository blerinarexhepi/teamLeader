import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/quotations/presentation/widgets/radius_container.dart';

class QuotationsInfoCard extends StatelessWidget {
  const QuotationsInfoCard({
    super.key,
    required this.name,
    required this.price,
    required this.company,
    this.moreFunction,
    this.onTap,
  });

  final String name;
  final String price;
  final String company;
  final VoidCallback? onTap;
  final VoidCallback? moreFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: RadiusContainer(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: context.textTheme.labelLarge!
                  .copyWith(fontWeight: FontWeight.w600)
                  .r(context.screenSize),
            ),
            const CustomSizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSizedBox(
                  width: 200,
                  child: Text(
                    company,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      color: AppColors.charcoal,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: AppColors.charcoal,
                  ),
                ),
              ],
            ),
            // const CustomSizedBox(height: 8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       id,
            //       style: context.textTheme.bodyMedium!.copyWith(
            //         fontSize: 13,
            //         color: AppColors.grey,
            //       ),
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
