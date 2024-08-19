import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/video_player_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonController controller = Get.put(LessonController());

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm * 1.6),
      child: FutureBuilder(
        future: controller.asyncPostLessonData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // Video player widget
                AspectRatio(
                  aspectRatio: controller.videoController!.value.aspectRatio,
                  child: VideoPlayer(controller.videoController!),
                ),
                Obx(
                  () => IconButton(
                    onPressed: () {
                      if (controller.videoController!.value.isPlaying) {
                        controller.videoController?.pause();
                      } else {
                        controller.videoController?.play();
                      }
                      controller.isPlay.value = !controller.isPlay.value;
                    },
                    icon: Card(
                      color: Colors.black12,
                      shape: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.cardRadiusSm),
                        child: Icon(
                          controller.isPlay.value
                              ? Iconsax.pause
                              : Iconsax.play,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
