import 'dart:convert';
import 'dart:developer';

import 'package:cliveott/src/model/register_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
 
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../../utils/common_function/urls.dart';
import 'package:http/http.dart' as http;

 

class RegisterOTPService {
  Future registerotpService({otp}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.get(Constants.id);

    var data = {
      "tempuserid": id ?? '',
      "otp":otp??''
    };
    try {
      var response = await http.post(Uri.parse(Urls.registerotp), body: data
          // headers: {'Authorization': 'Bearer $token'},
          );

      if (response.statusCode == 200) {
        log(response.body);
        log('kkkkk');
        var jsonresponse=jsonDecode(response.body);
         Fluttertoast.showToast(msg: jsonresponse['VIDEO_STREAMING_APP'][0]['msg'].toString());
         Get.back();

        return RegisterModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
