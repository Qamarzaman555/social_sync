import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../common/widgets/login_signup/app_form_divider.dart';
import 'components/login_form.dart';
import 'components/login_header.dart';
import '../../../../common/widgets/login_signup/social_btns.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: AppSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo,Title and Sub-Title
            const LoginHeader(),

            // Form
            const LoginForm(),

            // Divider
            AppFormDivider(dividerText: AppText.orSignInWith.capitalize!),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Footer
            const AppSocialButtons(),
          ],
        ),
      ),
    ));
  }
}
