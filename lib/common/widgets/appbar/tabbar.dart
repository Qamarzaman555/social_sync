import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs  you have to wrap them in Material Widget.
  /// To do that we need [PrefferedSized] Widget and that's why created custom class [PrefferedSizedWidget]
  const AppTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
        labelColor: dark ? AppColors.light : AppColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
