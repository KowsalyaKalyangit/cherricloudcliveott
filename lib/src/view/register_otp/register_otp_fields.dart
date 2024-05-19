 

import 'package:cliveott/src/controller/register_otp_controller.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:is_tv/is_tv.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/common_function/siginin_button.dart';
import '../../../utils/textstyles.dart';
import '../../controller/login_controller.dart';
import '../../controller/register_controller.dart';

class OtpField extends StatefulWidget {
  const OtpField({Key? key}) : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  RegisterController registerController = Get.put(RegisterController());
  LoginController loginController = Get.put(LoginController());
  //OtpVerifyController otpVerifyController = Get.put(OtpVerifyController());
  RegisterOTPController registerOTPController=Get.put(RegisterOTPController());
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

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
   initPlatformState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height:
            _isTV!?
             MediaQuery.of(context).size.height * 0.2:  MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                child: PinCodeTextField(
                   textInputAction: TextInputAction.next,
                    appContext: context,
                    textStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    pastedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 5,
                    //obscureText: true,
                    // obscuringCharacter: '*',
                    // obscuringWidget: FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 
                      _isTV!? MediaQuery.of(context).size.width * 0.10:
                      MediaQuery.of(context).size.width * 0.12,
                      activeColor: appcolor,
                      selectedFillColor: appcolor,
                      selectedColor: Colors.white,
                      inactiveColor: const Color(0xffD9D9D9),
                      inactiveFillColor: Colors.white,
                      activeFillColor: hasError ? Colors.white : Colors.amber[800],
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    
                    // controller: otpVerifyController.otptext,

                    onChanged: (value) {
                      // ignore: avoid_print
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    // onCompleted: (value) {
                    //   print('success');
                    // },
                    onCompleted: (value) {
                      //otpVerifyController.otp(value);
                      registerOTPController.otp(value);
                    })),
          ),
          SizedBox(height: 10.00.h),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async{
                //loginController.loginController(context: context);
                print('printtttt');
              //    if (registerOTPController.otp.value.isEmpty) {
              //   Fluttertoast.showToast(msg: 'Please enter otp');
              // } else if (formKey.currentState!.validate()) {
              //    await registerOTPController.registerotpController(
              //      ) ;
                   
                   
              // }
await registerOTPController.registerotpController(context: context);
                   
             
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
                      'VERIFY OTP',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
            ),
          ),

             Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async{
                //loginController.loginController(context: context);
                print('printtttt');
              //    if (registerOTPController.otp.value.isEmpty) {
              //   Fluttertoast.showToast(msg: 'Please enter otp');
              // } else if (formKey.currentState!.validate()) {
              //    await registerOTPController.registerotpController(
              //      ) ;
                   
                   
              // }
  Get.to(LoginPage());
                   
             
              },
              focusColor: Colors.red.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset('assets/images/left.png',height: 40.0.h,)
                ),
              ),
            ),
          ),

Center(child: Text('Go to Login',style: toptitleStylebold,))
          
          
        ],
      ),
    );
  }
}