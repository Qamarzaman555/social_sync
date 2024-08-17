import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'components/home_appbar.dart';
import 'components/post.dart';

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
            /// AppBar
            const HomeAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Post 1
                        Post(post: PostsMedia()),
                        SizedBox(height: AppSizes.spaceBtwSections),

                        /// Post 2
                        Post(post: VideoPlayerScreen()),
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
