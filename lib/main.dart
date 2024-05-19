 

import 'package:cliveott/src/view/splashscreen.dart';
import 'package:cliveott/utils/common_function/constants.dart';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/common_function/routes.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogin();

  runApp(MyApp());
}

String? token;

checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  print(token.toString());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _isTV;
  final _isTVPlugin = IsTV();

  Future<void> initPlatformState() async {
    bool? isTV;

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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowUp): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.pause): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.play): const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.audioVolumeUp):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.audioVolumeUp):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.audioVolumeMute):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.microphoneVolumeDown):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.microphoneVolumeUp):
                const ActivateIntent(),
            LogicalKeySet(LogicalKeyboardKey.microphoneVolumeMute):
                const ActivateIntent(),
          },
          child: GetMaterialApp(
           
              // theme: ThemeData(
              //     brightness: Brightness.dark,
              //     primarySwatch: Colors.grey,
              //     scaffoldBackgroundColor: const Color(0xff202020),
              //     splashColor: const Color(0xff202020),
              //     backgroundColor: const Color(0xff202020),
              //     colorScheme: ColorScheme.fromSwatch(
              //       backgroundColor: Colors.grey,
              //       brightness: Brightness.dark,
              //     ).copyWith(
              //       secondary: Colors.orange,
              //       primary: Colors.grey,
              //       brightness: Brightness.dark,
              //     )),
              debugShowCheckedModeBanner: false,
              home: SplashScreen())),
    );
  }
}

 