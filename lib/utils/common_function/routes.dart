 

import 'package:cliveott/src/view/login/login_page.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    // GetPage(name: '/', page: () => SplashScreen()),

    GetPage(name: '/login', page: () => const LoginPage()),
    
  ];
}