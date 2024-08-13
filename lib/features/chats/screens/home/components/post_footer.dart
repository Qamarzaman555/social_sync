import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Post Description is coming ere. Te maximum leant for post description is 3 lines and after tat add readmore widet to sow te remainin description text of te post.',
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(overflow: TextOverflow.ellipsis)),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        const Divider(
          color: AppColors.grey,
        ),
        // const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            Text(540.toString()),
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.message_text)),
            Text(540.toString()),
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.send_24)),
            Text(540.toString()),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.save_add)),
          ],
        ),
      ],
    );
  }
}
