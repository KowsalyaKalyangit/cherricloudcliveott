import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/textstyles.dart';

class CategoryLikeVideos extends StatefulWidget {
  const CategoryLikeVideos({super.key});

  @override
  State<CategoryLikeVideos> createState() => _CategoryLikeVideosState();
}

class _CategoryLikeVideosState extends State<CategoryLikeVideos> {
  var movieList = [
    'assets/images/movies/movie1.jpg',
    'assets/images/movies/movie2.jpg',
    'assets/images/movies/movie3.jpg',
    'assets/images/movies/movie4.jpg',
    'assets/images/movies/movie5.jpg',
    'assets/images/movies/movie6.jpg',
    'assets/images/movies/movie7.jpg',
    'assets/images/movies/movie1.jpg',
    'assets/images/movies/movie2.jpg',
    'assets/images/movies/movie3.jpg',
  ];
  var movieNameList = [
    '300',
    'Man vs Bee',
    'Aquaman',
    'Black Adams',
    'Encanto',
    'Luca',
    'Frozen',
    '300',
    'Man vs Bee',
    'Aquaman',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0.h,
      width: 1000.0.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        movieList[index],
                        height: 20.0.hp,
                        width: 35.0.wp,
                        // width: 130.0.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieNameList[index],
                          style: categoryitems,
                        ),
                        Text(
                          '2hrs 3mins',
                          style: categoryitems,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
