import 'dart:async';

import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:video_player/video_player.dart';

import '../../../utils/colors.dart';
import '../../../utils/landscape.dart';
import '../category/category_content.dart';
import 'package:flutter/services.dart';
import 'package:is_tv/is_tv.dart';


class SliderVideos extends StatefulWidget {
  SliderVideos({
    super.key,
    this.index,
  });
  final int? index;
  // final String? name;

  @override
  State<SliderVideos> createState() => _SliderVideosState();
}

class _SliderVideosState extends State<SliderVideos> {
  VideoPlayerController? _controller;
  var selectedindex = 0;
  var url = [
    'https://cherritech.us/ott/upload/source/Ratatouille.mp4',
    "https://cherritech.us/ott/upload/source/Disneys Encanto _ Official Trailer.mp4",
    'https://cherritech.us/ott/upload/source/Marvel Studios Doctor Strange in the Multiverse of Madness _ Official Trailer.mp4',
    'https://cherritech.us/ott/upload/source/Ratatouille.mp4',
    "https://cherritech.us/ott/upload/source/Disneys Encanto _ Official Trailer.mp4",
    'https://cherritech.us/ott/upload/source/Marvel Studios Doctor Strange in the Multiverse of Madness _ Official Trailer.mp4',
  ];

  List videosfiles = [
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
  ];
  List castimages = [
    'assets/slider/cast1.jpg',
    'assets/slider/cast2.jpg',
    'assets/slider/cast7.jfif',
    'assets/slider/cast4.jfif',
    'assets/slider/cast5.jpg',
    'assets/slider/cast6.jfif',
  ];
  List follow = [
    'assets/slider/facebook.png',
    'assets/slider/twitter.png',
    'assets/slider/insta.png',
  ];
  List tv = [
    'assets/slider/samsung.png',
  ];
  bool? _isTV;
  final _isTVPlugin = IsTV();
  int _buttonClickCount = 0;
  bool _showWidget = false;
  Future<void> initPlatformState() async {
    bool? isTV;

    try {
      isTV = await _isTVPlugin.check() ?? false;
    } on PlatformException {
      isTV = false;
    }

    if (!mounted) return;

    setState(() {
      _isTV = isTV ?? false;
    });
  }

