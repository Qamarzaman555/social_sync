import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_bubble.model.dart';

class ChatController extends GetxController {
  final messages = FirebaseFirestore.instance.collection('messages');
  final messageList = <MessageBubbleModel>[].obs;
  final scrollController = ScrollController();
  final messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchMessages();
  }

  void fetchMessages() {
    messages
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      messageList.clear();
      for (var doc in snapshot.docs) {
        messageList.add(MessageBubbleModel.fromJson(doc));
      }
    });
  }

  void sendMessage(String value) {
    if (value.isNotEmpty) {
      messages.add({
        'message': value,
        'createdAt': DateTime.now(),
        'uid': FirebaseAuth.instance.currentUser!.uid,
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
