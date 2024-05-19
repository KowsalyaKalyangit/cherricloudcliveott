 

import 'package:cliveott/src/controller/register_controller.dart';
import 'package:cliveott/src/view/login/login_page.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

import '../../../utils/common_function/siginin_button.dart';
import '../../../utils/textstyles.dart';

class SignupInputFields extends StatefulWidget {
  const SignupInputFields({Key? key}) : super(key: key);

  @override
  State<SignupInputFields> createState() => _SignupInputFieldsState();
}

class _SignupInputFieldsState extends State<SignupInputFields> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;
  bool _isPinnewHidden1 = true;
  RegisterController registerController=Get.put(RegisterController());

  @override
  void initState() {
    //registerController.registerController();
    initPlatformState();
    super.initState();
  }

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  void _togglecnewPinView1() {
    setState(() {
      _isPinnewHidden1 = !_isPinnewHidden1;
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 3.00.h),
             
           
            
           
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
               controller: registerController.name,
              keyboardType: TextInputType.name,
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
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon:
                      Icon(Icons.person, color: screenbackground, size: 20),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
           SizedBox(height: 10.00.h),
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
              controller: registerController.email,
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
                  hintText: 'Email',
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
           SizedBox(height: 10.00.h),
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
              controller: registerController.phone,
              keyboardType: TextInputType.phone,
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
                  hintText: 'Phone',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon:
                      Icon(Icons.phone, color: screenbackground, size: 20),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: const OutlineInputBorder(
                    gapPadding: 4,
                  )),
            ),
          ),
            SizedBox(height: 20.00.h),
            Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
               if(formKey.currentState!.validate()){
                registerController.registerController(context: context);
               }
               
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
                      'SIGN UP',
                      style: toptitleStylebold,
                    ),
                  ),
                ),
              ),
            ),
          ),
            SizedBox(height: 3.00.h),
          ],
        ),
      ),
    );
  }
}
