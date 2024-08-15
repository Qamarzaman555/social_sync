import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'actions_buttons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? Colors.black
          : AppColors.light,
      leadingWidth: 64,
      leading: const Row(
        children: [
          SizedBox(width: 12),
          AppCircularImage(
            padding: 6,
            height: 46,
            width: 46,
            image: AppImages.user,
          ),
        ],
      ),
      title: Text(AppText.appName,
          style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        ActionIcon(icon: Iconsax.notification, onPressed: () {}),
        ActionIcon(icon: Iconsax.message, onPressed: () {})
      ],
      floating: true,
      snap: true,
      expandedHeight: 64.0,
    );
  }
}
