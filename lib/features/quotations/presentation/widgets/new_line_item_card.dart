import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/common.dart';

class NewLineItemCard extends StatelessWidget {
  const NewLineItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    this.onChanged,
    this.removeFunction,
  });

  final TextEditingController title;
  final TextEditingController price;
  final TextEditingController quantity;
  final TextEditingController totalPrice;
  final Function(String)? onChanged;
  final VoidCallback? removeFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSizedBox(
              width: 130.0.w(context.screenSize),
              child: AppTextField(
                label: 'Title',
                textController: title,
              ),
            ),
            const Spacer(),
            CustomSizedBox(
              width: 130.0.w(context.screenSize),
              child: AppTextField(
                label: 'Price',
                textController: price,
                onChanged: onChanged,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const CustomSizedBox(height: 8),
        Row(
          children: [
            CustomSizedBox(
              width: 130.0.w(context.screenSize),
              child: AppTextField(
                label: 'Quantity',
                onChanged: onChanged,
                textController: quantity,
                keyboardType: TextInputType.number,
              ),
            ),
            const Spacer(),
            CustomSizedBox(
              width: 130.0.w(context.screenSize),
              child: AppTextField(
                label: 'Total price',
                textController: totalPrice,
                readOnly: true,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Spacer(),
            CustomSizedBox(
              width: 45,
              child: LinkButton(
                title: 'Cancel',
                showIcon: false,
                color: AppColors.darkGray,
                onTap: () => removeFunction!(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class LineItemData {
  final TextEditingController title;
  final TextEditingController price;
  TextEditingController quantity;
  TextEditingController totalPrice;

  LineItemData()
      : title = TextEditingController(),
        price = TextEditingController(),
        quantity = TextEditingController(),
        totalPrice = TextEditingController();
}
