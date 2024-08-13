import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class PageCountWidget extends StatelessWidget {
  const PageCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Positioned(
      top: 25,
      right: 25,
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sm * 1.5, vertical: AppSizes.xs),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Obx(
            () => Text(
              "${controller.currentPageIndex.value + 1}/3",
              style: const TextStyle(color: Colors.black),
            ),
          )),
    );
  }
}
