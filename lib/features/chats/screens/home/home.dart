import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'components/actions_buttons.dart';
import 'components/home_header.dart';
import 'components/post_footer.dart';
import 'components/post_herder.dart';
import 'components/posts_media.dart';
import '../video_player/video.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppbar(context),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),
                const SizedBox(height: AppSizes.spaceBtwSections),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                              AppSizes.cardRadiusSm * 1.6)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.cardRadiusMd,
                          vertical: AppSizes.cardRadiusLg),
                      child: const Column(
                        children: [
                          // ignore: prefer_const_constructors
                          PostHeader(),
                          SizedBox(height: AppSizes.spaceBtwItems),
                          PostsMedia(),
                          SizedBox(height: AppSizes.spaceBtwItems),
                          PostFooter()
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                              AppSizes.cardRadiusSm * 1.6)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.cardRadiusMd,
                          vertical: AppSizes.cardRadiusLg),
                      child: const Column(
                        children: [
                          // ignore: prefer_const_constructors
                          PostHeader(),
                          SizedBox(height: AppSizes.spaceBtwItems),
                          VideoPlayerScreen(),
                          SizedBox(height: AppSizes.spaceBtwItems),
                          PostFooter()
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppAppBar homeAppbar(BuildContext context) {
    return AppAppBar(
      leading: const AppCircularImage(
        image: AppImages.user,
      ),
      title: Text(AppText.appName,
          style: Theme.of(context).textTheme.headlineMedium),
      actions: [
        ActionIcon(icon: Iconsax.notification, onPressed: () {}),
        ActionIcon(icon: Iconsax.message, onPressed: () {})
      ],
    );
  }
}
