import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import '../settings/settings.dart';
import 'components/change_name.dart';
import 'components/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppAppBar(
          leadingIcon: Iconsax.arrow_left,
          leadingOnPressed: () => Get.off(() => const SettingsScreen()),
          title: Text('Profile',
              style: Theme.of(context).textTheme.headlineSmall)),

      /// --  Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AppImages.user;

                      return controller.imageUploading.value
                          ? const AppShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AppCircularImage(
                              isNetworkImage: networkImage.isNotEmpty,
                              image: image,
                              width: 80,
                              height: 80,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              const AppSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Profile Indo
              AppProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              AppProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // Heading Personal Info
              AppProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              AppProfileMenu(
                title: 'Date of Birth',
                value: '21 Jan, 1999',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
