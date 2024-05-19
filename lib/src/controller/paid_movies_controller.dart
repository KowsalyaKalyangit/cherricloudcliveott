 

import 'package:cliveott/src/model/paid_movies_model.dart';
import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:cliveott/src/service/paid_movies_service.dart';
import 'package:get/get.dart';

import '../model/livetv_category_model.dart';

class PaidController extends GetxController {
  RxBool paidmovieLoad = true.obs;
  List<PaidMoviesModel> _paidmoviemodel = [];
  List<PaidMoviesModel> get paidmoviemodel => _paidmoviemodel;
  var paidmoviesService = PaidMoviesService();
  Future paidController() async {
    try {
      var response = await paidmoviesService.paidMoviesService();
      if (response != null) {
        _paidmoviemodel.add(response);
        paidmovieLoad(false);
      } else {
        paidmovieLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
