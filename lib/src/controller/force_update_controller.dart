import 'package:cliveott/src/service/forceupdate_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../model/force_update_model.dart';

class ForceUpdate extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ForceupdateModel>[];
  List<ForceupdateModel> get listData => _listData;
  RxBool isgameLoading = true.obs;
  
  RxString orderID = ''.obs;
  var datavalue;
  Map map = {};
  Future getGameController() async {
        SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    isgameLoading(true);
    try {
      _listData.clear();
      var data = await ForceUpdateService().getData(validate: 'fRTgNz');
      if (data != null) {
        _listData.add(data);
   var storeid= _sharedPreferences.setString(
              Constants.version, data.version.toString());
        isgameLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
