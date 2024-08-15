import 'package:flutter/material.dart';

import '../../features/chats/screens/home/components/post_image.dart';
import 'image_strings.dart';

class DummyData {
  static final List<Widget> posts = [
    const PostImageWidget(image: AppImages.post1),
    const PostImageWidget(image: AppImages.post2),
    const PostImageWidget(image: AppImages.post3),
  ];

  static final List<String> videos = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ];
}
