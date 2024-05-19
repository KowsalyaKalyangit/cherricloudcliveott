import 'dart:async';

import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
 
import 'package:flutter_flip_card/flutter_flip_card.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';

class PremiumTVVideo extends StatefulWidget {
  PremiumTVVideo({super.key, this.index, this.name,this.url});
  final int? index;
  final String? name;
  final String ?url;

  @override
  State<PremiumTVVideo> createState() => _PremiumTVVideoState();
}

class _PremiumTVVideoState extends State<PremiumTVVideo> {
  VideoPlayerController? _controller;
  Future<void> ? _initializeVideoPlayerFuture;
  final cong1 = GestureFlipCardController();
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
    
    Timer(Duration(milliseconds: 10), () {
      setState(() {
         cong1.flipcard();
        _handleButtonClick();
      });
    });

    _controller = VideoPlayerController.network( widget.url!)
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
      final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
    final isMuted = _controller!.value.volume == 0;
    return Scaffold(
      backgroundColor: black,
       
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: black,
        leading: InkWell(
          focusColor: Colors.red,
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: screenbackground,)),
 
        title: Text(
          widget.name!,
          style: toptitleStylebold,
        ),
        //centerTitle: true,
        actions: [
          
           
          // Padding(
          //     padding: EdgeInsets.only(right: 2.0.wp,bottom: 1.0.wp  ),
          //     child: Container(
          //       height: 4.0.hp,
          //       width: 6.0.wp,
          //       decoration: BoxDecoration(
          //           color: screenbackground,
          //           // color: Color(0xffb22e2c),
          //           borderRadius: BorderRadius.circular(5)),
          //       child: Image.asset('assets/images/clive.png',fit: BoxFit.fill,),
          //     )),
        ],
      ),

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
              } 
              
              
              
              else if(snapshot.connectionState == ConnectionState.done){
                return Container(
                  height: 400,
                  width: 100.0.wp,
                  child:   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/error.png',height: 100,width: 200,),
                      Center(child:Text('An error occured,Please try again later',style: toptitleStyle,)),
                    ],
                  ));
              }
              else{
              return Container(
                  height: 400,
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
  _controller != null && _controller!.value.isInitialized
                       ? Material(
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
                       : Container(),

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

  
}


class FlipContainers extends StatefulWidget {
  const FlipContainers({Key? key}) : super(key: key);

  @override
  _FlipContainersState createState() => _FlipContainersState();
}

class _FlipContainersState extends State<FlipContainers> {
   
  final cong1 = GestureFlipCardController();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
                 cong1.flipcard();
                });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Center(
              child: ListView(
                children: [
                  GestureFlipCard(
                    controller: cong1,
                    axis: FlipAxis.vertical,
                    enableController: true,
                    animationDuration: const Duration(milliseconds: 1000),
                    frontWidget: Center(
                      child: Container(
                        height: 6.0.hp,
                        width: 10.0.wp,
                        // color: Colors.red,
                        child:  Center(child: Image.asset('assets/livetag.png'))
                      ),
                    ),
                    backWidget: Container(
                            height: 6.0.hp,
                        width: 10.0.wp,
                        // color: Colors.red,
                        child:  Center(child: Image.asset('assets/livetag.png'))
                    ),
                  ),
                 
                   
                 
                  
                   
                  
                ],
              ),
            ),
          ),
        
    );
  }
}
