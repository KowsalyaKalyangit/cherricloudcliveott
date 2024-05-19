import 'dart:convert';
import 'dart:developer';

 
import 'package:http/http.dart' as http;
 

import '../../utils/common_function/urls.dart';
 
import '../model/paid_movies_model.dart';

class PaidMoviesService {
  Future paidMoviesService() async {
 
    //  var token = sharedPreferences.getString(Constants.authToken);

     
    try {
      var response = await http.get(Uri.parse(Urls.paidmovies),  
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('paiddddd');
        return PaidMoviesModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
