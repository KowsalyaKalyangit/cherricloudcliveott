import 'package:cliveott/src/view/dashboard/homepage.dart';
import 'package:cliveott/src/view/login/login_otp_screen.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../utils/colors.dart';
import '../../controller/login_controller.dart';

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  State<LoginInputFields> createState() => _LoginInputFieldsState();
}

class _LoginInputFieldsState extends State<LoginInputFields> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());

  bool _isPinnewHidden = true;
  bool select = true;
  bool select1 = true;
  var selectvalue;
  var selectedindex = 0;

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }
  bool? _isTV = false;
  final _isTVPlugin = IsTV();

  Future<void> initPlatformState() async {
    bool? isTV;
    //SharedPreferences prefs = await SharedPreferences.getInstance();
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
  void initState() {
  initPlatformState();
    super.initState();
  }
  final ValueNotifier<bool> isEnabled = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.00.h, 
            
            
            width: _isTV!?100.00.w:
            
            
            250.00.w,
            // padding: const EdgeInsets.only(
            //   left: 20,
            //   right: 20,
            // ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              style: toptitleStyle,
              controller: loginController.username,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: screenbackground, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: const Color(0xffC6C6C6).withOpacity(0.5),
                        width: 1),
                  ),
                  fillColor: const Color(0xffC6C6C6),
                  hintText: 'Email/Phone',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon:
                      Icon(Icons.email, color: screenbackground, size: 20),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          // Container(
          //   height: 40.00.h,
          //   width: 200.00.w,
          //   child: TextFormField(
          //     textInputAction: TextInputAction.next,
          //     controller: loginController.password,
          //     obscureText: _isPinnewHidden,
          //     style: toptitleStyle,
          //     decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide:
          //               const BorderSide(color: screenbackground, width: 1),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide: BorderSide(
          //               color: const Color(0xffC6C6C6).withOpacity(0.5),
          //               width: 1),
          //         ),
          //         // suffixIcon: InkWell(
          //         //   focusColor: Colors.red,
          //         //   onTap: () {
          //         //     setState(() {
          //         //       _togglecnewPinView();
          //         //     });
          //         //   },
          //         //   child: Padding(
          //         //     padding:
          //         //         const EdgeInsets.only(top: 15, left: 5, bottom: 15),
          //         //     child: Icon(
          //         //       _isPinnewHidden
          //         //           ? Icons.visibility
          //         //           : Icons.visibility_off,
          //         //       size: MediaQuery.of(context).size.height * 0.025,
          //         //       color: screenbackground,
          //         //     ),
          //         //   ),
          //         // ),
          //         fillColor: const Color(0xffC6C6C6),
          //         hintText: 'Password',
          //         contentPadding: const EdgeInsets.only(left: 10),
          //         hintStyle: toptitleStyle,
          //         border: const OutlineInputBorder(
          //           gapPadding: 4,
          //         )),
          //   ),
          // ),
          SizedBox(
            height: 20.0.h,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                loginController.loginController(context: context);
                print('printtttt');
              },
              focusColor: Colors.red.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35.0.h,
                  width: 100.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: clivecolor),
                  child: Center(
                    child: Text(
                      'Login',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     height: 30.0.h,
          //     width: 150.0.w,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           height: 25.h,
          //           width: 20.w,
          //           child: Checkbox(
          //             side: BorderSide(width: 2, color: Colors.white),
          //             checkColor: Colors.white,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(100)),
          //             activeColor: Colors.red,
          //             value: this.select,
          //             onChanged: (value) {
          //               setState(() {
          //                 this.select = value!;
          //               });
          //             },
          //           ),
          //         ),
          //         Text(
          //           'Remember Me',
          //           style: toptitleStyle,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     height: 50.0.h,
          //     width: 208.0.w,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           height: 20.h,
          //           width: 20.w,
          //           child: Checkbox(
          //             checkColor: Colors.white,
          //             activeColor: Colors.red,
          //             side: BorderSide(width: 2, color: Colors.white),
          //             value: this.select1,
          //             onChanged: (value) {
          //               setState(() {
          //                 this.select1 = value!;
          //               });
          //             },
          //           ),
          //         ),
          //         RichText(
          //           text: TextSpan(
          //             text: 'By Signing in you accept ',
          //             style: toptitleStyle,
          //             children: <TextSpan>[
          //               TextSpan(
          //                   text: ' Terms ',
          //                   style: TextStyle(
          //                     color: Colors.red,
          //                     fontWeight: FontWeight.bold,
          //                   )),
          //               TextSpan(text: 'and', style: toptitleStyle),
          //               TextSpan(
          //                   text: '\nPrivacy Policy',
          //                   style: TextStyle(color: Colors.red)),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0.h,
          // ),

          // Container(
          //   height: 60.0.h,
          //   width: 500.w,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [

          //       InkWell(
          //         onTap: () {},
          //         focusColor: Colors.red,
          //         child: Container(
          //           height: 35.0.h,
          //           width: 100.0.w,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white),
          //           child: Center(
          //             child: Text(
          //               'Skip',
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // )
          SizedBox(
            height: 20.0.h,
          ),
          // ValueListenableBuilder<bool>(
          //   valueListenable: isEnabled,
          //   builder: (context, value, child) {
          //     return ElevatedButton(
          //         style: ButtonStyle(),
          //         onPressed: () {
          //           print('errrr');
          //         },
          //         child: Container(
          //             height: 40.00.h, width: 10.00.w, child: Text("Login")));
          //   },
          // ),
        ],
      ),
    );
  }
}
