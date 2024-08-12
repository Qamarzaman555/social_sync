import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class AppCategoryShimmer extends StatelessWidget {
  const AppCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: AppSizes.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                AppShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(width: AppSizes.spaceBtwItems),

                // Text
                AppShimmerEffect(width: 55, height: 4),
              ],
            );
          },
        ));
  }
}
