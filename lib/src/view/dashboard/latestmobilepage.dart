import 'dart:io';

import 'package:cliveott/src/controller/add_watchlist_controller.dart';
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

import '../../controller/movie_details_controller.dart';

class LatestMobileVideo extends StatefulWidget {
  const LatestMobileVideo({super.key, this.movieid, this.tvurl});
  final int? movieid;
  final String? tvurl;

  @override
  State<LatestMobileVideo> createState() => _LatestMobileVideoState();
}

class _LatestMobileVideoState extends State<LatestMobileVideo> {
  FlickManager? flickManager;
  List addimage = [
    'assets/images/ads2.jpg',
  ];

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
  @override
  void initState() {
    super.initState();
    fun();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.tvurl!),
    );
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }
  fun() async {
    movieDetailsController.movieDetailsController(
      user_id: 11.toString(),
      movie_id: widget.movieid.toString(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
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
            backgroundColor: black1,
            appBar: AppBar(
              backgroundColor: black,
              title: Text(movieDetailsController.moviedetails[0].data.movieTitle
                  .toString()),
              // actions: [
              //   Padding(
              //     padding: EdgeInsets.only(right: 10.0.wp, top: 2.0.hp),
              //     child: Icon(
              //       Icons.search,
              //       size: 25,
              //     ),
              //   ),
              //   Padding(
              //     padding: EdgeInsets.only(right: 5.0.wp, top: 2.0.hp),
              //     child: Icon(
              //       Icons.notifications,
              //       size: 25,
              //     ),
              //   ),
              // ],
            ),
            body: Obx(() {
              if (movieDetailsController.moviedetailsLoad.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (movieDetailsController.moviedetails.isEmpty) {
                return Center(
                  child: Text('No Data Found'),
                );
              } else {
                return
                  SingleChildScrollView(
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
                          const EdgeInsets.only(
                              left: 20.0, right: 10.0, top: 10),
                          child:Text(
                            '${movieDetailsController.moviedetails[0].data.movieDuration.toString()}| ${movieDetailsController.moviedetails[0].data.releaseDate.toString()}',
                            style: slidertext,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 20.0, right: 10.0, top: 8),
                          child: Container(
                            height: 3.0.hp,
                            width: 17.0.wp,
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
                                movieDetailsController.moviedetails[0].data.movieAccess.name,
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
                                movieDetailsController.moviedetails[0].data.videoType,
                                style: datetimecolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.0.wp,
                          ),
                          // Container(
                          //   height: 4.0.hp,
                          //   width: 15.0.wp,
                          //   decoration: BoxDecoration(
                          //       color: Color(0xff363a3a),
                          //       borderRadius: BorderRadius.circular(5)),
                          //   child: Center(
                          //     child: Text(
                          //       '2H 45M',
                          //       style: datetimecolor,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 2.0.wp,
                          // ),
                          Container(
                            height: 4.0.hp,
                            width: 15.0.wp,
                            decoration: BoxDecoration(
                                color: Color(0xff363a3a),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceAround,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[600],
                                  size: 15,
                                ),
                                Text(
      movieDetailsController.moviedetails[0].data.imdbRating.toString(),
                                  style: datetimecolor,
                                ),
                              ],
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
                          padding:
                          const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0),
                          child: Text(
                            '${movieDetailsController.moviedetails[0].data.description.toString()}',
                            style: slidertext,
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(height: 5.0.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                addWatchListController
                                    .addwatchlistController(
                                    post_id:
                                    movieDetailsController
                                        .moviedetails[0]
                                        .data
                                        .movieId
                                        .toString(),context: context);
                              },
                              child: Column(
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
                            InkWell(
                              onTap: () async{
                                if(Platform.isAndroid){

                                
                                 Share.share(movieDetailsController.moviedetails[0].data.shareUrl.toString());
                                }
                                 else{
                               final box = context.findRenderObject() as RenderBox?;

await Share.share(
 movieDetailsController.moviedetails[0].data.shareUrl.toString(),
  subject: 'Clive ott Share',
  sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
);
                             }
                              },
                              child: Column(
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
                              ),
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


    }});
  }
}

// String videoUrlLandscape =
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
// String videoUrlPortrait =
//     'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
// String longVideo =
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

// String video720 =
//     "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";

// String video480 =
//     "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4";

// String video240 =
//     "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4";
