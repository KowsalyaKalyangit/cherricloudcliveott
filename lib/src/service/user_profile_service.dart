import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../../utils/common_function/urls.dart';
import 'package:http/http.dart' as http;

import '../model/edit_profile_model.dart';
import '../model/user_model.dart';

class UserService {
  userService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);

    var data = {
      "user_id": userid ?? '',
    };
    log(data.toString());
    try {
      var response = await http.post(Uri.parse(Urls.profile), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);

        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future userEditService(
      {user_image,
      name,
      email,
      phone,
      password,
      user_address,
      country,
      state}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userid = sharedPreferences.get(Constants.userid);

    var data = {
      "user_id": userid ?? '',
      "user_image": user_image ?? "",
      "name": name ?? '',
      "email": email ?? '',
      "phone": phone ?? '',
      "password": password ?? '',
      "user_address": user_address ?? '',
      "country": country ?? '',
      "state": state ?? ''
    };
    log(data.toString());

    try {
      var response = await http.post(Uri.parse(Urls.profileedit), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('kkkkk');

        return ProfileEditModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
