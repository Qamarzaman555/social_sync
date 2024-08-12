import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'terms_and_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: AppText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(AppText.lastName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                AppValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              label: Text(AppText.username),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              label: Text(AppText.email),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              label: Text(AppText.phoneNo),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidator.validatePassword(value),
              expands: false,
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
          const SizedBox(height: AppSizes.spaceBtwSections),

          // Terms&Conditions Checkbox
          const AppTermsAndConditions(),
          const SizedBox(height: AppSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.singUp(),
                  child: const Text(AppText.createAccount))),
          const SizedBox(height: AppSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
