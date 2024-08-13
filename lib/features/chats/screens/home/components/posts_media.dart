import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/data.dart';
import '../../../controllers/home_controller.dart';
import 'home_page_counter.dart';
import 'home_page_indicator.dart';

class PostsMedia extends StatelessWidget {
  const PostsMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Stack(
      children: [
        SizedBox(
          height: 240,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: DummyData.posts,
          ),
        ),
        if (DummyData.posts.length > 1) const PageCountWidget(),
        if (DummyData.posts.length > 1)
          HomeIndicatorWidget(dotCount: DummyData.posts.length),
      ],
    );
  }
}
