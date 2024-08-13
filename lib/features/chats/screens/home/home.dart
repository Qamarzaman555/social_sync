import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'components/actions_buttons.dart';
import 'components/home_header.dart';
import 'components/post_herder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          leading: const AppCircularImage(
            image: AppImages.user,
          ),
          title: Text(AppText.appName,
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            ActionIcon(icon: Iconsax.notification, onPressed: () {}),
            ActionIcon(icon: Iconsax.message, onPressed: () {})
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardRadiusSm * 1.6)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.cardRadiusMd,
                        vertical: AppSizes.cardRadiusLg),
                    child: Column(
                      children: [PostHeader(dark: dark)],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
