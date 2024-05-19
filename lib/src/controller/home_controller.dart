import 'dart:math';

import 'package:cliveott/src/model/home_model.dart';
import 'package:cliveott/src/service/home_service.dart';
import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool homeLoad = true.obs;
  List<HomeModel> _homemodel = [];
  List<HomeModel> get gethome => _homemodel;
  var homeservice = HomeService();
  Future homeController() async {
    try {
      var response = await homeservice.homeService();
      if (response != null) {
        _homemodel.add(response);

        homeLoad(false);
      } else {
        homeLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
