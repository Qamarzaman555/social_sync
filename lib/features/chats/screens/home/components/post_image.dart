import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class PostImageWidget extends StatelessWidget {
  const PostImageWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.cardRadiusMd, vertical: AppSizes.cardRadiusSm),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          image: DecorationImage(image: AssetImage(image))),
    );
  }
}
