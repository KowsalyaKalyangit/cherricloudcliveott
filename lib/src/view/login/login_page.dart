import 'dart:ui';

import 'package:cliveott/src/view/register/signupscreen.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/login_controller.dart';
import 'login_input_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    initPlatformState();
    super.initState();
  }
  bool? _isTV = false;
  final _isTVPlugin = IsTV();

  Future<void> initPlatformState() async {
    bool? isTV;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isTV = await _isTVPlugin.check() ?? false;
    } on PlatformException {
      isTV = false;
    }

    if (!mounted) return;

    setState(() {
      _isTV = isTV ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cherritech.us/ott/images/bg/login_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.10, sigmaY: 0.10),
                child: Container(
                  
                    decoration: BoxDecoration(
                      //color: Colors.black.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Container(
                            height: 400.0.h,
                            width: _isTV!?200.w:
                            300.w,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 23, 23, 23),
                          borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 40.0.h,),
                                      Text(
                                        'Welcome Back',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: clivecolor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Sign in into continue',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0.h,
                                  ),
                                  LoginInputFields(),
                                  
                                  Center(
                                    child: Text(
                                      'Forgot your password?',
                                      style: toptitleStylebold,
                                    ),
                                  ),
                                   SizedBox(height: 20.0.h,),
                                  Container(
                                    width: 
                                    _isTV!?90.0.w:
                                    
                                    220.0.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      
                                      children: [
                                        Text(
                                          'Dont have an account ? ',
                                          style: toptitleStyle,
                                        ),
                                         Material(
                                          color: Colors.transparent,
                                           child: InkWell(
                                            focusColor: Colors.white.withOpacity(0.2),
                                            onTap: () {
                                              print('register');
                                              Get.to(SignupPage());
                                            },
                                             child: Container(
                                            
                                               child: Center(
                                                 child: Text(
                                                  'Signup',
                                                  style:  TextStyle(
        letterSpacing: 0.2,
        fontSize: 16.00,
        color: clivecolor,
        fontWeight: FontWeight.w800),
                                                                                       ),
                                               ),
                                             ),
                                           ),
                                         ),
                                      ],
                                    ),
                                  ),
                                   SizedBox(height: 4.0.h,),
                                  Center(
                                    child: Container(
                                      height: 2.0.h,
                                      width: _isTV!?40.0.w:
                                      
                                      100.w,
                                      color: clivecolor
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      height: 25.0.h,
                                      width: 100.w,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    )))));
  }
}
