import 'package:cliveott/src/controller/home_controller.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/textstyles.dart';
import '../category/category_videos.dart';

class HomeSectionFour extends StatefulWidget {
  const HomeSectionFour({super.key});

  @override
  State<HomeSectionFour> createState() => _HomeSectionFourState();
}

class _HomeSectionFourState extends State<HomeSectionFour> {
  HomeController homeController = Get.find();
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
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
              Text(
                  homeController
                      .gethome[0].videoStreamingApp.homeSections4Title,
                  style: toptitleStylebold),
            ],
          ),
        ),
        Container(
          height: 200.0.h,
          width: 1000.0.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController
                  .gethome[0].videoStreamingApp.homeSections4.length,
              itemBuilder: (context, index) {
                var data = homeController
                    .gethome[0].videoStreamingApp.homeSections4[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.red.withOpacity(0.2),
                    onTap: () {
                      //Get.to(CategoryVideosone(index: index));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data.showPoster,
                                height: 20.0.hp,

                                // width: 48.0.wp,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(data.showTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: categoryitems),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        // 2nd category
      ],
    );
  }
}
