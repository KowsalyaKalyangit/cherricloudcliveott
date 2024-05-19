// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
 

// class LoginControllerss extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final loginFormKey = GlobalKey<FormState>();

//   @override
//   void onInit() {
//     // Simulating obtaining the user name from some local storage
//     //  emailController.text = 'foo@foo.com';
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }

//   String? validator(String value) {
//     if (value.isEmpty) {
//       return 'Please this field must be filled';
//     }
//     return null;
//   }

//   void login() {
//     if (loginFormKey.currentState!.validate()) {
//       checkUser(emailController.text, passwordController.text).then((auth) {
//         if (auth) {
//           Get.snackbar('Login', 'Login Successfully',
//               backgroundColor: Colors.white);
          
//         } else {
//           Get.snackbar('Login', 'Invalid email or password',
//               backgroundColor: Colors.white);
//         }
//         passwordController.clear();
//       });
//     }
//   }

//   // Api Simulation
//   Future<bool> checkUser(String user, String password) {
//     if (user == 'admin' && password == '123456') {
//       return Future.value(true);
//     }
//     return Future.value(false);
//   }
// }
