import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/urls.dart';
import '../model/livetv_category_model.dart';

class LiveTvCategoryService {
  Future livetvcategoryService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  var token = sharedPreferences.getString(Constants.authToken);
    try {
      var response = await http.get(
        Uri.parse(Urls.livetvcategory),
        // headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        log('kkkkk');
        return LivetvCategoryModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
