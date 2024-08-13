import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/app_rounded_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) =>
            const SizedBox(width: AppSizes.spaceBtwItems),
        itemBuilder: (_, index) {
          return Column(
            children: [
              AppRoundedImage(
                  height: 70,
                  borderRadius: 50,
                  border: Border.all(width: 2, color: Colors.orange),
                  imageUrl: AppImages.user),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              Text("User Name", style: Theme.of(context).textTheme.labelMedium),
            ],
          );
        },
      ),
    );
  }
}
