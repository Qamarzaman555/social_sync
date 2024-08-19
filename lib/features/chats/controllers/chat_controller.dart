import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_bubble.model.dart';

class ChatController extends GetxController {
  ChatController(this.recieverId);
  final String recieverId;
  final messagesCollection = FirebaseFirestore.instance.collection('messages');
  final messageList = <MessageBubbleModel>[].obs;
  final scrollController = ScrollController();
  final messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchMessages(receiverId: recieverId);
  }

  void fetchMessages({required String receiverId}) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final conversationId = _getConversationId(receiverId, user.uid);

      messagesCollection
          .doc(conversationId)
          .collection('chats') // Sub-collection to store individual messages
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen((snapshot) {
        messageList.clear();
        for (var doc in snapshot.docs) {
          messageList.add(MessageBubbleModel.fromJson(doc.data()));
        }
      });
    }
  }

  void sendMessage(String value, String receiverId) {
    if (value.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final message = MessageBubbleModel(
          message: value,
          receiverId: receiverId,
          senderId: user.uid,
        );

        final conversationId = _getConversationId(receiverId, user.uid);

        messagesCollection
            .doc(conversationId)
            .collection(
                'chats') // Storing each message as a document in the 'chats' sub-collection
            .add({
          ...message.toJson(),
          'createdAt': DateTime.now(),
        });

        messageController.clear();
        scrollController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );
      }
    }
  }

  // Helper function to generate a unique conversation ID
  String _getConversationId(String receiverId, String senderId) {
    if (receiverId.compareTo(senderId) < 0) {
      return receiverId + senderId;
    } else {
      return senderId + receiverId;
    }
  }
}
