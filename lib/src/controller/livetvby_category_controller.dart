 

import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/livetv_category_model.dart';
import '../model/livetvby_category_model.dart';
import '../service/livetvby_category_service.dart';
import '../service/search_service.dart';
import 'login_controller.dart';

class LiveTvByCategoryController extends GetxController {
  RxBool categoryLoad = true.obs;
   RxBool searchLoad = true.obs;
  List<LivetvByCategoryModel> _livetvcategorymodel = [];
  List<LivetvByCategoryModel> get getcategory => _livetvcategorymodel;
  var livetvbycategoryservice = LiveTvByCategoryService();
    var searchservice = SearchTVService();
  Future liveTvBycategoryController({category_id,}) async {
    //  if (categoryLoad.value) {
    //    categoryLoad(true);
    //   _loadingBar(context);
    // }
    try {
      var response = await livetvbycategoryservice.livetvBycategoryService(category_id: category_id);
      if (response != null) {
        _livetvcategorymodel.clear();
        _livetvcategorymodel.add(response);
        categoryLoad(false);
      } else {
        categoryLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  //   Future searchController({search_text,context}) async {
  //   // if (categoryLoad.value) {
  //   //    categoryLoad(true);
  //   //   _loadingBar(context);
  //   // }
   
  //   try {
  //     var response = await searchservice.searchService(
  //           search_text: search_text);

  //     if (response != null) {
  //       _livetvcategorymodel.clear();
  //       _livetvcategorymodel.add(response);
  //    // searchtext=_searchmodel[0].videoStreamingApp.liveTv[0].tvTitle.toString;
        
  //       print('printeyyyy');
        
  //       print(response);
  //       categoryLoad(false);
          
  //     } else {
  //       categoryLoad(false);
  //       Get.back();
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
 


}
void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}