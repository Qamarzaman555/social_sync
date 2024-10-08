import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LessonController extends GetxController {
  VideoPlayerController? videoController;
  RxBool isPlay = false.obs;

  @override
  void onClose() {
    if (videoController != null) {
      videoController?.removeListener(_videoPlayerListener);
      videoController?.pause();
      videoController?.dispose();
    }
    super.onClose();
  }

  Future<void> asyncPostLessonData() async {
    var url =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
    videoController = VideoPlayerController.networkUrl(Uri.parse(url));

    videoController?.addListener(_videoPlayerListener);

    await videoController?.initialize();
    videoController?.play();
  }

  void _videoPlayerListener() {
    if (videoController != null) {
      videoController?.addListener(() {
        if (videoController!.value.position >=
            videoController!.value.duration) {
          isPlay.value = (videoController!.value.isPlaying);
          videoController?.pause();
        } else {
          isPlay.value = true;
        }
      });
    }
  }
}
