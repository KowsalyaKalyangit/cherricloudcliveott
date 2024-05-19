import 'dart:async';

import 'package:cliveott/src/view/login/login_page.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/common_function/constants.dart';
import 'dashboard/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
  void initState() {
    super.initState();
    initPlatformState();
    Timer(const Duration(seconds: 3), () async {
      String? token;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Constants.token);
      if (token != null) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return const HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: HomeScreen(),
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return const HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: const LoginPage(),
              );
            },
          ),
        );
      }
    }

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const LoginScreen())
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbackground,
      body: Stack(
        children: [
          Container(
            height: 100.0.hp,
            width: 100.0.wp,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: Center(child: Image.asset('assets/images/clive.png')))
        ],
      ),
    );
  }
}
