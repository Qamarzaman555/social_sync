import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); // Controller for email input

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'Processign your request...', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Form Validation
        if (forgotPasswordFormKey.currentState!.validate()) {
          // Send email to reset password
          await AuthenticationRepository.instance
              .sendPasswordResetEmail(email.text.trim());

          // Remove Loader
          AppFullScreenLoader.stopLoading();

          // Show Success Message
          AppLoaders.successSnackBar(
              title: 'Email Sent',
              message: 'Email Link Sent to Reset your Password.'.tr);

          // Redirect
          Get.to(() => ResetPasswordScreen(email: email.text.trim()));
        } else {
          // Remove Loader
          AppFullScreenLoader.stopLoading();
        }
      }
    } catch (e) {
      // Remove Loader
      AppFullScreenLoader.stopLoading();

      // Show Some Generic Error to the User
      AppLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'Processign your request...', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Send email to reset password
        await AuthenticationRepository.instance.sendPasswordResetEmail(email);

        // Remove Loader
        AppFullScreenLoader.stopLoading();

        // Show Success Message
        AppLoaders.successSnackBar(
            title: 'Email Sent',
            message: 'Email Link Sent to Reset your Password.'.tr);
      }
    } catch (e) {
      // Remove Loader
      AppFullScreenLoader.stopLoading();

      // Show Some Generic Error to the User
      AppLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
