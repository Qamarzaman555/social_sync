import 'package:flutter/material.dart';

import '../layouts/grid_layout.dart';
import 'shimmer.dart';

class AppBrandShimmer extends StatelessWidget {
  const AppBrandShimmer({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(
      minAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const AppShimmerEffect(width: 300, height: 80),
    );
  }
}
