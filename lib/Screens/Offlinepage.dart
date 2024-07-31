import 'dart:io';

import 'package:flutter/material.dart';

import 'package:list_all_videos/list_all_videos.dart';
import 'package:list_all_videos/thumbnail/ThumbnailTile.dart';

import 'package:video_player/video_player.dart';
import 'package:videoplayer/Screens/FullScreen.dart';
import 'package:videoplayer/customwidgets/Custom_listtile.dart';

class Offlinepage extends StatefulWidget {
  const Offlinepage({super.key});

  @override
  State<Offlinepage> createState() => _OfflinepageState();
}

class _OfflinepageState extends State<Offlinepage> {
  VideoPlayerController? _controller;
  String? currentvideopath;
  // void initState() {
  //   super.initState();
  //   requestpermission();
  // }

  //  final File _videos;
  // Future requestpermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     setState(() {});
  //   } else {
  //     return ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Storage permission denied")));
  //   }
  // }
  @override
  void initState() {
    super.initState();
  }

  void initVideoController(String path) {
    _controller?.dispose();
    _controller = VideoPlayerController.file(File(path))
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      });
    currentvideopath = path;
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ListAllVideos().getAllVideosPath(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  if (_controller != null &&
                      _controller!.value.isInitialized &&
                      currentvideopath != null)
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 170,
                            width: 240,
                            child: AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!)),
                          ),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: IconButton(
                                highlightColor: Colors.orange,
                                onPressed: () {
                                  _controller?.pause();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (cxt) => Fullscreen(
                                                controller: _controller,
                                                videolist: snapshot.data!,
                                                currentsate: snapshot.data!
                                                    .indexWhere(
                                                        (videofullscreen) {
                                                  return videofullscreen
                                                          .videoPath ==
                                                      currentvideopath;
                                                }),
                                              )));

                                  _controller?.play();
                                },
                                icon: Icon(
                                  Icons.fullscreen_outlined,
                                  size: 35,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final video = snapshot.data![index];
                        final key = video.videoName;

                        return CustomListtile(
                          dismissiblekey: key,
                          thumbnail: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ThumbnailTile(
                                width: 80,
                                height: 60,
                                thumbnailController: video.thumbnailController),
                          ),
                          titletext: video.videoName,
                          timetext: video.videoSize,
                          onTap: () {
                            initVideoController(
                                snapshot.data![index].videoPath);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("error:${snapshot.error}"));
            } else {
              return const Center(child: Text("Videos not Found"));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Container(
        height: 55,
        width: 55,
        child: FloatingActionButton(
            child: Icon(Icons.play_arrow_rounded, size: 40),
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
