import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../controller/livetv_category_controller.dart';
import '../../../controller/search_controller.dart';
import '../../dashboard/clive_videos.dart';
import 'livetvby_category.dart';

class LiveTvCategoryScreen extends StatefulWidget {
  const LiveTvCategoryScreen({super.key});

  @override
  State<LiveTvCategoryScreen> createState() => _LiveTvCategoryScreenState();
}

class _LiveTvCategoryScreenState extends State<LiveTvCategoryScreen>
    with TickerProviderStateMixin {
  var selectedindex = 0;
  LiveCategoryController liveTvCategoryController =
      Get.put(LiveCategoryController());
    
  @override
  void initState() {
    liveTvCategoryController.liveTvcategoryController();
    super.initState();
  }

  var images = [
    'assets/category/devotional.jpeg',
    'assets/category/entertainment.jpeg',
    'assets/category/others.jpeg',
    'assets/category/lifestyle.jpeg',
    'assets/category/music.jpeg',
    'assets/category/news.jpeg',
    'assets/category/others.jpeg',
    'assets/category/religious.jpeg',
    'assets/category/sports.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (liveTvCategoryController.categoryLoad.value) {
        return CircularProgressIndicator();
      } else if (liveTvCategoryController.getcategory.isEmpty ||
          liveTvCategoryController.categoryLoad == null) {
        return Text('NO DATA FOUND');
      } else {
        return  Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/loginbg.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 120.0.hp,
                    width: 100.0.wp,
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2.90 / 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: liveTvCategoryController
                            .getcategory[0].videoStreamingApp.length,
                        itemBuilder: (BuildContext ctx, index) {
                          var items = liveTvCategoryController
                              .getcategory[0].videoStreamingApp[index];
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              focusColor: Colors.red.withOpacity(0.2),
                              onTap: () {
                                Get.to(LiveTvByCategoryScreen(
                                  categoryid: items.categoryId.toString(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                              images[index].toString())),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Text(
                                        items.categoryName,
                                        style: toptitleStylebold,
                                      ),
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
          
        );
      }
    });
  }
}
