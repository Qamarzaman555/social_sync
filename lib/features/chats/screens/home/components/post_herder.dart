import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppCircularImage(padding: 0, image: AppImages.user),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UserName", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 2),
            Text("description", style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 28,
              color: dark ? Colors.white : Colors.black,
            ))
      ],
    );
  }
}
