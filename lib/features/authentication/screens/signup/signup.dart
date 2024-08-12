import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/login_signup/app_form_divider.dart';
import '../../../../common/widgets/login_signup/social_btns.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'components/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Title
              Text(AppText.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              const SignUpForm(),

              // Divider
              AppFormDivider(dividerText: AppText.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Footer
              const AppSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
