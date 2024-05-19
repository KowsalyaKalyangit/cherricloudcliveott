import 'dart:convert';
import 'dart:developer';

import 'package:cliveott/utils/common_function/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/urls.dart';
import '../model/home_model.dart';
import '../model/movie_details_model.dart';

class MovieDetailsService {
  Future<MovieDetailsModel?> movieDetailsService({movie_id, user_id}) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var user_id = sharedPreferences.getString(Constants.userid);
    //  var token = sharedPreferences.getString(Constants.authToken);
    var data = {"user_id": user_id ?? "", "movie_id": movie_id ?? ""};
    log(data.toString());
    try {
      var response = await http.post(Uri.parse(Urls.moviedetails), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('kkkkk');
        return MovieDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
