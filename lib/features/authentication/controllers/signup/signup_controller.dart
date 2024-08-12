import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../personalization/models/user_model.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Obersever for hiding/showing password
  final passwordPrefixIcontoggle =
      true.obs; // Obersever for hiding/showing password
  final privacyPolicy = true.obs; // Obersever for privacyPolicy acceptance
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstName input
  final lastName = TextEditingController(); // Controller for lastName input
  final username = TextEditingController(); // Controller for username input
  final phoneNumber =
      TextEditingController(); // Controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Email and Password Sign Up
  void singUp() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'We are processign your information', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Form Validation
        if (signupFormKey.currentState!.validate()) {
          // Privacy Policy Check
          if (!privacyPolicy.value) {
            // Remove Loader
            AppFullScreenLoader.stopLoading();
            AppLoaders.warningSnackBar(
                title: 'Accrept Privacy Policy',
                message:
                    'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use');
          } else {
            // Register User in Firebase Authentication & save user data  in the Firebase
            final userCredential = await AuthenticationRepository.instance
                .registerWithEmailAndPassword(
                    email.text.trim(), password.text.trim());

            // Save Authenticated user in the Firebase Firestore
            final newUser = UserModel(
              id: userCredential.user!.uid,
              firstName: firstName.text.trim(),
              lastName: lastName.text.trim(),
              username: username.text.trim(),
              email: email.text.trim(),
              phoneNumber: phoneNumber.text.trim(),
              profilePicture: '',
            );

            final userRepository = Get.put(UserRepository());

            await userRepository.saveUserRecord(newUser);
            // Remove Loader
            AppFullScreenLoader.stopLoading();
            // Show Success Message
            AppLoaders.successSnackBar(
                title: 'Congratulations',
                message:
                    'Your account has been created! Verify email to continue.');

            // Move to Verify Email
            Get.to(() => VerifyEmailScreen(email: email.text.trim()));
          }
        } else {
          // Form is not valid so return to sign up
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
}
