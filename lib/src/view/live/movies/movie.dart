import 'package:cliveott/src/controller/home_controller.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../../utils/textstyles.dart';
import '../../dashboard/latestmobilepage.dart';
import '../../dashboard/movie_details_tv.dart';

 

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  HomeController homeController = Get.find();
  var selectedindex = 0;
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
  void initState() {
     initPlatformState();
    super.initState();
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
                  height: 1000.0.h,
                  width: 1000.0.w,
                  child: GridView.builder(
                     
                    
                    
                     
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
                            _isTV!?    Get.to(MoviesDetailsTv(
                                  movieid: data.movieId,
                                  tvurl: data.movieUrl.toString(),
                                )):Get.to(LatestMobileVideo(movieid: data.movieId,tvurl: data.movieUrl.toString(),));
                              });
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:30.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        data.moviePoster,
                                        height: 
                                        180.0.h,
                                        width: 120.0.w,
                                        
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35.0,top: 5),
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
                      }, gridDelegate:   SliverGridDelegateWithMaxCrossAxisExtent(
                                       maxCrossAxisExtent: 200,
                                      childAspectRatio: 1.50/ 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 3),),
                )
              ]),
        ));
  }
}
