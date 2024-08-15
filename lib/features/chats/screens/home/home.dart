import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'components/home_appbar.dart';
import 'components/post_footer.dart';
import 'components/post_herder.dart';
import 'components/post_video_player.dart';
import 'components/posts_media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardRadiusSm * 1.6),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.cardRadiusMd,
                              vertical: AppSizes.cardRadiusLg),
                          child: const Column(
                            children: [
                              PostHeader(),
                              SizedBox(height: AppSizes.spaceBtwItems),
                              PostsMedia(),
                              SizedBox(height: AppSizes.spaceBtwItems),
                              PostFooter(),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwSections),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardRadiusSm * 1.6),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.cardRadiusMd,
                              vertical: AppSizes.cardRadiusLg),
                          child: const Column(
                            children: [
                              PostHeader(),
                              SizedBox(height: AppSizes.spaceBtwItems),
                              VideoPlayerScreen(),
                              SizedBox(height: AppSizes.spaceBtwItems),
                              PostFooter(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
