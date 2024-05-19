import 'dart:async';

import 'package:cliveott/src/controller/my_watchlist_controller.dart';
import 'package:cliveott/src/view/dashboard/movie_details_tv.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../utils/textstyles.dart';
import 'package:auto_reload/auto_reload.dart';

class MyWatchlistMobile extends StatefulWidget {
  const MyWatchlistMobile({super.key});

  @override
  State<MyWatchlistMobile> createState() => _MyWatchlistMobileState();
}

class _MyWatchlistMobileState extends State<MyWatchlistMobile> {
  MyWatchListController myWatchListController =
  Get.put(MyWatchListController());


  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      myWatchListController.mywatchlistController(context: context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myWatchListController.mywatchlistload.value) {
        return CircularProgressIndicator();
      } else if (myWatchListController
          .mywatchlist[0].videoStreamingApp.isEmpty) {
        return Text('No Data Found');
      } else {
        return Scaffold(
            backgroundColor: black,
            appBar: AppBar(
              backgroundColor: black,
              toolbarHeight: 5.0.hp,
              title: Text(
                'My WatchList',
                style: toptitleStyle,
              ),
              actions: [
                // IconButton(
                //     onPressed: () {
                //       myWatchListController.mywatchlistController();
                //     },
                //     icon: Icon(Icons.refresh))
              ],
            ),
            body: Obx(() {
              if (myWatchListController.mywatchlistload.value) {
                return Center(child: CircularProgressIndicator());
              } else if (myWatchListController.mywatchlist.isEmpty) {
                return Text('No Data Found');
              } else {
                return Container(
                    height: 1000.0.h,
                    width: 1000.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/loginbg.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              color: clivecolor,
                            ),
                            Container(
                              height: 120.0.hp,
                              width: 100.0.wp,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  //physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      childAspectRatio: 1.95/ 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 3),
                                  itemCount: myWatchListController
                                      .mywatchlist[0].videoStreamingApp.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    var items = myWatchListController
                                        .mywatchlist[0]
                                        .videoStreamingApp[index];

                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        focusColor: Colors.red.withOpacity(0.2),
                                        onTap: () {
                                          Get.to(MoviesDetailsTv(
                                            name: items.postTitle.toString(),
                                            movieid: items.postId,
                                            tvurl: '',
                                          ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 160.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                    child: Image.network(
                                                      items.postImage
                                                          .toString(),
                                                      height: 15.0.hp,
                                                      width: 40.0.wp,
                                                      fit: BoxFit.fill,
                                                    )),
                                                SizedBox(
                                                  height: 1.0.hp,
                                                ),
                                                Container(
                                                  height: 5.0.hp,
                                                  width: 40.0.wp,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                       ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 120.0,
                                                        child: Text(
                                                            items.postTitle,
                                                            maxLines: 1,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            softWrap: false,
                                                            style:
                                                            categoryitems),
                                                      ),
                                                      // InkWell(
                                                      //   focusColor: Colors.blue,
                                                      //   onTap: () {},
                                                      //   child: Icon(
                                                      //     Icons.delete,
                                                      //     size: 20,
                                                      //     color: screenbackground,
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
            }));
      }
    });
  }
}
