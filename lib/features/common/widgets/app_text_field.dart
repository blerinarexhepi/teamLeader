import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.label,
    this.minLines,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.textController,
    this.readOnly = false,
    this.required = false,
    this.labelHeight = 4,
    this.obscureText = false,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final int maxLines;
  final String? label;
  final bool required;
  final int? minLines;
  final bool readOnly;
  final String? hintText;
  final bool obscureText;
  final String? prefixIcon;
  final String? suffixIcon;
  final double labelHeight;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            '${label!}${required ? '*' : ''}',
            style: context.textTheme.bodySmall!
                .copyWith(fontSize: 13, color: AppColors.grey)
                .r(context.screenSize),
          ),
          CustomSizedBox(height: labelHeight),
        ],
        TextField(
          autocorrect: false,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          textAlign: textAlign,
          obscureText: obscureText,
          controller: textController,
          keyboardType: keyboardType,
          onChanged: onChanged,
          cursorHeight: 17.0.h(context.screenSize),
          style: context.textTheme.bodyMedium.r(context.screenSize),
          decoration: InputDecoration(
            filled: readOnly,
            fillColor: readOnly ? AppColors.gainsboro : null,
            constraints: maxLines == 1
                ? BoxConstraints.tight(
                    Size.fromHeight(40.0.h(context.screenSize)),
                  )
                : null,
            hintText: hintText,
            hintStyle: context.textTheme.bodyMedium!
                .copyWith(color: AppColors.grey)
                .r(context.screenSize),
            contentPadding: CustomEdgeInsets.symmetric(
              horizontal: 10,
              size: context.screenSize,
              vertical: maxLines != 1 ? 16 : 8,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gainsboro),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.gainsboro),
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding:
                        CustomEdgeInsets.all(all: 12, size: context.screenSize),
                    child: Assets.fromSvg(svgPath: prefixIcon!),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding:
                        CustomEdgeInsets.all(all: 12, size: context.screenSize),
                    child: Assets.fromSvg(svgPath: suffixIcon!),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
