import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';

class AppSocialButtons extends StatelessWidget {
  const AppSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: const Image(image: AssetImage(AppImages.google), width: 20.0),
        onPressed: () => controller.googleSignIn(),
        label: const Text(AppText.signInWithGoogle),
      ),
    );
  }
}
