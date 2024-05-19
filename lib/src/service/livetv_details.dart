import 'dart:convert';
import 'dart:developer';

import 'package:cliveott/src/model/livetv_details_model.dart';
import 'package:cliveott/utils/common_function/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/urls.dart';
import '../model/livetv_category_model.dart';

class LiveTvDetailsService {
  Future liveTvDetailsService({tv_id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);
    //  var token = sharedPreferences.getString(Constants.authToken);

    var data = {"user_id": userid ?? '', "tv_id": tv_id ?? ''};
    try {
      var response = await http.post(Uri.parse(Urls.livetvdetails), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('kkkkk');
        return LiveTvDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
