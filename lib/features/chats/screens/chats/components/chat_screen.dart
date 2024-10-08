import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../personalization/models/user_model.dart';
import '../../../controllers/chat_controller.dart';
import 'chat_bubble.dart';
import 'chat_custom_appbar.dart';
import 'chat_input_field.dart';
import 'friend_chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController(user.id));

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Column(
          children: [
            CustomAppBar(user: user),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Obx(() {
                    if (chatController.messageList.isEmpty) {
                      return const Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'No messages found\nwrite your first message..',
                        ),
                      );
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: chatController.scrollController,
                      itemCount: chatController.messageList.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      itemBuilder: (context, index) {
                        final message = chatController.messageList[index];
                        return message.receiverId ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? FriendChatBubble(messageObject: message)
                            : ChatBubble(messageObject: message);
                      },
                    );
                  }),
                ),
              ),
            ),
            ChatInputField(
              controller: chatController.messageController,
              onTap: (value) {
                chatController.sendMessage(value!, user.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
