import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/textstyles.dart';
import 'category_like_videos.dart';

class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ms.Marvel',
            style: toptitleStylebold,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: screenbackground,
                    ),
                    Text(
                      '17 views',
                      style: toptitleStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '|',
                style: toptitleStylebold,
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: screenbackground,
                    ),
                    Text(
                      '1hr 51 mins',
                      style: toptitleStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '|',
                style: toptitleStylebold,
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/imdb.png'),
                    Text(
                      '4.8',
                      style: toptitleStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '|',
                style: toptitleStylebold,
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: screenbackground,
                      child: Text(
                        '16 +',
                        style: sixteenplus,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
          Container(
            height: 40.0.h,
            width: 150.0.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(0.2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.add_box,
                  color: Colors.red,
                ),
                Text(
                  'AddtoWishlist',
                  style: toptitleStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Divider(
            height: 1.0.h,
            color: screenbackground,
          ),
          SizedBox(
            height: 15.0.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Share:',
                    style: toptitleStylebold,
                  ),
                  CircleAvatar(
                    backgroundColor: screenbackground,
                    radius: 15,
                    child: ClipPath(
                      child: Image.asset(
                        'assets/images/facebook1.png',
                        height: 30.0.h,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: screenbackground,
                    radius: 15,
                    child: ClipPath(
                      child: Image.asset(
                        'assets/images/twitter1.png',
                        height: 30.0.h,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: screenbackground,
                    child: ClipPath(
                      child: Image.asset(
                        'assets/images/pinterest1.png',
                        height: 30.0.h,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: screenbackground,
                    child: ClipPath(
                      child: Image.asset(
                        'assets/images/whatsapp1.png',
                        height: 30.0.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Comedy',
                  style: categorytext,
                ),
                Text(
                  '|',
                  style: toptitleStylebold,
                ),
                Text(
                  'Drama',
                  style: categorytext,
                ),
                Text(
                  '|',
                  style: toptitleStylebold,
                ),
                Text(
                  'Fantasy',
                  style: categorytext,
                ),
                Text(
                  '|',
                  style: toptitleStylebold,
                ),
                Text(
                  'English',
                  style: categorytext,
                ),
              ],
            ),
          ]),
          Divider(
            color: screenbackground,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  setState(() {
                    selectedindex = 0;
                  });
                },
                child: Container(
                  height: 40.0.h,
                  width: 80.0.w,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 146, 15, 6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'About',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
              InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  setState(() {
                    selectedindex = 1;
                  });
                },
                child: Container(
                  height: 40.0.h,
                  width: 80.0.w,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 146, 15, 6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Actors',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
              InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  setState(() {
                    selectedindex = 2;
                  });
                },
                child: Container(
                  height: 40.0.h,
                  width: 80.0.w,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 146, 15, 6),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      'Directors',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.0.h,
          ),
          selectedindex == 0
              ? Text(
                  '''The Madrigals are an extraordinary family who live hidden in the mountains of Colombia in a charmed place called the Encanto. The magic of the Encanto has blessed every child in the family with a unique gift -- every child except Mirabel. However, she soon may be the Madrigals last hope when she dis… MORE
    Release date: 24 November 2021 (USA)
    Directors: Byron Howard, Jared Bush
    Music director: Germaine Franco
    Screenplay: Lin-Manuel Miranda, Jared Bush, Charise Castro Smith''',
                  style: categorytext,
                )
              : Container(),
          SizedBox(
            height: 15.0.h,
          ),
          CategoryLikeVideos()
        ],
      ),
    );
  }
}
