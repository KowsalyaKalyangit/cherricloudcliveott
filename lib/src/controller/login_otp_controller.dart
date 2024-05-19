 
import 'package:cliveott/src/model/login_otp_model.dart';
import 'package:cliveott/src/model/register_otp_model.dart';
import 'package:cliveott/src/service/login_otp_service.dart';
 
import 'package:cliveott/src/service/register_otp_service.dart';
import 'package:cliveott/src/view/dashboard/homepage.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../view/dashboard/homescreen.dart';
import 'register_controller.dart';
 

class LoginOTPController extends GetxController {
  RxBool loginotpLoad = true.obs;
  List<LoginOtpModel> _loginotpmodel = [];
  List<LoginOtpModel> get registerotpdetails => _loginotpmodel;
  var loginotpservice = LoginOTPService();
  
   var otp = ''.obs;
  Future loginotpController({context}) async {
     if (otp.value.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter otp');
    } else {
      loginotpLoad(true);
      if (loginotpLoad.value) {
        _loadingBar(context);
      }

   
    try {
      var response = await loginotpservice.loginotpService(
           otp: otp.value);

      if (response != null) {
      
        
         loginotpLoad(false);
         
       
       
        
       
      } else {
      
           
          
        loginotpLoad(false);
         
        Get.back();
       
      }
    } catch (e) {
      rethrow;
    }
  }
}
}
void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}