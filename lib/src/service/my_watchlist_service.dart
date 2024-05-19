import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../../utils/common_function/urls.dart';
import 'package:http/http.dart' as http;

import '../model/add_watchlist_model.dart';
import '../model/my_watchlist_model.dart';

class MyWatchListService {
  Future myWatchlistService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);

    var data = {
      "user_id": userid ?? '',
    };
    try {
      var response = await http.post(Uri.parse(Urls.mywatchlist), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('kkkkk');

        return MyWatchlistModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
