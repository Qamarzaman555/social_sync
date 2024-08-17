import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 110,
      color: Colors.transparent,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          userName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSurface,
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
