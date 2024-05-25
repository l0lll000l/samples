import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/FastLaugh/fast_laugh_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:video_player/video_player.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

final dummyvideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

class videoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const videoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);
  @override
  bool updateShouldNotify(covariant videoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static videoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<videoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterpath =
        videoListItemInheritedWidget.of(context)?.movieData.posterpath;
    final videoUrl = dummyvideoUrls[index % dummyvideoUrls.length];
    return Stack(
      children: [
        //                                                          left side
        // Container(color: Colors.accents[index % Colors.accents.length]),
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_off)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                          backgroundImage: posterpath == null
                              ? null
                              : NetworkImage('$imageAppendurl$posterpath')),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: likedVideosIdsNotifier,
                        builder: (BuildContext context, Set<int> newlikedid,
                            Widget? _) {
                          final _index = index;
                          if (newlikedid.contains(_index)) {
                            return GestureDetector(
                                onTap: () {
                                  // BlocProvider.of<FastLaughBloc>(context)
                                  //     .add(LikeVideo(id: _index));
                                  log(_index.toString());
                                  likedVideosIdsNotifier.value.remove(_index);
                                  likedVideosIdsNotifier.notifyListeners();
                                },
                                child: const VideoActionWidget(
                                    icon: Icons.emoji_emotions, title: 'lol'));
                          }
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnLikeVideo(id: _index));
                              log(_index.toString());
                              likedVideosIdsNotifier.value.add(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionWidget(
                                icon: Icons.favorite, title: 'liked'),
                          );
                        },
                      ),
                      kHeight,
                      const VideoActionWidget(
                          icon: Icons.play_circle, title: 'play'),
                      kHeight,
                      const VideoActionWidget(icon: Icons.add, title: 'add'),
                      kHeight,
                      GestureDetector(
                        onTap: () {
                          if (videoUrl != null) {
                            Share.share(videoUrl);
                            log(videoUrl);
                          }
                        },
                        child: const VideoActionWidget(
                            icon: Icons.share, title: 'share'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(title)
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
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
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
