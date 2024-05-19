import 'package:cliveott/src/controller/movie_details_controller.dart';
import 'package:cliveott/src/view/category/category_like_videos.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:video_player/video_player.dart';

import 'package:flick_video_player/flick_video_player.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, this.movieid, this.index});
  final int? index;
  // final String? name;
  final int? movieid;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  FlickManager? flickManager;
  List addimage = [
    'assets/images/ads2.jpg',
  ];
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
  @override
  void initState() {
    super.initState();
    movieDetailsController.movieDetailsController(movie_id: widget.movieid);
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //       movieDetailsController
    //           .moviedetails[0].videoStreamingApp.videoUrl),
    // );
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black1,
        appBar: AppBar(
          backgroundColor: black,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0.wp, top: 2.0.hp),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.0.wp, top: 2.0.hp),
              child: Icon(
                Icons.notifications,
                size: 25,
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (movieDetailsController.moviedetailsLoad.value) {
            return CircularProgressIndicator();
          } else if (movieDetailsController.moviedetails.isEmpty) {
            return Center(
              child: Text('NODATA FOUND'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.0.hp,
                    child: FlickVideoPlayer(
                      //  flickVideoWithControls: FlickPortraitControls(),

                      flickVideoWithControls: FlickVideoWithControls(
                        //  videoFit: BoxFit.fill,
                        aspectRatioWhenLoading: 1,
                        playerErrorFallback: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 30,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'This video is unavailable..!',
                                style: toptitleStyle,
                              ),
                            ],
                          ),
                        ),
                        playerLoadingFallback: Center(
                            child: CircularProgressIndicator(
                          color: screenbackground,
                        )),
                        controls: FlickPortraitControls(
                          progressBarSettings: FlickProgressBarSettings(
                              height: 0, curveRadius: 0, handleRadius: 0),
                        ),
                      ),

                      flickManager: flickManager!,
                      preferredDeviceOrientationFullscreen: [
                        DeviceOrientation.landscapeRight
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 10.0, top: 10),
                    child: Text(
                      " widget.name.toString()",
                      style: GoogleFonts.ibmPlexSans(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 15.00,
                              color: screenbackground,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 5.0.wp,
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 15.0.wp,
                      decoration: BoxDecoration(
                          color: Color(0xff363a3a),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Action',
                          style: datetimecolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 25.0.wp,
                      decoration: BoxDecoration(
                          color: Color(0xff363a3a),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Adventure',
                          style: datetimecolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 15.0.wp,
                      decoration: BoxDecoration(
                          color: Color(0xff363a3a),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          '2H 45M',
                          style: datetimecolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    Container(
                      height: 4.0.hp,
                      width: 13.0.wp,
                      decoration: BoxDecoration(
                          color: Color(0xff363a3a),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                              size: 15,
                            ),
                            Text(
                              '8.7',
                              style: datetimecolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                  ]),
                  addimage.isEmpty
                      ? Container(
                          height: 0.0.hp,
                          color: Colors.black.withOpacity(0.2),
                        )
                      : Stack(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 25.0.hp,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: addimage.length,
                                      itemBuilder: ((context, index) {
                                        return Image.asset(
                                            addimage[index].toString());
                                      })),
                                )),
                            Positioned(
                                right: 5,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      addimage.removeAt(0);
                                    });
                                  },
                                  child: addimage.isEmpty
                                      ? Container()
                                      : CircleAvatar(
                                          backgroundColor: Colors.amber[900],
                                          radius: 13,
                                          child: Icon(
                                            Icons.close,
                                            size: 20,
                                          ),
                                        ),
                                ))
                          ],
                        ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Text(
                      '''The Madrigals are an extraordinary family who live hidden in the mountains of Colombia in a charmed place called the Encanto. The magic of the Encanto has blessed every child in the family with a unique gift -- every child except Mirabel.  
                 ''',
                      style: forminputstylefourteen,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            'My List',
                            style: toptitleStyle,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            'Rate',
                            style: toptitleStyle,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            'share',
                            style: toptitleStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  Container(
                    height: 0.50.hp,
                    width: 100.0.wp,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                      height: 0.50.hp,
                      width: 35.0.wp,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('More Like Videos',
                        style: GoogleFonts.ibmPlexSans(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 16.00,
                              color: screenbackground,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  CategoryLikeVideos()
                ],
              ),
            );
          }
        }));
  }
}
