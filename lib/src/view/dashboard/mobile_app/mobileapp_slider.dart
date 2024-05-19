import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cliveott/src/view/live/live_channels_only.dart';
import 'package:cliveott/src/view/live/movies/movie.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/common_function/bottom_nav_bar.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../homepage.dart';

class MobileAppSlider extends StatefulWidget {
  const MobileAppSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MobileAppSliderState();
  }
}

class _MobileAppSliderState extends State<MobileAppSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  // final List<String> imgList = [
  //   'assets/category/rajini.jpg',
  //   'assets/category/rajini1.jpg',
  //   'assets/category/rajini2.jpg',
  //   'assets/category/rajini3.jpg',
  //   'assets/category/rajini4.jpg',
  //   'assets/category/rajini5.jpg'
  // ];
  final List<String> imgList = [
    'assets/images/b1.jpg',
    'assets/images/b2.jpg',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg',
    'assets/images/b5.jpg'
  ];
  var imagecontent = [
    'Sun Kudumbam',
    'Endhiran',
    'KollyWood Mass Intro',
    'Music Day',
    'Maamannan Audio Launch'
  ];
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    // var imgList = categoryController.getcategory[0].data!.bannerImage![0].bannerUrl;

    final List<Widget> imageSliders =
        homeController.gethome[0].videoStreamingApp.slider
            .map((item) => ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    item.sliderImage,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ))
            .toList();
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 1,
            child: Stack(children: [
              Positioned(
                bottom: 14,
                child: Container(
                  color: black,
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 1,
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 7.0.hp,
                        width: 100.00.wp,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black,
                            Colors.black,
                          ],
                        )),
                        child: Center(
                            child: Text(
                          homeController.gethome[0].videoStreamingApp
                              .slider[_current].sliderTitle,
                          style: GoogleFonts.ibmPlexSans(
                              textStyle: TextStyle(
                                  letterSpacing: 0.2,
                                  fontSize: 18.00,
                                  color: screenbackground,
                                  fontWeight: FontWeight.w800)),
                        ))),
                    Row(
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                              width: 1.00.hp,
                              height: 1.5.wp,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? screenbackground
                                          : Colors.yellow)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4))),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 1.0.hp,
          ),
          Container(
            height: 4.5.hp,
            width: 50.0.wp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff222326)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: screenbackground,
                ),
                Text(
                  'Watch Now',
                  style: toptitleStylebold,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
