import 'package:cliveott/src/view/dashboard/homescreen.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common_function/constants.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';
import '../view/login/login_otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController type = TextEditingController();
  List<LoginModel> _loginmodel = [];
  List<LoginModel> get getloginmodel => _loginmodel;
  RxBool isloginLoad = true.obs;
  //otp

  var loginService = LoginService();
  Future loginController({context}) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (username.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email/phone');
    }  else {
      isloginLoad(true);
      if (isloginLoad.value) {
        _loadingBar(context);
      }

      try {
        var response = await loginService.loginService(
          username: username.text,
         
        );

        if (response != null) {
          _sharedPreferences.setString(
              Constants.token, response.videoStreamingApp[0].token.toString());
          _sharedPreferences.setString(Constants.userid,
              response.videoStreamingApp[0].userId.toString());
          
          Get.to(LoginOtpPage());

          // Get.toNamed('/home');

          isloginLoad(false);
           
        } else {
           isloginLoad(false);
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
        username.clear();
        password.clear();
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
