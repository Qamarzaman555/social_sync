import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  final double pageWidth = Get.width;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
    debugPrint(currentPageIndex.value.toString());
  }

  // Jump to specific dot selected page
  dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index * pageWidth);
  }
}
