import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:video_player/video_player.dart';
import 'package:videoplayer/providers/button_provider.dart';

// ignore: must_be_immutable
class Fullscreen extends StatefulWidget {
  Fullscreen(
      {super.key,
      required this.controller,
      required this.videolist,
      required this.currentsate});
  VideoPlayerController? controller;
  List<String> videolist;
  int currentsate;
  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  bool ispaused = false;
  bool isrotated = false;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      if (widget.controller!.value.position >=
          widget.controller!.value.duration) {
        playnextvideo();
      }
    });
  }

  void videoplayercontroller() {
    widget.controller!.dispose();
    widget.controller =
        VideoPlayerController.file(File(widget.videolist[widget.currentsate]))
          ..initialize().then((_) {
            setState(() {
              widget.controller?.play();
              ispaused = false;
            });
          });
  }

  void playnextvideo() {
    if (widget.currentsate < widget.videolist.length - 1) {
      setState(() {
        widget.currentsate++;
        videoplayercontroller();
      });
    }
  }

  void playprevious() {
    if (widget.currentsate > 0) {
      setState(() {
        widget.currentsate--;
        videoplayercontroller();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;

    return Scaffold(
        body: SafeArea(
      child: Consumer<Buttonprovider>(
        builder: (BuildContext context, value, Widget? child) => Stack(
          children: [
            if (widget.controller != null &&
                widget.controller!.value.isInitialized)
              Transform.rotate(
                angle: value.rotation ? 3.14 / 2 : 0,
                child: SizedBox(
                    height: h,
                    width: w,
                    child: VideoPlayer(widget.controller!)),
                //  child: AspectRatio(aspectRatio: widget.controller!.value.aspectRatio,
                // child: VideoPlayer(widget.controller!),),
              )
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 50,
                  width: w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              value.rotatebutton();
                            },
                            icon: const Icon(
                              Icons.screen_rotation_alt,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.fit_screen_outlined,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              playprevious();
                            },
                            icon: const Icon(
                              Icons.skip_previous,
                              size: 30,
                            )),
                        IconButton(
                          onPressed: () {
                            value.pausedbutton();
                            if (value.paused) {
                              widget.controller!.pause();
                            } else {
                              widget.controller!.play();
                            }
                          },
                          icon: Icon(
                            value.paused ? Icons.play_arrow : Icons.pause,
                            size: 30,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              playnextvideo();
                            },
                            icon: const Icon(
                              Icons.skip_next,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.fullscreen,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 30,
                            ))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}


// // using provider

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:videoplayer/providers/videoplayer_provider.dart';
// // import 'video_player_provider.dart';

// class Fullscreen extends StatelessWidget {
//   const Fullscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var videoProvider = Provider.of<VideoPlayerProvider>(context);
//     var h = MediaQuery.sizeOf(context).height;
//     var w = MediaQuery.sizeOf(context).width;

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             if (videoProvider.controller != null &&
//                 videoProvider.controller!.value.isInitialized)
//               Transform.rotate(
//                 angle: videoProvider.isRotated ? 3.14 / 2 : 0,
//                 child: SizedBox(
//                     height: h,
//                     width: w,
//                     child: VideoPlayer(videoProvider.controller!)),
//               )
//             else
//               const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: SizedBox(
//                   height: 50,
//                   width: w,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               videoProvider.rotateScreen();
//                             },
//                             icon: const Icon(
//                               Icons.screen_rotation_alt,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.fit_screen_outlined,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               videoProvider.playPreviousVideo();
//                             },
//                             icon: const Icon(
//                               Icons.skip_previous,
//                               size: 30,
//                             )),
//                         IconButton(
//                           onPressed: () {
//                             videoProvider.togglePlayPause();
//                           },
//                           icon: Icon(
//                             videoProvider.isPaused
//                                 ? Icons.play_arrow
//                                 : Icons.pause,
//                             size: 30,
//                           ),
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               videoProvider.playNextVideo();
//                             },
//                             icon: const Icon(
//                               Icons.skip_next,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.fullscreen,
//                               size: 30,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.more_horiz,
//                               size: 30,
//                             ))
//                       ]),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
