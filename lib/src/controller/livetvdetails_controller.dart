import 'package:cliveott/src/model/livetv_details_model.dart';
import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:cliveott/src/service/livetv_details.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/livetv_category_model.dart';

class LiveTvDetailsController extends GetxController {
  RxBool categoryLoad = true.obs;
  List<LiveTvDetailsModel> _livetvdetailsmodel = [];
  List<LiveTvDetailsModel> get livetvdetails => _livetvdetailsmodel;
  var livetvdetailsservice = LiveTvDetailsService();
  
 
  Future liveTvDetailsController({user_id, tv_id}) async {
   
    try {
      var response = await livetvdetailsservice.liveTvDetailsService(
            tv_id: tv_id);

      if (response != null) {
        _livetvdetailsmodel.add(response);
        
        print('printeyyyy');
        
        print(response);
        categoryLoad(false);
      } else {
        categoryLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
