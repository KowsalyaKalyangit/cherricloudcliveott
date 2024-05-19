import 'package:cliveott/src/controller/search_controller.dart';
import 'package:cliveott/src/view/subscribe/subscription_page.dart';
 
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../../utils/textstyles.dart';
import '../../controller/home_controller.dart';
 
import 'latestmobilepage.dart';
 
import 'movie_details_tv.dart';

class LatestPage extends StatefulWidget {
  LatestPage({super.key, this.categoryid});
  final String? categoryid;
  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  HomeController homeController = Get.find();
  

  @override
  void initState() {
    initPlatformState();

    super.initState();
  }

  bool? _isTV = false;
  final _isTVPlugin = IsTV();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 18.0.h,
                        width: 1.0.w,
                        color: Colors.red[900],
                      ),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      Text('Latest Movies', style: toptitleStylebold),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Container(
                  height: 280.0.h,
                  width: 1000.0.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController
                          .gethome[0].videoStreamingApp.latestMovies.length,
                      itemBuilder: (context, index) {
                        var data = homeController
                            .gethome[0].videoStreamingApp.latestMovies[index];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            focusColor: Colors.red.withOpacity(0.2),
                            onTap: () {
                              setState(() {
                                 if(homeController
                          .gethome[0].videoStreamingApp.latestMovies[index].movieAccess=='Free'){

  _isTV!?    Get.to(MoviesDetailsTv(
                                  movieid: data.movieId,
                                  tvurl: data.movieUrl.toString(),
                                )):Get.to(LatestMobileVideo(movieid: data.movieId,tvurl: data.movieUrl.toString(),));

                          }
                          else{
                            Get.to(SubscriptionPage());
                          }
                                                        });
                                                        
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Stack(children: [ Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        data.moviePoster,
                                        height: 200.0.h,
                                        // width: 130.0.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned( 
                    bottom:24.0.hp,
                  child: Row(
                    children: [
                data.movieAccess=='Paid'?     Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child:  Image.asset('assets/premium/tag.png',height: 8.0.hp,)
                      ):Container()
                    ],
                  ),
                ),
                                  ],),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 120.0,
                                          child: Text(data.movieTitle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: categoryitems),
                                        ),
                                        SizedBox(
                                          height: 1.0.hp,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.watch_later_outlined,
                                              color: Colors.red,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 1.0.wp,
                                            ),
                                            Text(
                                              data.movieDuration.toString(),
                                              style: slidertext,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ]),
        ));
  }
}
