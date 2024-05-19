import 'dart:convert';
import 'dart:developer';

import 'package:cliveott/src/model/register_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/common_function/urls.dart';
 

class RegisterService {
  Future<RegisterModel?> registerService({name, email, phone}) async {
    try {
      var data = {
        'name': name ?? '',
        'email': email ?? '',
        "phone":phone??''
      };
      print('kkkkkkkkkkkkkkkkkkkkkkk');
      log(data.toString());
      var response = await http.post(Uri.parse(Urls.register), body: data);
      var jsonresponse = json.decode(response.body);
      log(jsonresponse.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['VIDEO_STREAMING_APP'][0]['msg'].toString());
        Get.back();
        
        return RegisterModel.fromJson(jsonresponse);
      } else {
        
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
