 

import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:get/get.dart';

import '../model/livetv_category_model.dart';

class LiveCategoryController extends GetxController {
  RxBool categoryLoad = true.obs;
  List<LivetvCategoryModel> _livetvcategorymodel = [];
  List<LivetvCategoryModel> get getcategory => _livetvcategorymodel;
  var livetvcategoryservice = LiveTvCategoryService();
  Future liveTvcategoryController() async {
    try {
      var response = await livetvcategoryservice.livetvcategoryService();
      if (response != null) {
        _livetvcategorymodel.add(response);
        categoryLoad(false);
      } else {
        categoryLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
