 
import 'package:cliveott/src/service/search_service.dart';
import 'package:flutter/material.dart';
 
import 'package:get/get.dart';

import '../model/search_model.dart';
import 'login_controller.dart';
 

class SerachTVController extends GetxController {
  RxBool searchLoad = true.obs;
  List<SerachModel> _searchmodel = [];
  List<SerachModel> get searchdetails => _searchmodel;
  var searchservice = SearchTVService();
  var searchtext;
 TextEditingController searchvalue=TextEditingController();
  Future searchController({search_text,context}) async {
   
    if (searchLoad.value) {
       searchLoad(true);
      _loadingBar(context);
    }
   
    try {
      var response = await searchservice.searchService(
            search_text: searchvalue.text);
             

      if (response != null) {
        _searchmodel.clear();
        _searchmodel.add(response);
     
        
        print('printeyyyy');
        
        print(response);
        searchLoad(false);
        
          
      } else {
        searchLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
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