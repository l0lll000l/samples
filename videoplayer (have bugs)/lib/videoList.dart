import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final dummyvideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final videoUrl = dummyvideoUrls[index % dummyvideoUrls.length];
    return Column(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
      ],
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _VideoPlayerController;
  @override
  void initState() {
    var url = widget.videoUrl;
    _VideoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    _VideoPlayerController.initialize().then((value) {
      setState(() {
        _VideoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: _VideoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _VideoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_VideoPlayerController),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  _VideoPlayerController.pause();
                },
                child: Text('pause')),
            ElevatedButton(
                onPressed: () {
                  _VideoPlayerController.play();
                },
                child: Text('play')),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _VideoPlayerController.dispose();
    super.dispose();
  }
}
// VideoPlayer(_VideoPlayerController)
//**************************************** */
