import 'package:flutter/material.dart';
import '../../../models/message_bubble.model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageObject});
  final MessageBubbleModel messageObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          messageObject.message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
