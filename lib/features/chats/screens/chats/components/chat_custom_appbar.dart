import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCircularImage(
            image: user.profilePicture,
            isNetworkImage: true,
            padding: 2,
            width: 36,
            height: 36,
          ),
          const SizedBox(width: AppSizes.sm),
          Text(
            user.fullName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
