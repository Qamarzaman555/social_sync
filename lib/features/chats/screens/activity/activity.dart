import 'package:flutter/material.dart';
import 'package:social_sync/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'components/acitivty_appbar.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            /// AppBar
            const ActivityAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Text
                        Text(AppText.appActivity,
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: AppSizes.spaceBtwSections),
                        ActivityTile(dark: dark),
                        Divider(),
                        ActivityTile(dark: dark)
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

class ActivityTile extends StatelessWidget {
  const ActivityTile({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: AppColors.light.withOpacity(0.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusXs)),
      leading: const AppCircularImage(
        image: AppImages.user,
        // isNetworkImage: true,
        padding: 2,
        width: 44,
        height: 44,
      ),
      title: const Row(
        children: [
          Text('UserName'),
          SizedBox(width: AppSizes.spaceBtwItems),
          Text('time'),
        ],
      ),
      subtitle: const Text("Following You"),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.sm, vertical: AppSizes.sm),
        decoration: BoxDecoration(
          border: Border.all(color: dark ? AppColors.light : AppColors.dark),
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusMd),
        ),
        // onPressed: () {},
        child: Text(
          'Follow',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(fontSizeFactor: 0.8),
        ),
      ),
    );
  }
}
