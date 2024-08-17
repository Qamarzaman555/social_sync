import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/user_chat_controller.dart';
import 'chat_screen.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ChatsController controller = Get.put(ChatsController());

    return Obx(
      () {
        if (controller.users.isEmpty) {
          return const Center(
            child: Text(
              textAlign: TextAlign.center,
              'No users found..',
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.users.length,
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () => Get.to(() => ChatScreen()),
              leading: const AppCircularImage(
                image: AppImages.user,
                padding: 2,
                width: 44,
                height: 44,
              ),
              title: Text(controller.users[index].fullName),
              subtitle: const Text("Active 6 hours ago"),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_camera_outlined)),
            );
          },
        );
      },
    );
  }
}