  void _handleButtonClick() {
    setState(() {
      _buttonClickCount++;
      if (_buttonClickCount % 1 == 0) {
        _showWidget = true;
        Timer(Duration(seconds: 3), () {
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
    initPlatformState();

    _controller = VideoPlayerController.network(
        'https://60e68b19dd194.streamlock.net:55/madhatv/madhatv.stream_HDp/playlist.m3u8')
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
      backgroundColor: black1,
      // appBar: AppBar(
      //   backgroundColor: black,
      //   toolbarHeight: 10,
      // ),
      // appBar: _controller!.value.isPlaying
      //     ? null
      //     : AppBar(
      //         backgroundColor: Colors.black,
      //         title: Text(widget.name!),
      //       ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: screenbackground,
                              ),
                            ),
                            SizedBox(
                              width: 2.0.wp,
                            ),
                            Text(
                              'Enthiran ( 4K )',
                              style: toptitleStylebold,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TamilAction| ,Sci-Fi | 2023 | 177 Mins',
                              style: forminputstylewhite,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 3.0.hp,
                                  width: 4.0.wp,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: screenbackground),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    'ALL',
                                    style: datetimecolor,
                                  )),
                                ),
                                SizedBox(
                                  width: 1.0.wp,
                                ),
                                Container(
                                  height: 3.0.hp,
                                  width: 4.0.wp,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: screenbackground),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    'HD',
                                    style: datetimecolor,
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 40.0.wp,
                              child: Text(
                                '''Vaseegaran, a brilliant scientist, builds Chitti, a unique robot, who is programmed to protect mankind and also feel human emotions. Problems arise when Chitti falls in love with his girlfriend.''',
                                style: slidertext,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                height: 5.0.hp,
                                width: 10.0.wp,
                                decoration: BoxDecoration(
                                    color: Color(0xff9f181b),
                                    borderRadius: BorderRadius.circular(50),
                                    border:
                                        Border.all(color: Color(0xff9f181b))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      _controller!.value.isPlaying
                                          ? Icons.play_arrow
                                          : Icons.pause,
                                      size: 15,
                                      color: screenbackground,
                                    ),
                                    Center(
                                      child: Text(
                                        _controller!.value.isPlaying
                                            ? 'Play'
                                            : 'Pause',
                                        style: datetimecolor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0.hp),
                            Row(
                              children: [
                                Icon(
                                  Icons.format_list_bulleted_add,
                                  color: screenbackground,
                                ),
                                SizedBox(
                                  width: 1.0.wp,
                                ),
                                Text(
                                  'WatchList',
                                  style: datetimecolor,
                                ),
                                SizedBox(
                                  width: 1.0.wp,
                                ),
                                Text(
                                  '|',
                                  style: toptitleStylebold,
                                ),
                                SizedBox(
                                  width: 1.0.wp,
                                ),
                                Icon(
                                  Icons.share,
                                  color: screenbackground,
                                ),
                                SizedBox(
                                  width: 1.0.wp,
                                ),
                                Text(
                                  'Share',
                                  style: datetimecolor,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.0.hp,
                      width: 55.0.wp,
                      child: Center(
                        child: _controller!.value.isInitialized
                            ? InkWell(
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
                                child: VideoPlayer(_controller!))
                            : Container(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50),
                          // color: Colors.grey.withOpacity(0.2),
                          ),
                      height: 40.h,
                      width: 50.0.wp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _controller != null &&
                                  _controller!.value.isInitialized
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
                                    color: screenbackground,
                                  ))
                              : Container(),
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              _controller!.seekTo(Duration(
                                  seconds:
                                      _controller!.value.position.inSeconds -
                                          10));
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_double_arrow_left_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              setState(() {
                                _controller!.value.isPlaying
                                    ? _controller!.pause()
                                    : _controller!.play();
                              });
                            },
                            child: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 15,
                              color: screenbackground,
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              _controller!.seekTo(Duration(
                                  seconds:
                                      _controller!.value.position.inSeconds -
                                          10));
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_double_arrow_right_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
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
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Cast',
                style: toptitleStylebold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 2.0,
                width: 4.0.wp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                  height: 20.0.hp,
                  width: 100.0.wp,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: castimages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    castimages[index],
                                  )),
                            )
                          ],
                        );
                      })),
            ),
            Container(
              height: 20.0.hp,
              width: 100.0.wp,
              color: Color(0xff262626),
              child: Column(children: [
                Container(
                  height: 8.0.hp,
                  width: 100.0.wp,
                  color: Color(0xff9f181b),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/clive1.png',
                        color: screenbackground,
                      ),
                      Container(
                        width: 80.0.wp,
                        child: Center(
                          child: Text(
                            'HOME | MOVIES | TV SHOWS | LIVE TV | MUSIC VIDEOS | COMEDY',
                            style: datetimecolor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About us | Feedback | FAQS | Privacy Policy | Terms of use | Cookie Policy | ',
                            style: datetimecolor,
                          ),
                          Text(
                            'Content Redressal mechanism',
                            style: datetimecolor,
                          ),
                          // Container(
                          //   width: 50.0.wp,
                          //   child: Text(
                          //     '''copyright @2022 CLIVE  all related channels,content,movies,image,visuals,clips,logos,programs and music are property of clive TV Network Ltd.., All Right Reserved''',
                          //     style: datetimecolor,
                          //   ),
                          // )
                          Text(
                            'Version: 2.0.0',
                            style: datetimecolor,
                          )
                        ],
                      ),
                      Container(
                        height: 8.0.hp,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Follow us',
                            style: forminputstyle,
                          ),
                          Container(
                              height: 6.0.hp,
                              width: 14.0.wp,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: follow.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: CircleAvatar(
                                              radius: 10,
                                              backgroundImage: AssetImage(
                                                follow[index],
                                              )),
                                        )
                                      ],
                                    );
                                  })),
                        ],
                      ),
                      Container(
                        height: 8.0.hp,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Also Available on',
                            style: forminputstyle,
                          ),
                          Container(
                              child: Image.asset(
                            'assets/slider/lg.png',
                            height: 3.0.hp,
                            width: 20.0.wp,
                            fit: BoxFit.fill,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
