import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import 'user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Varidables
  final firstName = TextEditingController(); // Controller for firstName input
  final lastName = TextEditingController(); // Controller for lastName input
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'We are updating your information...', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Form Validation
        if (updateUserNameFormKey.currentState!.validate()) {
          // Update user's first & last name in the Firebase Firestore
          Map<String, dynamic> name = {
            'FirstName': firstName.text.trim(),
            'LastName': lastName.text.trim(),
          };
          await userRepository.updateSingleField(name);

          // Update the Rx User value
          userController.user.value.firstName = firstName.text.trim();
          userController.user.value.lastName = lastName.text.trim();

          // Remove Loader
          AppFullScreenLoader.stopLoading();

          // Show Success Message
          AppLoaders.successSnackBar(
              title: 'Congratulations', message: 'Your Name has been updated.');

          // Move to previous screen
          Get.offAll(() => const NavigationMenu());
        } else {
          // Form is not valid so return to update name screen
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
