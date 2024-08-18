import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ActivityAppBar extends StatelessWidget {
  const ActivityAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? Colors.black
          : AppColors.light,
      leadingWidth: 64,
      centerTitle: true,
      title: Text(AppText.appActivity,
          style: Theme.of(context).textTheme.headlineSmall),
      floating: true,
      snap: true,
      expandedHeight: 64.0,
    );
  }
}
