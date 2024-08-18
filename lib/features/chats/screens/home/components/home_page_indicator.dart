import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/home_controller.dart';

class HomeIndicatorWidget extends StatelessWidget {
  const HomeIndicatorWidget({
    super.key,
    required this.dotCount,
  });

  final int dotCount;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() - 35,
      child: SmoothPageIndicator(
        effect: const JumpingDotEffect(
            dotColor: AppColors.lightContainer,
            activeDotColor: AppColors.primary,
            dotHeight: 6),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: dotCount,
      ),
    );
  }
}
