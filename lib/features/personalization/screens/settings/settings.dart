import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/setting_menu_tiles.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/sizes.dart';

import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  AppAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: AppColors.white)),
                  ),

                  /// User Profile
                  AppUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const AppSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  AppSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any king of notification message',
                    onTap: () {},
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const AppSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  AppSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                    onTap: () {},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  /// -- Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
