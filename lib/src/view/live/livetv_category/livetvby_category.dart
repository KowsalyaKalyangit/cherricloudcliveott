 

import 'package:cliveott/src/view/live/livetv_category/livetv_mobile.dart';
import 'package:cliveott/src/view/live/livetv_category/livetv_tv_video.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../../utils/textstyles.dart';
import '../../../controller/livetvby_category_controller.dart';
import '../../../controller/search_controller.dart';
import '../../category/category_videos.dart';

class LiveTvByCategoryScreen extends StatefulWidget {
  LiveTvByCategoryScreen({super.key, this.categoryid});
  final String? categoryid;
  @override
  State<LiveTvByCategoryScreen> createState() => _LiveTvByCategoryScreenState();
}

class _LiveTvByCategoryScreenState extends State<LiveTvByCategoryScreen> {
  LiveTvByCategoryController liveTvByCategoryController =
      Get.put(LiveTvByCategoryController());
        // SerachController serachController=Get.put(SerachController());
        TextEditingController text=TextEditingController();
      var store;
  @override
  void initState() {
    initPlatformState();
    new Future.delayed(Duration.zero,() {
      liveTvByCategoryController.liveTvBycategoryController(
        category_id: widget.categoryid.toString(),);
    });
   
      //  serachController.searchController(search_text: text.text,context: context);
    super.initState();
  }

  bool? _isTV = false;
  final _isTVPlugin = IsTV();
bool enable=true;
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
    return Obx(() {
      if (liveTvByCategoryController.categoryLoad.value ) {
        return Center(child: CircularProgressIndicator());
      } else if (liveTvByCategoryController
          .getcategory.isEmpty ) {
        return Scaffold(
         
          body: Center(
              child: Text(
            'NO DATA FOUND..!',
            style: categorystyle,
          )),
        );
      } else {
        return Scaffold(
          backgroundColor: black1,
        //    appBar: AppBar(
        //     automaticallyImplyLeading: false,
            
        //  title:    Padding(
        //                         padding: const EdgeInsets.only(left: 10,right: 10),
        //                         child: Container(
        //                           height: 5.0.hp,
        //                           width: 100.0.wp,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(50),
                                    
        //                             border: Border.all(color: screenbackground,)),
        //                           child: Row(
        //                             children: [
        //                               Container(
        //                                  width: 70.0.wp,
        //                                 child: TextFormField(
        //                                   onFieldSubmitted: (value) {
        //                                     setState(() {
                                                
                                              
                                                 
        //                                          serachController.searchController(search_text: value,context: context).then((value){
        //                                           // Get.to(LiveTvByCategoryScreen(categoryid: widget.categoryid.toString(),));
                                                 
        //                                        Get.back();
        //                                          });
                                                
                                              
        //                                     });
                                            
        //                                   },
                                        
        //                                 ),
        //                               ),
        //                               Container(height: 6.0.hp,width: 16.0.wp,
                                      
        //                               decoration: BoxDecoration(
        //                                 color: clivecolor,
        //                                 borderRadius: BorderRadius.only(topRight: Radius.circular(50),bottomRight:  Radius.circular(50))
        //                               ),
        //                               child: InkWell(
        //                                 onTap: () {
        //                                   setState(() {
                                          

        //                                   });
        //                                 },
        //                                 child: Center(child: Icon(Icons.search),)),
        //                               )
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //   ),
          appBar: AppBar(
            backgroundColor: black,
            title: Text(liveTvByCategoryController.getcategory[0].categoryName),
          ),
          body: SingleChildScrollView(
            child: Container(
                height: 1000.0.h,
                width: 1000.0.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bgbg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child:   
                
                
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: liveTvByCategoryController.getcategory[0].videoStreamingApp.length
                         
                        ,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        childAspectRatio: 3.50 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0),
                    itemBuilder: (BuildContext context, int index) {
                      var categorydata = liveTvByCategoryController
                          .getcategory[0].videoStreamingApp[index];
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          focusColor: Colors.red.withOpacity(0.2),
                          onTap: () {
                            _isTV!
                                ? Get.to(LiveTvTVVideo(
                                    tvurl: categorydata.tvUrl.toString(),
                                
                                    name: categorydata.tvTitle.toString(),
                                    tvid: categorydata.tvId.toString(),
                                  ))
                                : Get.to(MobileCategoryVideo(
                                  tvid: categorydata.tvId.toString(),
                                    tvurl: categorydata.tvUrl.toString(),
                                    tvtitle: categorydata.tvTitle.toString(),
                                  ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  //  / color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        categorydata.tvLogo,
                                        // height: 15.0.hp,
                                        // width: 50.0.wp,
                                        // fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Text(
                                    categorydata.tvTitle,
                                    style: toptitleStylebold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )  ),
          ),
        );
      }
    });
  }
}
