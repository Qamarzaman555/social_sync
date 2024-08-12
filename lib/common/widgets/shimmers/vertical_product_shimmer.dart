import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class AppVerticalProductShimmer extends StatelessWidget {
  const AppVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(
      itemCount: itemCount,
      minAxisExtent: AppDeviceUtils.getScreenHeight() * 0.33,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            AppShimmerEffect(width: 180, height: 180),
            SizedBox(height: AppSizes.spaceBtwItems),

            /// Text
            AppShimmerEffect(width: 160, height: 15),
            SizedBox(height: AppSizes.spaceBtwItems / 2),
            AppShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
