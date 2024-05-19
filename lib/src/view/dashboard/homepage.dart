import 'package:cliveott/src/view/dashboard/popular.dart';
import 'package:cliveott/src/view/dashboard/image_slider.dart';
import 'package:cliveott/src/view/live/premium/premium.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/textstyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSliderHome(),
          Image.asset('assets/images/ads1.jpg'),
          SizedBox(
            height: 3.0.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Premium(),
          ),
          SizedBox(
            height: 3.0.h,
          ),
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
                Text('Upcoming Shows', style: toptitleStylebold),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Categorylist(),
          )
        ],
      ),
    );
  }
}
