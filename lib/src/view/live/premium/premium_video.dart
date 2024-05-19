import 'dart:async';
import 'dart:io';

import 'package:cliveott/src/model/livetv_details_model.dart';
import 'package:cliveott/src/view/category/category_like_videos.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'package:video_player/video_player.dart';

import 'package:flick_video_player/flick_video_player.dart';

import '../../../../utils/landscape.dart';
import '../../dashboard/related_movie_details.dart';

class PremiumVideo extends StatefulWidget {
  const PremiumVideo({super.key, this.index, this.name,this.url});
  final int? index;
  final String? name;
  final String ? url;

  @override
  State<PremiumVideo> createState() => _PremiumVideoState();
}

class _PremiumVideoState extends State<PremiumVideo> {
  VideoPlayerController? _controller;
  Future<void> ? _initializeVideoPlayerFuture;
  
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
  bool _isPlaying = false;
  bool _showWidget = false;
    List addimage = [
    'assets/images/ads2.jpg',
  ];

  void _handleButtonClick() {
    setState(() {
      _buttonClickCount++;
      if (_buttonClickCount % 1 == 0) {
        _showWidget = true;
        Timer(Duration(seconds: 10), () {
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
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
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

        title: Text(
          widget.name!,
          style: toptitleStylebold,
        ),
        //centerTitle: true,
        actions: [
           
          // Padding(
          //     padding: EdgeInsets.only(right: 5.0.wp, bottom: 1.0.hp),
          //     child: Container(
          //       height: 5.0.hp,
          //       width: 15.0.wp,
          //       decoration: BoxDecoration(
          //           color: screenbackground,
          //           // color: Color(0xffb22e2c),
          //           borderRadius: BorderRadius.circular(5)),
          //       child: Image.asset('assets/images/clive.png'),
          //     )),
        ],
      ),

         body: SingleChildScrollView(
        child: Container(
          height: 100.0.hp,
          width: 100.0.wp,
          
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          //   image: AssetImage("assets/images/background.png"),
                          image: AssetImage('assets/images/loginbg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                  aspectRatio: 14 / 9,
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
                  return Center(child: 
                  Container(
                    height: 40.0.hp,
                    width: 100.0.wp,
                    color: black,
                    child: Center(child: CircularProgressIndicator()),
                  ),);
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              setState(() {
                                 _controller!.pause();
                                    
                              });
                            },
                            child: Container(
                              child: Icon(
                                  Icons.stop
                                    ,
                                size: 25,
                                color: screenbackground,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              setState(() {
                                 _controller!.play().then((value){
                                  setState(() {
                                    _controller!.initialize();
                                  });
                                 });
                                    
                              });
                            },
                            child: Container(
                              child: Icon(
                                Icons.play_arrow,
                                size: 25,
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
                                    size: 25,
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
                              
                              SizedBox(
                                width: 25,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,top: 5),
                      child: Text('',style: toptitleStylebold,),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left:20.0,top: 5),
                      child: Row(
                        children: [
                          Text('Description: ',style: slidertext,),
                          Text( widget.name.toString(),style: slidertext,),
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left:20.0,top: 5),
                      child: Row(
                        children: [
                          Text('Views: ',style: slidertext,),
                          Text('1k',style: slidertext,),
                        ],
                      ),
                    ),
  Padding(
                      padding: const EdgeInsets.only(left:20.0,top: 8),
                      child: Row(
                        children: [
                          Text('Share: ',style: slidertext,),
                          InkWell(
                            onTap:()async{
                              if(Platform.isAndroid){
 Share.share('https://cherritech.us/ott/live-tv/share/9̦');
                              }
                             
                             else{
                               final box = context.findRenderObject() as RenderBox?;

await Share.share(
  'https://cherritech.us/ott/live-tv/share/9̦',
  subject: 'share',
  sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
);
                             }
                            } ,
                            child: Icon(Icons.share,color: screenbackground,))
                        ],
                      ),
                    ),
 Padding(
   padding: const EdgeInsets.only(left:20.0,top: 8),
   child: InkWell(
                                          focusColor: Colors.red.withOpacity(.2),
                                          onTap: () {
                                            print('watchlist----------');
                                            // addWatchListController
                                            //     .addwatchlistController(
                                            //         post_id:
                                            //             liveTvDetailsController
                                            //                 .livetvdetails[0]
                                            //                 .videoStreamingApp
                                            //                 .tvId
                                            //                 .toString(),context: context);
                                          },
                                          child: Container(
                                            height: 4.0.hp,
                                            width: 30.0.wp,
                                            decoration: BoxDecoration(
                                              color: clivecolor,
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.format_list_bulleted_add,
                                                  color: screenbackground,
                                                  size: 20,
                                                ),
                                                
                                                Center(
                                                  child: Text(
                                                    'WatchList',
                                                    style: slidertext,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
 ),
 SizedBox(height: 2.0.hp,),
 InkWell(
                    focusColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Related Movies',
                        style: toptitleStylebold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                    child: Container(
                      height: 2.0,
                      width: 4.0.wp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  // Obx(() {
                  //   if (liveTvDetailsController.categoryLoad.value) {
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   } else if (liveTvDetailsController.livetvdetails.isEmpty) {
                  //     return Center(
                  //       child: Text('No Data Found'),
                  //     );
                  //   } else {
                  //     return Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Container(
                  //               height: 25.0.hp,
                  //               width:100.0.wp,
                  //               child: ListView.builder(
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemCount: liveTvDetailsController
                  //                       .livetvdetails[0]
                  //                       .videoStreamingApp
                  //                       .relatedLiveTv
                  //                       .length,
                  //                   itemBuilder: (context, index) {
                  //                     var relateditem = liveTvDetailsController
                  //                         .livetvdetails[0]
                  //                         .videoStreamingApp
                  //                         .relatedLiveTv[index];
                  //                     return InkWell(
                  //                       focusColor: Colors.red.withOpacity(0.2),
                  //                       onTap: () {
                  //                         print('clickkkkk');
                  //                         Get.back();
                  //                         Get.back();

                  //                         setState(() {
                  //                           // Get.to(MoviesDetailsTv(
                  //                           //   movieid: relateditem.movieId,
                  //                           //   tvurl: '',
                  //                           //   name: relateditem.movieTitle,
                  //                           // ));
                  //                         });
                  //                       },
                  //                       child: Column(
                  //                         children: [
                  //                           Padding(
                  //                             padding:
                  //                                 const EdgeInsets.only(left:8.0),
                  //                             child: ClipRRect(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(5),
                  //                               child: Image.network(
                  //                                 relateditem.tvLogo,
                  //                                 height: 20.0.hp,
                  //                                 width: 50.0.wp,
                  //                                 fit: BoxFit.contain,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Container(
                  //                             width: 20.0.wp,
                  //                             padding: new EdgeInsets.only(
                  //                                 right: 13.0),
                  //                             child: new Text(
                  //                                 relateditem.tvTitle,
                  //                                 overflow:
                  //                                     TextOverflow.ellipsis,
                  //                                 style: categoryitems),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   })),
                  //         ]);
                  //   }
                  // }),
                 

                 
              ]),
        ),
    ));
  }

  

  


  } 


