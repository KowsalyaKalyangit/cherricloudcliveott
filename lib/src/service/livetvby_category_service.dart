import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/urls.dart';
import '../model/livetv_category_model.dart';
import '../model/livetvby_category_model.dart';

class LiveTvByCategoryService {
  Future livetvBycategoryService({category_id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  var token = sharedPreferences.getString(Constants.authToken);
    var data = {
      "category_id":category_id
    };
    try {
      var response = await http.post(
        Uri.parse(Urls.livetvbycategory),body: data
        // headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        log('kkkkk');
        return LivetvByCategoryModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
