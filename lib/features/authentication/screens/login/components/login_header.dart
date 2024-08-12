import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 120,
          width: Get.width * 0.5,
          image: const AssetImage(AppImages.smallAppLogo),
        ),
        Text(AppText.loginTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(fontSizeDelta: 5)),
        const SizedBox(height: AppSizes.sm),
        Text(AppText.loginSubTitle,
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
