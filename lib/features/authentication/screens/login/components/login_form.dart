import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              validator: (value) => AppValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AppText.email),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    AppValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    label: const Text(AppText.password),
                    prefixIcon: Icon(controller.passwordPrefixIcontoggle.value
                        ? Iconsax.password_check
                        : Iconsax.password_check5),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                        controller.passwordPrefixIcontoggle.value =
                            !controller.passwordPrefixIcontoggle.value;
                      },
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            // Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(AppText.rememberMe)
                  ],
                ),

                // Forget Password

                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(AppText.forgetPassword))
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(AppText.signIn))),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(AppText.createAccount))),
          ],
        ),
      ),
    );
  }
}
