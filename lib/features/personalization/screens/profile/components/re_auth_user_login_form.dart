import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('Re-Authenticate User',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => AppValidator.validateEmail(value),
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(AppText.email),
                    prefixIcon: Icon(Iconsax.direct),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                // Password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) => AppValidator.validatePassword(value),
                    expands: false,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        label: const Text(AppText.password),
                        prefixIcon: Icon(
                            controller.passwordPrefixIcontoggle.value
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

                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Verify'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
