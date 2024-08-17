import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            icon: const Icon(Iconsax.add),
            onPressed: () {
              // Handle add button action
            },
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: onTap,
              decoration: InputDecoration(
                hintText: 'Message...',
                suffixIcon: IconButton(
                    onPressed: () {
                      if (controller != null && controller!.text.isNotEmpty) {
                        onTap?.call(controller!.text);
                      }
                    },
                    icon: const Icon(Iconsax.send1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
