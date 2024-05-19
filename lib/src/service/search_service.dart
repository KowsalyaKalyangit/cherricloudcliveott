import 'dart:convert';
import 'dart:developer';

 
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../../utils/common_function/urls.dart';
import 'package:http/http.dart' as http;
 
import '../model/livetvby_category_model.dart';
import '../model/search_model.dart';

class SearchTVService {
  Future searchService({search_text}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);

    var data = {
      "search_text": search_text ?? '',
    };
    try {
      var response = await http.post(Uri.parse(Urls.search), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        var jsonResponse=jsonDecode(response.body);
        log('kkkkk');
       // return jsonResponse.map((product)=>{LivetvByCategoryModel.fromJson(product)}).toList();
        // return jsonResponse
        //   .map((products) => new SerachModel.fromJson(products))
          // .toList();

    return SerachModel.fromJson(jsonDecode(response.body));
      } else {
         
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }


  
}
