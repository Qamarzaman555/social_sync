import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class AppTermsAndConditions extends StatelessWidget {
  const AppTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${AppText.iAgreeTo} ',
                  style: Theme.of(context).textTheme.labelSmall),
              TextSpan(
                  text: '${AppText.privacyPolicy} ',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: dark ? Colors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? Colors.white : AppColors.primary,
                      )),
              TextSpan(
                  text: ' ${AppText.and} ',
                  style: Theme.of(context).textTheme.labelSmall),
              TextSpan(
                  text: '${AppText.termsOfUse} ',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: dark ? Colors.white : AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? Colors.white : AppColors.primary,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
