import 'dart:async';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';

class NewsLiveVideo extends StatefulWidget {
  NewsLiveVideo({super.key, this.index, this.name});
  final int? index;
  final String? name;

  @override
  State<NewsLiveVideo> createState() => _NewsLiveVideoState();
}

class _NewsLiveVideoState extends State<NewsLiveVideo> {
  VideoPlayerController? _controller;
  var url = [
    'http://sabot.instastream.in:8885/ENTER_10_MO/ENTER_10_MO.m3u8',
    'http://sabot.instastream.in:8888/MUSIC/MOCLASSIC.m3u8',
    'http://sabot.instastream.in:8888/MOVIE/MO1.m3u8',
    'https://livectv.phando.com/8060/playlist.m3u8',
  ];

  List videosfiles = [
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
  ];
  int _buttonClickCount = 0;
  bool _showWidget = false;

  void _handleButtonClick() {
    setState(() {
      _buttonClickCount++;
      if (_buttonClickCount % 1 == 0) {
        _showWidget = true;
        Timer(Duration(seconds: 2), () {
          setState(() {
            _showWidget = false;
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(url[widget.index!])
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });
      });
  }

  bool _isButtonPressed = false;

  var shouldShow = true;
  var _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    final isMuted = _controller!.value.volume == 0;
    return Scaffold(
      backgroundColor: black,
      // appBar: _controller!.value.isPlaying
      //     ? null
      //     : AppBar(
      //         backgroundColor: Colors.black,
      //         title: Text(widget.name!),
      //       ),
      appBar: AppBar(
        backgroundColor: black,
        toolbarHeight: 15,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: 18 / 9,
                          child: InkWell(
                              focusColor: Colors.blue,
                              onTap: () {
                                _handleButtonClick();
                                setState(() {
                                  _showWidget = true;
                                  if (_controller!.value.isPlaying) {
                                    _controller!.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    _controller!.play();
                                  }
                                });
                              },
                              child: VideoPlayer(_controller!)),
                        )
                      : Container(),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: _showWidget
                        ? InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              setState(() {
                                _controller!.value.isPlaying
                                    ? _controller!.pause()
                                    : _controller!.play();
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 30,
                              child: Icon(
                                _controller!.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 50,
                                color: screenbackground,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
            _showWidget
                ? Container(
                    // height: 100.h,
                    width: 1000.0.w,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          focusColor: Colors.red,
                          onTap: () {
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                          child: Container(
                            child: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.stop
                                  : Icons.play_arrow,
                              size: 35,
                              color: screenbackground,
                            ),
                          ),
                        ),
                        _controller != null && _controller!.value.isInitialized
                            ? InkWell(
                                focusColor: Colors.red,
                                onTap: () {
                                  setState(() {
                                    _controller!.setVolume(isMuted ? 1 : 0);
                                  });
                                },
                                child: Icon(
                                  isMuted
                                      ? Icons.volume_off
                                      : Icons.volume_up_outlined,
                                  size: 30,
                                  color: screenbackground,
                                ))
                            : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 10,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Live',
                                  style: toptitleStylebold,
                                ),
                              ),
                            ),
                            Container(
                                height: 40.h,
                                width: 100.w,
                                child: Image.asset('assets/images/clive1.png')),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              focusColor: Colors.red,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Lansdscape(
                                    controller: _controller,
                                  ),
                                ));
                              },
                              child: Container(
                                child: Icon(
                                  Icons.fullscreen,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            //   child: Column(
            //     children: [
            //       Text(
            //         liveTvDetailsController
            //             .livetvdetails[0].videoStreamingApp.tvTitle
            //             .toString(),
            //         style: GoogleFonts.poppins(
            //           textStyle: TextStyle(
            //               letterSpacing: 0.2,
            //               fontSize: 18.00,
            //               color: Color.fromARGB(255, 167, 29, 19),
            //               fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       // CategoryContent()
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
