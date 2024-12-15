import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/widgets/app_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.pageTitle,
    this.onBack,
    this.buttonTitle,
    this.buttonFunction,
    this.iconButton = false,
    this.showBackButton = true,
    super.key,
  });

  final bool iconButton;
  final String pageTitle;
  final String? buttonTitle;
  final bool showBackButton;
  final VoidCallback? onBack;
  final VoidCallback? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 1,
      backgroundColor: AppColors.white,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: AppIconButton(
                  icon: Assets.icons.arrowLeft,
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                    } else {
                      context.pop();
                    }
                  }),
            )
          : null,
      title: Text(
        pageTitle,
        style:
            context.textTheme.titleMedium!.copyWith(color: AppColors.irisBlue),
      ),
      // actions: [
      //   // if (showAddFunction)
      //   // Padding(
      //   //   padding: CustomEdgeInsets.only(right: 24, size: context.screenSize),
      //   //   child: BorderIconTextButton(
      //   //     icon: Assets.icons.add,
      //   //     onTap: () {},
      //   //     // onTap: () => addFunction!(),
      //   //   ),
      //   // ),
      // ],
    );
  }
}
