import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Lansdscape extends StatefulWidget {
  final VideoPlayerController? controller;
  Lansdscape({super.key, this.controller});

  @override
  State<Lansdscape> createState() => _LansdscapeState();
}

class _LansdscapeState extends State<Lansdscape> {
  Future landscapeMode() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  Future setAllorientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  void initState() {
    landscapeMode();
    super.initState();
  }

  @override
  void dispose() {
    setAllorientation();
    super.dispose();
  }

  VideoPlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          AspectRatio(
              aspectRatio: 16 / 9,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.controller!.value.isPlaying) {
                        widget.controller!.pause();
                      } else {
                        // If the video is paused, play it.
                        widget.controller!.play();
                      }
                    });
                  },
                  child: VideoPlayer(widget.controller!))),
        ],
      ),
    );
  }
}
