import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'components/onboarding_navigation.dart';
import 'components/onboarding_next.dart';
import 'components/onboarding_page.dart';
import 'components/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppText.onBoardingTitle1,
                subTitle: AppText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: AppText.onBoardingTitle2,
                subTitle: AppText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: AppText.onBoardingTitle3,
                subTitle: AppText.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          const OnBoardingNavigation(),
          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
