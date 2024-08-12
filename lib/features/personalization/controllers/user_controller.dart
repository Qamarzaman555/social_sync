import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../models/user_model.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/components/re_auth_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  /// Variables

  final hidePassword = true.obs; // Obersever for hiding/showing password
  final passwordPrefixIcontoggle =
      true.obs; // Obersever for hiding/showing password
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController(); // Controller for email input
  final verifyPassword =
      TextEditingController(); // Controller for password input
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  /// Fetch user record
  Future<void> fetchUserRecords() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registeration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // Refresh User Record
      // First update Rx User and then check if user data is already stored. If not stored new data
      await fetchUserRecords();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert Name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateuserName(
              userCredential.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      // Show Some Generic Error to the User
      AppLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AppSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete you account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Processing', AppImages.docerAnimation);

      /// First Re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          AppFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          AppFullScreenLoader.stopLoading();
          Get.off(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'processing', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Form Validation
        if (reAuthFormKey.currentState!.validate()) {
          await AuthenticationRepository.instance
              .reAuthenticateWithEmailAndPassword(
                  verifyEmail.text.trim(), verifyPassword.text.trim());
          await AuthenticationRepository.instance.deleteAccount();
          // Remove Loader
          AppFullScreenLoader.stopLoading();

          // Move to Verify Email
          Get.to(() => const LoginScreen());
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

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      imageUploading.value = true;
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (image != null) {
        // Upload Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        AppLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      AppLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
