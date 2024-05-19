import 'dart:async';

import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';
import '../../../controller/livetvdetails_controller.dart';
import '../premium/premiumvideo_tv.dart';

class LiveTvTVVideo extends StatefulWidget {
  LiveTvTVVideo({super.key,  this.name, this.tvid, this.tvurl});
 
  final String? name;
  final String? tvid;
  final String? tvurl;

  @override
  State<LiveTvTVVideo> createState() => _LiveTvTVVideoState();
}

class _LiveTvTVVideoState extends State<LiveTvTVVideo> {
  VideoPlayerController? _controller;
  LiveTvDetailsController liveTvDetailsController =
      Get.put(LiveTvDetailsController());
  var url = [
    'https://60e68b19dd194.streamlock.net:55/madhatv/madhatv.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/neyam/neyamhd/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/divyavani/divyavani.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/captain.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/murasu.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/news7.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/puthiyathalimurai.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/sangamam.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/tv5.stream_HDp/playlist.m3u8',
    'http://10.8.0.2:1935/deepamtv/deepamhd/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/polimer.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/malar.stream_HDp/playlist.m3u8',
    'https://60e68b19dd194.streamlock.net:55/ott/vasanth.stream_HDp/playlist.m3u8',
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
    Future<void> ? _initializeVideoPlayerFuture;

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
    liveTvDetailsController.liveTvDetailsController(tv_id: widget.tvid);
    super.initState();
    Timer(Duration(milliseconds: 10), () {
      setState(() {
        _handleButtonClick();
      });
    });

    _controller = VideoPlayerController.network(widget.tvurl!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _initializeVideoPlayerFuture = _controller!.initialize();

    _controller!.setLooping(true);
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
    return Obx(() {
      if (liveTvDetailsController.categoryLoad.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (liveTvDetailsController.livetvdetails.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      } else {
        return Scaffold(
          backgroundColor: black,
          appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(widget.name!),
                ),
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             backgroundColor: black,
// leading: InkWell(
//   focusColor: Colors.red,
//   onTap: (){
//     Get.back();
//   },
//   child: Icon(Icons.arrow_back,color: screenbackground,)),
//             title: Text(
//               liveTvDetailsController.livetvdetails[0].videoStreamingApp.tvTitle
//                   .toString(),
//               style: toptitleStylebold,
//             ),
//             //centerTitle: true,
//             actions: [
               
//               Padding(
//                   padding: EdgeInsets.only(right: 2.0.wp, bottom: 2.0.hp),
//                   child: Container(
//                     height: 5.0.hp,
//                     width: 6.0.wp,
//                     decoration: BoxDecoration(
//                         color: screenbackground,
//                         // color: Color(0xffb22e2c),
//                         borderRadius: BorderRadius.circular(5)),
//                     child: Image.asset('assets/images/clive.png',fit: BoxFit.fill,),
//                   )),
//             ],
//           ),

         body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                aspectRatio: 20 / 9,
             // aspectRatio: _controller!.value.aspectRatio,
             child: GestureDetector(
             //  focusColor: Colors.blue,
                         onTap: () {
                           _handleButtonClick();
                           setState(() {
                             _showWidget = true;
                             if (_controller!.value.isPlaying) {

                               _controller!.pause();

                             } else {
                               // If the video is paused, play it.


                               setState(() {
                                 if (!_controller!.value.isPlaying) {
                                   setState(() {
                                     _controller!.play().then((value){
                                       setState(() {
                                         _controller!.initialize();
                                       });
                                     } );
                                     //_controller!.initialize();
                                   });
                                 }                      });



                             }
                           });
                         },
               child: VideoPlayer(_controller!)),
                );
              } else {
                return Container(
                  height: 80.0.hp,
                  width: 100.0.wp,
                  child: Center(child: CircularProgressIndicator(),));
              }
            },
          ),
            
             
             
             Container(
               // height: 100.h,
               width: 1000.0.w,
               decoration: BoxDecoration(
                   color: Colors.black.withOpacity(0.2),
                   borderRadius: BorderRadius.circular(20)),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
   
  
     Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                focusColor: Colors.red,
                onTap: (){



    _controller!.pause();




    },


                child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: 8.0.hp,
               width: 5.0.wp,
               color: Colors.amber[900],
               child:  Center(child:  Icon(Icons.pause_circle_filled,color: screenbackground,))),
                ),
              ),
              SizedBox(width: 2.0.wp,),
              InkWell(
                focusColor: Colors.red,
                onTap: (){
    setState(() {
    if (!_controller!.value.isPlaying) {
    setState(() {
    _controller!.play().then((value){
      setState(() {
        _controller!.initialize();
      });
    } );
    //_controller!.initialize();
    });
    }                      });



                },
                child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
                 height: 8.0.hp,
               width: 5.0.wp,
                 color: Colors.green,
                 child:  Center(child: Icon(Icons.play_arrow_sharp,color: screenbackground,))),
                ),
              ),
               SizedBox(width: 2.0.wp,),
    Material(
                        color: Colors.transparent,
                         child: InkWell(
                             focusColor: Colors.red,
                             onTap: () {
                               setState(() {
                                 _controller!.setVolume(isMuted ? 1 : 0);
                               });
                             },
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 height: 8.0.hp,
                                        width: 5.0.wp,
                                          color: Colors.blue,
                                 child: Icon(
                                   isMuted
                                       ? Icons.volume_off
                                       : Icons.volume_up_outlined,
                                   size: 30,
                                   color: screenbackground,
                                 ),
                               ),
                             )),
                       )
                    

            ],
          ),
                 
                   Row(
                      
                     children: [
                      
                        InkWell(
                         focusColor: Colors.red,
                         onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(
                             builder: (context) => Lansdscape(
                               controller: _controller,
                             ),
                           ));
                         },
                         child: Padding(
                           padding:   EdgeInsets.only(right:0.0.hp),
                           child: Container(
                             child: Icon(
                               Icons.fullscreen,
                               color: Colors.white,
                               size: 30,
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 10,
                       ),
                        
                      //  Container(
                      //    height: 50,
                      //    width: 20.0.wp,
                      //    child: Center(
                      //      child: Text(
                      //        'Live',
                      //        style: toptitleStylebold,
                      //      ),
                      //    ),
                      //  ),
                          Container(
                            height: 50,
                            width: 10.0.wp,
                            child: FlipContainers())
                      
                     ],
                   )
                 ],
               ),

             ),
      ]),
    ));
  }

  

  


  });}
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  }
