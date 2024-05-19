import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:video_player/video_player.dart';

import '../../../utils/colors.dart';
import '../../../utils/landscape.dart';
import '../../../utils/textstyles.dart';

class CliveVideos extends StatefulWidget {
  CliveVideos({super.key, this.index, this.name});
  final int? index;
  final String? name;

  @override
  State<CliveVideos> createState() => _CliveVideosState();
}

class _CliveVideosState extends State<CliveVideos> {
  VideoPlayerController? _controller;
  var url = [
    // 'https://yuppindottclorigin.akamaized.net/240122/kalaignartv/playlist.m3u8?hdnts=st=1682591878~exp=1682595478~acl=*~data=yuppTVCom_5_22781924_4410531489944d9e_IN_106.197.81.97~hmac=4f1135892c9da2f6c538e92e97ea1ebb07aac83ff5c0150171ad6e85567de013',
    // 'https://yuppindottclorigin.akamaized.net/140622/isaiaruvi/playlist.m3u8?hdnts=st=1682593598~exp=1682597198~acl=*~data=yuppTVCom_5_22781924_4410531489944d9e_IN_106.197.81.97~hmac=f10318365f67c68d6afec1663c4d5fa5965a495ee54bdc62c95d7103801d9844',
    // 'https://yuppindottclorigin.akamaized.net/240122/siripoli/playlist.m3u8?hdnts=st=1682592916~exp=1682596516~acl=*~data=yuppTVCom_5_22781924_4410531489944d9e_IN_106.197.81.97~hmac=016c7cebf72a20d09641d3fbbd24a5ce89e60c83fa131115ac10263a33eacb7a',
    'http://10.8.0.2:1935/deepamtv/deepamhd/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/captain.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/murasu.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/news7.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/polimer.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/vasanth.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/madhatv/madhatv.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/divyavani/divyavani.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/malar.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/newsj.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/tv5.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/sangamam.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/neyam/neyamhd/playlist.m3u8',
    'http://199.168.96.106:1935/blessingtv-tamillive/mystream/chunklist_w365086533.m3u8',
    'https://idvd.multitvsolution.com/idvo/imayamtv.m3u8',
    'https://rtmp.smartstream.video/velichamtv/velichamtv/playlist.m3u8',
    'https://6n3yope4d9ok-hls-live.5centscdn.com/vaanavil/TV.stream/playlist.m3u8',
    'https://gvjygr2jloem-hls-live.5centscdn.com/shalini/live.stream/playlist.m3u8',
    'https://5k8q87azdy4v-hls-live.wmncdn.net/MAKKAL/271ddf829afeece44d8732757fba1a66.sdp/mono.m3u8',
    'http://sabot.instastream.in:8884/MO_LUMIERE/MO_LUMIERE.m3u8'
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
        Timer(Duration(seconds: 5), () {
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: 16 / 8,
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
            // _showWidget
            //     ? InkWell(
            //         focusColor: Colors.red,
            //         onTap: () {
            //           setState(() {
            //             _controller!.value.isPlaying
            //                 ? _controller!.pause()
            //                 : _controller!.play();
            //           });
            //         },
            //         child: Icon(
            //           _controller!.value.isPlaying
            //               ? Icons.pause
            //               : Icons.play_arrow,
            //           size: 50,
            //           color: screenbackground,
            //         ),
            //       )
            //     : Container(),
            // _showWidget
            //     ? Padding(
            //         padding: const EdgeInsets.only(left: 20.0, right: 20),
            //         child: Container(
            //           //height: 40.h,
            //           width: 1000.0.w,
            //           decoration: BoxDecoration(
            //               color: Color.fromARGB(255, 241, 234, 234)
            //                   .withOpacity(0.2),
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               InkWell(
            //                 focusColor: Colors.red,
            //                 onTap: () {
            //                   setState(() {
            //                     _controller!.value.isPlaying
            //                         ? _controller!.pause()
            //                         : _controller!.play();
            //                   });
            //                 },
            //                 child: Container(
            //                   child: Icon(
            //                     _controller!.value.isPlaying
            //                         ? Icons.stop
            //                         : Icons.play_arrow,
            //                     size: 35,
            //                     color: screenbackground,
            //                   ),
            //                 ),
            //               ),

            //               _controller != null &&
            //                       _controller!.value.isInitialized
            //                   ? InkWell(
            //                       focusColor: Colors.red,
            //                       onTap: () {
            //                         setState(() {
            //                           _controller!.setVolume(isMuted ? 1 : 0);
            //                         });
            //                       },
            //                       child: Icon(
            //                         isMuted
            //                             ? Icons.volume_off
            //                             : Icons.volume_up_outlined,
            //                         size: 30,
            //                         color: screenbackground,
            //                       ))
            //                   : Container(),

            //               // Container(
            //               //   width: 280.h,
            //               //   child: VideoProgressIndicator(
            //               //     _controller!,
            //               //     allowScrubbing: true,
            //               //     colors: const VideoProgressColors(
            //               //       backgroundColor: Colors.red,
            //               //       // bufferedColor: Colors.yellow,
            //               //       playedColor: Color(0xff18BAE8),
            //               //     ),
            //               //   ),
            //               // ),

            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Container(
            //                     height: 10,
            //                     width: 20,
            //                     decoration: BoxDecoration(
            //                         shape: BoxShape.circle, color: Colors.red),
            //                   ),
            //                   Container(
            //                     height: 50,
            //                     child: Center(
            //                       child: Text(
            //                         'Live',
            //                         style: toptitleStylebold,
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                       height: 40.h,
            //                       width: 100.w,
            //                       child:
            //                           Image.asset('assets/images/clive1.png')),
            //                   SizedBox(
            //                     width: 20,
            //                   ),
            //                   InkWell(
            //                     focusColor: Colors.red,
            //                     onTap: () {
            //                       Navigator.of(context).push(MaterialPageRoute(
            //                         builder: (context) => Lansdscape(
            //                           controller: _controller,
            //                         ),
            //                       ));
            //                     },
            //                     child: Container(
            //                       child: Icon(
            //                         Icons.fullscreen,
            //                         color: Colors.white,
            //                         size: 30,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       )
            //     : Container(),
            _showWidget
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    height: 50.h,
                    width: double.infinity,
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
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 30,
                              color: screenbackground,
                            ),
                          ),
                        ),
                        Image.asset('assets/images/clive1.png'),
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
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Center(
                              child: Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    _showWidget = false;
  }
}
