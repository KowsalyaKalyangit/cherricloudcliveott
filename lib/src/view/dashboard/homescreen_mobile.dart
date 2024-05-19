import 'package:cliveott/src/controller/force_update_controller.dart';
import 'package:cliveott/src/controller/login_controller.dart';
import 'package:cliveott/src/view/dashboard/homepage.dart';

import 'package:cliveott/src/view/live/livetv_category/livetv_category.dart';
import 'package:cliveott/src/view/live/movies/movie.dart';

import 'package:cliveott/src/view/subscribe/subscription_page.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/common_function/bottom_nav_bar.dart';
import 'package:cliveott/utils/common_function/constants.dart';
import 'package:cliveott/utils/common_function/helper_class.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  double? _progress;
  var url1 =
      'https://templates.cherritech.us/cherri-construction-template/assets/apk/app-release.apk';
  ForceUpdate forceUpdatecontroller = Get.put(ForceUpdate());
  String? _version;
  String? _buildNumber;
  String? _buildSignature;
  String? _appName;
  String? _packageName;
  String? _installerStore;
  _launchURL() async {
    final Uri url = Uri.parse(
        'https://templates.cherritech.us/cherri-construction-template/assets/apk/app-release.apk');
    if (!await launchUrl(url)) {
      print(url);
      throw Exception('Could not launch $url');
    }
  }

  int _currentIndex = 0;
  final List<Map<String, Widget>> _pages = [
    {
      'page': const HomePage(),
    },
    {
      'page': const LiveTvCategoryScreen(),
    },
    {
      'page': const MoviePage(),
    },
    {'page': SubscriptionPage()}
  ];
  @override
  void initState() {
    forceUpdatecontroller.getGameController();
    super.initState();
    initPlatformState();
    // _getAppVersion();
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

  showdialogFunc() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Update Clive OTT?",
          style: heading,
        ),
        content: Text(
          '''Clive recommends that you update to the latest version. You can keep using this app using this app while downloading the update''',
          style: subcategorystyle,
        ),
        actions: <Widget>[
          _progress != null
              ? const CircularProgressIndicator()
              : InkWell(
                  onTap: () {
                    FileDownloader.downloadFile(
                        url: url1.trim(),
                        onProgress: (name, progress) {
                          setState(() {
                            _progress = progress;
                          });
                        },
                        onDownloadCompleted: (value) {
                          print('path  $value ');
                          setState(() {
                            _progress = null;
                          });
                        });
                  },
                  child: Container(
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff01875f)),
                      child: Center(
                          child: Text(
                        'update',
                        style: categorytext,
                      ))),
                )
        ],
      ),
    );
  }

  void _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var version1 = sharedPreferences.getString(Constants.version);
    // final buildNumber = packageInfo.buildNumber;
    // final buildSignature = packageInfo.buildSignature;
    final appName = packageInfo.appName;
    // final packageName = packageInfo.packageName;
    // final installerStore = packageInfo.installerStore;

    setState(() {
      _version = version;
      // _buildNumber = buildNumber;
      // _buildSignature = buildSignature;
      // _appName = appName;
      // _packageName = packageName;
      // _installerStore = installerStore;

      if (_version.toString() != version1.toString()) {
        showdialogFunc();
        print(version1);
        print(_version.toString());
        print(appName);
      } else {
        print('printeyyy');
        print(forceUpdatecontroller.orderID.toString());
        print(appName);
      }
    });
  }

  LoginController loginController = Get.put(LoginController());
  var selectedindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: black1,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3, bottom: 5),
          child: BottomNavyBar(
            containerHeight: 50,
            selectedIndex: _currentIndex,
            showElevation: false,
            itemCornerRadius: 24,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.home,
                  size: 20,
                ),
                title: Text('Home'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.live_tv,
                  size: 20,
                ),
                title: Text('Game'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.movie_creation_outlined,
                  size: 20,
                ),
                title: Text('Report'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.person,
                  size: 20,
                ),
                title: Text(''),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: black,
          elevation: 5,

          title: Image.asset(
            'assets/images/clive.png',
            height: 10.0.hp,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/leadingarrow.png',
            ),
          ),
          leadingWidth: 8.0.wp,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/notification.png',
                height: 3.0.hp,
              ),
            ),
          ],
          centerTitle: true,
          //leading: Icon(Icons.list),
        ),
        body: _pages[_currentIndex]['page'],
      ),
    );
  }
}
