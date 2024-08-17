import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          leading: const AppCircularImage(
            image: AppImages.user,
            padding: 2,
            width: 44,
            height: 44,
          ),
          title: const Text("Qamar Zaman"),
          subtitle: const Text("Active 6 hours ago"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.photo_camera_outlined)),
        );
      },
    );
  }
}
