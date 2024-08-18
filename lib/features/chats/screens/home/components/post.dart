import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'post_footer.dart';
import 'post_herder.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final Widget post;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: dark ? Colors.white24 : Colors.black12,
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm * 1.6),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.cardRadiusMd, vertical: AppSizes.cardRadiusLg),
      child: Column(
        children: [
          const PostHeader(),
          const SizedBox(height: AppSizes.spaceBtwItems),
          post,
          const SizedBox(height: AppSizes.spaceBtwItems),
          const PostFooter(),
        ],
      ),
    );
  }
}
