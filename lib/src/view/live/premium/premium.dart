import 'package:cliveott/src/controller/paid_movies_controller.dart';
import 'package:cliveott/src/view/live/premium/premium_appbar.dart';
import 'package:cliveott/src/view/live/premium/premium_video.dart';
import 'package:cliveott/src/view/live/premium/premiumvideo_tv.dart';
import 'package:cliveott/src/view/subscribe/subscription_page.dart';

import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> with TickerProviderStateMixin {
  PaidController paidController=Get.put(PaidController());
  List tvname = [
    'Madha TV',
    
     
    
    'Malaimurasu',
    'News 7',
   
    'Sangamamam TV',
    'TV 5',
    'Deepam TV',
    'Polimer TV',
    'Malar TV',
    'Vasanth TV',
  ];
  var selectedindex = 0;
  bool isHover = false;
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
paidController.paidController();
    initPlatformState();
    super.initState();
  }

   
  @override
  Widget build(BuildContext context) {
    return Obx((() {
      if(paidController.paidmovieLoad.value){
        return Center(child: CircularProgressIndicator());
      }
      else if(paidController.paidmoviemodel.isEmpty){
        return Center(child: Text('NO DATA FOUND'));
      }
      else{
      
   
     return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                Text('Premium Channels', style: toptitleStylebold),
              ],
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Container(
            height: 150.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: paidController.paidmoviemodel[0].videoStreamingApp.length,
              itemBuilder: (BuildContext context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                      focusColor: Colors.amber ,
                      onTap: () {
                        setState(() {
                          if(paidController.paidmoviemodel[0].videoStreamingApp[0].movieAccess=='Free'){
 _isTV!
                              ? Get.to(PremiumTVVideo(
                                  index: index,
                                  name: paidController.paidmoviemodel[0].videoStreamingApp[index].movieName.toString(),
                                  url:paidController.paidmoviemodel[0].videoStreamingApp[index].movieUrl.toString()
                                ))
                              : Get.to(PremiumVideo(
                                  index: index,
                                 name: paidController.paidmoviemodel[0].videoStreamingApp[index].movieName.toString(),
                                  url:paidController.paidmoviemodel[0].videoStreamingApp[index].movieUrl.toString()
                                ));
                          }
                         else{
                           Get.to(SubscriptionPage());
                         }
                         
                          //   Get.to(
                          //       PremiumAppBar(index: index, name: tvname[index]));
                          //   print('clickkkk');
                        });
                      },
                      child:Stack(
              
              children: [
                InkWell(
                    focusColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            paidController.paidmoviemodel[0].videoStreamingApp[index].movieImage.toString(),
                            height: _isTV!?20.0.hp:15.0.hp,
                           width:  _isTV!? 20.0.wp:60.0.wp,
                            fit: BoxFit.cover,
                          )),
                    )),
                SizedBox(
                  height: 5.0.h,
                ),
                Positioned(bottom: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                        paidController.paidmoviemodel[0].videoStreamingApp[index].movieName.toString(),
                          style: categoryitems,
                        ),
                      )
                    ],
                  ),
                ),
                   Positioned( 
                    bottom:15.0.hp,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child:  Image.asset('assets/premium/tag.png',height: 8.0.hp,)
                      )
                    ],
                  ),
                ),
              ]),),
                );
              },
            ),
          ),
    ]); 
   }  }) );
     
  }
}

  
 
