import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/widgets/app_icon_button.dart';

import 'radius_container.dart';

class ImagesCard extends StatelessWidget {
  const ImagesCard({
    required this.images,
    this.showRemoveButton = false,
    this.removeImage,
    super.key,
  });

  final List<String> images;
  final bool showRemoveButton;
  final Function(String imga)? removeImage;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: images.length > 3 ? 16 : 0,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        for (final image in images)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(image),
                  fit: BoxFit.cover,
                  height: 95.0.w(context.screenSize),
                  width: 95.0.w(context.screenSize),
                ),
              ),
              if (showRemoveButton)
                Positioned(
                  right: 4,
                  top: 4,
                  child: RadiusContainer(
                    radius: 40,
                    color: AppColors.white,
                    padding:
                        CustomEdgeInsets.all(size: context.screenSize, all: 4),
                    width: 20,
                    height: 20,
                    widget: AppIconButton(
                      icon: Assets.icons.close,
                      onTap: () => removeImage!(image),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
