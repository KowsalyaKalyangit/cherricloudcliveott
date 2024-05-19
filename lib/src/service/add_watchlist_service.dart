import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../../utils/common_function/urls.dart';
import 'package:http/http.dart' as http;

import '../model/add_watchlist_model.dart';

class AddWatchListService {
  Future addWatchlist({post_id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);
    var token = sharedPreferences.getString(Constants.userid);

    var data = {
      "user_id": userid ?? '',
      "post_id": post_id ?? '',
      "post_type": "Movies"
    };
    try {
      var response = await http.post(Uri.parse(Urls.addwatchlist), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        var jsonresponse = jsonDecode(response.body);
        log(response.body);
        log('kkkkk');

        return AddWatchlistModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
