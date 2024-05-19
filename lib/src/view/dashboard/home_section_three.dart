import 'package:cliveott/src/controller/home_controller.dart';
import 'package:cliveott/src/view/dashboard/latestmobilepage.dart';
import 'package:cliveott/src/view/subscribe/subscribe_home_page.dart';
import 'package:cliveott/src/view/subscribe/subscription_page.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../utils/textstyles.dart';
import '../category/category_videos.dart';
import 'movie_details_tv.dart';

class HomeSectionThree extends StatefulWidget {
  const HomeSectionThree({super.key});

  @override
  State<HomeSectionThree> createState() => _HomeSectionThreeState();
}

class _HomeSectionThreeState extends State<HomeSectionThree> {
  HomeController homeController = Get.find();
  var selectedindex = 0;

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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0.h,
                ),
                Container(
                  height: 280.0.h,
                  width: 1000.0.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController
                          .gethome[0].videoStreamingApp.homeSections3.length,
                      itemBuilder: (context, index) {
                        var data = homeController
                            .gethome[0].videoStreamingApp.homeSections3[index];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            focusColor: Colors.red.withOpacity(0.2),
                            onTap: () {
                               setState(() {

                                if(homeController
                          .gethome[0].videoStreamingApp.homeSections3[index].movieAccess=='Free'){
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
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            data.moviePoster,
                                            height: 100.0.h,
                                             width: 200.0.w,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned( 
                    bottom:10.0.hp,
                  child: Row(
                    children: [
                data.movieAccess=='Paid'?     Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child:  Image.asset('assets/premium/tag.png',height: 8.0.hp,)
                      ):Container()
                    ],
                  ),
                ),
                                    ],
                                  ),
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
