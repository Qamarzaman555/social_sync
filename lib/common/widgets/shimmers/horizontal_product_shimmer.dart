import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer.dart';

class AppHorizontalProductShimmer extends StatelessWidget {
  const AppHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: AppSizes.spaceBtwItems),
        itemBuilder: (_, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            AppShimmerEffect(width: 120, height: 120),
            SizedBox(width: AppSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 160, height: 15),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 110, height: 15),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                AppShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
