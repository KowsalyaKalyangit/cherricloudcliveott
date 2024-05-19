import 'dart:async';

import 'package:cliveott/src/controller/add_watchlist_controller.dart';
import 'package:cliveott/src/controller/movie_details_controller.dart';
import 'package:cliveott/src/view/dashboard/related_movie_details.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';
import 'package:share_plus/share_plus.dart';

class MoviesDetailsTv extends StatefulWidget {
  MoviesDetailsTv({super.key, this.name, this.movieid, this.tvurl});

  final String? name;
  final int? movieid;
  final String? tvurl;

  @override
  State<MoviesDetailsTv> createState() => _MoviesDetailsTvState();
}

class _MoviesDetailsTvState extends State<MoviesDetailsTv> {
  VideoPlayerController? _controller;
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  AddWatchListController addWatchListController =
      Get.put(AddWatchListController());
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
          _showWidget = false;
        });
      }
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      fun();
    });

    super.initState();

    Timer(Duration(milliseconds: 10), () {
      setState(() {
        _handleButtonClick();
      });
    });

    _controller = VideoPlayerController.network(widget.tvurl.toString())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });
      });
  }

  fun() async {
    movieDetailsController.movieDetailsController(
      user_id: 11.toString(),
      movie_id: widget.movieid.toString(),
    );
  }

  bool _isButtonPressed = false;

  var shouldShow = true;
  var _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    final isMuted = _controller!.value.volume == 0;
    return Obx(() {
      if (movieDetailsController.moviedetailsLoad.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (movieDetailsController.moviedetails.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      } else {
        return Scaffold(
            backgroundColor: black,
           
         appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: black,
leading: InkWell(
  focusColor: Colors.red,
  onTap: (){
    Get.back();
  },
  child: Icon(Icons.arrow_back,color: screenbackground,)),
            title:  Text(
                                    movieDetailsController
                                        .moviedetails[0].data.movieTitle
                                        .toString(),
                                    style:toptitleStylebold),),
             
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
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.only(left: 15.0, top: 10),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       InkWell(
                            //         focusColor: Colors.red,
                            //         onTap: () {
                            //           Get.back();
                            //         },
                            //         child: Icon(
                            //           Icons.arrow_back,
                            //           color: screenbackground,
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: 2.0.wp,
                            //       ),
                            //       Text(
                            //         movieDetailsController
                            //             .moviedetails[0].data.movieTitle
                            //             .toString(),
                            //         style: toptitleStylebold,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${movieDetailsController.moviedetails[0].data.movieDuration.toString()}| ${movieDetailsController.moviedetails[0].data.releaseDate.toString()} |${movieDetailsController.moviedetails[0].data.imdbRating.toString()}',
                                    style: forminputstylewhite,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 3.0.hp,
                                    width: 7.0.wp,
                                    decoration: BoxDecoration(
                                        color: Colors.amber[900],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        '${movieDetailsController.moviedetails[0].data.views.toString()} Views',
                                        style: forminputstylewhite,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Language: ${movieDetailsController.moviedetails[0].data.languageName.toString()}',
                                    style: forminputstylewhite,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 3.0.hp,
                                        width: 5.0.wp,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: screenbackground),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          '${movieDetailsController.moviedetails[0].data.movieAccess.name}',
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
                                            border: Border.all(
                                                color: screenbackground),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          '${movieDetailsController.moviedetails[0].data.videoType}',
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
                                      '${movieDetailsController.moviedetails[0].data.description.toString()}',
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
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Color(0xff9f181b))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                      InkWell(
                                        focusColor: Colors.red.withOpacity(.2),
                                        onTap: () {
                                          print('watchlist----------');
                                          addWatchListController
                                              .addwatchlistController(
                                                  post_id:
                                                      movieDetailsController
                                                          .moviedetails[0]
                                                          .data
                                                          .movieId
                                                          .toString(),context: context);
                                        },
                                        child: Container(
                                          height: 4.0.hp,
                                          width: 10.0.wp,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.format_list_bulleted_add,
                                                color: screenbackground,
                                              ),
                                              SizedBox(
                                                width: 1.0.wp,
                                              ),
                                              Center(
                                                child: Text(
                                                  'WatchList',
                                                  style: datetimecolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                      InkWell(
                                        focusColor: Colors.red.withOpacity(.2),
                                        onTap: () {},
                                        child: Container(
                                          height: 4.0.hp,
                                          width: 10.0.wp,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.share,
                                                color: screenbackground,
                                              ),
                                              SizedBox(
                                                width: 1.0.wp,
                                              ),
                                              Center(
                                                child: Text(
                                                  'Share',
                                                  style: datetimecolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                                            _controller!
                                                .setVolume(isMuted ? 1 : 0);
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
                                        seconds: _controller!
                                                .value.position.inSeconds -
                                            10));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Center(
                                      child: Icon(
                                        Icons
                                            .keyboard_double_arrow_left_outlined,
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
                                        seconds: _controller!
                                                .value.position.inSeconds -
                                            10));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Center(
                                      child: Icon(
                                        Icons
                                            .keyboard_double_arrow_right_outlined,
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
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
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
                  Obx(() {
                    if (movieDetailsController.moviedetailsLoad.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (movieDetailsController.moviedetails.isEmpty) {
                      return Center(
                        child: Text('No Data Found'),
                      );
                    } else {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 45.0.hp,
                                width: 100.0.wp,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movieDetailsController
                                        .moviedetails[0]
                                        .data
                                        .relatedMovies
                                        .length,
                                    itemBuilder: (context, index) {
                                      var relateditem = movieDetailsController
                                          .moviedetails[0]
                                          .data
                                          .relatedMovies[index];
                                      return InkWell(
                                        focusColor: Colors.red.withOpacity(0.2),
                                        onTap: () {
                                          print('clickkkkk');
                                          Get.back();
                                          Get.back();

                                          setState(() {
                                            Get.to(MoviesDetailsTv(
                                              movieid: relateditem.movieId,
                                              tvurl: '',
                                              name: relateditem.movieTitle,
                                            ));
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  relateditem.moviePoster,
                                                  height: 25.0.hp,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 10.0.wp,
                                              padding: new EdgeInsets.only(
                                                  right: 13.0),
                                              child: new Text(
                                                  relateditem.movieTitle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: categoryitems),
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                          ]);
                    }
                  }),

                  // Container(
                  //   height: 20.0.hp,
                  //   width: 100.0.wp,
                  //   color: Color(0xff262626),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         height: 8.0.hp,
                  //         width: 100.0.wp,
                  //         color: Color(0xff9f181b),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Image.asset(
                  //               'assets/images/clive1.png',
                  //               color: screenbackground,
                  //             ),
                  //             Container(
                  //               width: 80.0.wp,
                  //               child: Center(
                  //                 child: Text(
                  //                   'HOME | MOVIES | TV SHOWS | LIVE TV | MUSIC VIDEOS | COMEDY',
                  //                   style: datetimecolor,
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 5,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 15.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'About us | Feedback | FAQS | Privacy Policy | Terms of use | Cookie Policy | ',
                  //                   style: datetimecolor,
                  //                 ),
                  //                 Text(
                  //                   'Content Redressal mechanism',
                  //                   style: datetimecolor,
                  //                 ),
                  //                 // Container(
                  //                 //   width: 50.0.wp,
                  //                 //   child: Text(
                  //                 //     '''copyright @2022 CLIVE  all related channels,content,movies,image,visuals,clips,logos,programs and music are property of clive TV Network Ltd.., All Right Reserved''',
                  //                 //     style: datetimecolor,
                  //                 //   ),
                  //                 // )
                  //                 Text(
                  //                   'Version: 2.0.0',
                  //                   style: datetimecolor,
                  //                 )
                  //               ],
                  //             ),
                  //             Container(
                  //               height: 8.0.hp,
                  //               width: 1,
                  //               color: Colors.grey,
                  //             ),
                  //             // Column(
                  //             //   mainAxisAlignment:
                  //             //       MainAxisAlignment.spaceBetween,
                  //             //   children: [
                  //             //     Text(
                  //             //       'Follow us',
                  //             //       style: forminputstyle,
                  //             //     ),
                  //             //     Container(
                  //             //         height: 6.0.hp,
                  //             //         width: 14.0.wp,
                  //             //         child: ListView.builder(
                  //             //             scrollDirection: Axis.horizontal,
                  //             //             itemCount: movieDetailsController
                  //             //                 .moviedetails[0]
                  //             //                 .data
                  //             //                 .relatedMovies
                  //             //                 .length,
                  //             //             itemBuilder: (context, index) {
                  //             //               var relateditem =
                  //             //                   movieDetailsController
                  //             //                       .moviedetails[0]
                  //             //                       .data
                  //             //                       .relatedMovies[index];
                  //             //               return Column(
                  //             //                 children: [
                  //             //                   Padding(
                  //             //                     padding:
                  //             //                         const EdgeInsets.only(
                  //             //                             left: 15.0),
                  //             //                     child: CircleAvatar(
                  //             //                         radius: 10,
                  //             //                         backgroundImage:
                  //             //                             NetworkImage(
                  //             //                           relateditem.moviePoster,
                  //             //                         )),
                  //             //                   )
                  //             //                 ],
                  //             //               );
                  //             //             })),
                  //             //   ],
                  //             // ),
                  //             Container(
                  //               height: 8.0.hp,
                  //               width: 1,
                  //               color: Colors.grey,
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Also Available on',
                  //                   style: forminputstyle,
                  //                 ),
                  //                 Container(
                  //                     child: Image.asset(
                  //                   'assets/slider/lg.png',
                  //                   height: 3.0.hp,
                  //                   width: 20.0.wp,
                  //                   fit: BoxFit.fill,
                  //                 )),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ])));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
