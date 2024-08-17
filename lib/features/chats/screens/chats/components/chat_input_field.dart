import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key, this.onTap, this.controller});

  final Function(String?)? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.blue),
            onPressed: () {
              // Handle add button action
            },
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onTap,
              decoration: const InputDecoration(
                hintText: 'Message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (controller != null && controller!.text.isNotEmpty) {
                onTap?.call(controller!.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
