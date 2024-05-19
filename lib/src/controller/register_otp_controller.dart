 
import 'package:cliveott/src/model/register_otp_model.dart';
 
import 'package:cliveott/src/service/register_otp_service.dart';
import 'package:cliveott/src/view/dashboard/homepage.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../view/dashboard/homescreen.dart';
import 'register_controller.dart';
 

class RegisterOTPController extends GetxController {
  RxBool registerotpLoad = true.obs;
  List<RegisterOtpModel> _registerotpmodel = [];
  List<RegisterOtpModel> get registerotpdetails => _registerotpmodel;
  var registerotpservice = RegisterOTPService();
  
   var otp = ''.obs;
  Future registerotpController({context}) async {
     if (otp.value.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter otp');
    } else {
      registerotpLoad(true);
      if (registerotpLoad.value) {
        _loadingBar(context);
      }

   
    try {
      var response = await registerotpservice.registerotpService(
           otp: otp.value);

      if (response != null) {
       Get.to(LoginPage());
        
         registerotpLoad(false);
         
       
       
        
       
      } else {
      
           
          
        registerotpLoad(false);
         
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