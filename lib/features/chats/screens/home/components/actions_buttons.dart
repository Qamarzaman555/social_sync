import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    super.key,
    this.icon,
    this.onPressed,
  });
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon,
            color: AppHelperFunctions.isDarkMode(context)
                ? Colors.white
                : Colors.black),
      ),
    );
  }
}
