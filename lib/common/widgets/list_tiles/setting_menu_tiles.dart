import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';

class AppSettingMenuTile extends StatelessWidget {
  const AppSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: AppColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleSmall!),
      subtitle: subtitle != null
          ? Text(subtitle ?? '', style: Theme.of(context).textTheme.labelSmall!)
          : null,
      trailing: trailing,
    );
  }
}
