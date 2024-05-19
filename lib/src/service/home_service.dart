import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/urls.dart';
import '../model/home_model.dart';

class HomeService {
  Future homeService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //  var token = sharedPreferences.getString(Constants.authToken);
    try {
      var response = await http.post(
        Uri.parse(Urls.home),
        // headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        log('kkkkk');
        log(response.body);
        return HomeModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
