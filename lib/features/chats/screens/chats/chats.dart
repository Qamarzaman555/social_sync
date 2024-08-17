import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_chat_controller.dart';
import 'components/chat_list.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsController controller = Get.put(ChatsController());

    return Scaffold(
      appBar: chatAppBar(context, controller),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Text("Messages",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Chat List
            const ChatList(),
          ],
        ),
      ),
    );
  }

  AppBar chatAppBar(BuildContext context, ChatsController controller) {
    return AppBar(
      title: Obx(
        () => Text(controller.currentUser.value?.fullName ?? "User",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit))],
    );
  }
}
