import 'package:flutter/material.dart';

import 'shimmer.dart';

class AppListTileShimmer extends StatelessWidget {
  const AppListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
          (index) => const ListTile(
                leading: AppShimmerEffect(width: 50, height: 50, radius: 50),
                title: AppShimmerEffect(width: 70, height: 15),
                subtitle: AppShimmerEffect(width: 50, height: 12),
                trailing: AppShimmerEffect(
                  width: 32,
                  height: 32,
                  radius: 4,
                ),
              )),
    );
  }
}

/* 
ListTile(
          leading: AppShimmerEffect(width: 50, height: 50, radius: 50),
          title: AppShimmerEffect(width: 70, height: 15),
          subtitle: AppShimmerEffect(width: 50, height: 12),
          trailing: AppShimmerEffect(
            width: 32,
            height: 32,
            radius: 4,
          ),
        )
 */
