import 'package:cliveott/src/model/register_model.dart';
import 'package:cliveott/src/service/register_service.dart';
import 'package:cliveott/src/view/dashboard/homescreen.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';
import '../view/register_otp/register_otp_screen.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  // TextEditingController type = TextEditingController();
  List<RegisterModel> _registermodel = [];
  List<RegisterModel> get getregistermodel => _registermodel;
  RxBool isRegisterLoad = true.obs;
  //otp

  var registerService = RegisterService();
  Future registerController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (name.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the name');
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
    } 
    else if (phone.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter phone');
    } 
    else {
      isRegisterLoad(true);
      if (isRegisterLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await registerService.registerService(
          name: name.text,
          email: email.text,
          phone: phone.text,
        );

        if (response != null) {
          _sharedPreferences.setString(
              Constants.id, response.videoStreamingApp[0].tempuserid.toString());
           
          Get.to(RegisterOtpPage());

          // Get.toNamed('/home');

          isRegisterLoad(false);
         // Get.back();
        } else {
          isRegisterLoad(false);
          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  // logout
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.clear().then((value) {
        name.clear();
        email.clear();
        phone.clear();
        // Get.back();
        Get.to(LoginPage());
      });
    } catch (e) {
      rethrow;
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

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          // decoration: BoxDecoration(color: Colors.amber),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const CircularProgressIndicator())),
    );
  }
}
