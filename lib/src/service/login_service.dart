import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/common_function/urls.dart';
import '../model/login_model.dart';

class LoginService {
  Future<LoginModel?> loginService({username}) async {
    try {
      var data = {
        'username': username ?? '',
         
      };
      print('kkkkkkkkkkkkkkkkkkkkkkk');
      log(data.toString());
      var response = await http.post(Uri.parse(Urls.login), body: data);
      var jsonresponse = json.decode(response.body);
      log(jsonresponse.toString());

      if (response.statusCode == 200) {
         
        return LoginModel.fromJson(jsonresponse);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
