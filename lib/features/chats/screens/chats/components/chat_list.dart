import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../controllers/user_chat_controller.dart';
import 'chat_screen.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ChatsController.isntance;

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
              onTap: () => Get.to(
                  () => ChatScreen(userName: controller.users[index].fullName)),
              leading: AppCircularImage(
                image: controller.users[index].profilePicture,
                isNetworkImage: true,
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
