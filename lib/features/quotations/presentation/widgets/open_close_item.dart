import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/common.dart';

import 'title_description_row.dart';

class OpenCloseItem extends StatefulWidget {
  const OpenCloseItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  final String title;
  final String price;
  final String quantity;
  final String totalPrice;

  @override
  State<OpenCloseItem> createState() => _OpenCloseItemState();
}

class _OpenCloseItemState extends State<OpenCloseItem> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () => setState(() {
                open = !open;
              }),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.charcoal),
                  ),
                  const Spacer(),
                  AppIconButton(
                    width: 16,
                    iconColor: AppColors.darkGray,
                    icon: !open ? Assets.icons.arrowDown : Assets.icons.arrowUp,
                    onTap: () => setState(() {
                      open = !open;
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
        const CustomSizedBox(height: 8),
        if (open)
          Padding(
            padding: CustomEdgeInsets.symmetric(
                size: context.screenSize, horizontal: 8),
            child: Row(
              children: [
                CustomSizedBox(
                  width: 75.0.w(context.screenSize),
                  child: TitleDescriptionRow(
                    title: 'Price',
                    description: widget.price,
                  ),
                ),
                const Spacer(),
                CustomSizedBox(
                  width: 75.0.w(context.screenSize),
                  child: TitleDescriptionRow(
                    title: 'Quantity',
                    description: widget.quantity,
                  ),
                ),
                const Spacer(),
                CustomSizedBox(
                  width: 75.0.w(context.screenSize),
                  child: TitleDescriptionRow(
                    title: 'Total price',
                    description: widget.totalPrice,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
