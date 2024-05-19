 
import 'package:cliveott/src/view/subscribe/thankyoupage.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';
 

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  var selectedindex = 0;
  var index;
  var indexindex;
  
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
  initPlatformState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
       appBar: AppBar(
        toolbarHeight: 7.0.hp,
        backgroundColor: black,
        automaticallyImplyLeading: false,
        title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  focusColor: selectedindex==0?Colors.blue:Colors.red,
                  onTap: () {
                    setState(() {
                      selectedindex = 0;
                      print('ccc');
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: _isTV!?6.0.hp:
                      5.0.hp,
                      width:_isTV!?15.0.wp:
                      35.0.wp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appcolortext
                        // gradient: LinearGradient(
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     colors: <Color>[Colors.blue, Colors.black,Colors.blue]),
                      ),
                      child: Center(
                        child: Text('Premium',
                            style: TextStyle(
                              fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                    ),
                  )),
              InkWell(
                  focusColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      selectedindex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: _isTV!?6.0.hp:
                      5.0.hp,
                      width:_isTV!?15.0.wp:
                      35.0.wp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                          color: appcolortext,
                        // gradient: LinearGradient(
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     colors: <Color>[Colors.blue, Colors.black]),
                      ),
                      child: Center(
                        child: Text('Basics',
                            style: TextStyle(
                               fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                    ),
                  )),
            ],
          ),
       ),
      body: Container(
        height: 100.0.hp,
        width: 100.0.wp,
         decoration: BoxDecoration(
                      image: DecorationImage(
                        //   image: AssetImage("assets/images/background.png"),
                        image: AssetImage('assets/images/loginbg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
        child: SingleChildScrollView(
          child: Column(children: [
            
           
            selectedindex == 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 5.0),
                    child: Container(
                      height: 100.0.hp,
                
                      //  color: Colors.red,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.block),
                              title: Text(
                                'Ad free viewing',
                                style: toptitleStylebold,
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.tv,
                                color: Colors.white,
                              ),
                              title: Text('Access on mobile + Large screens ',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.sports_baseball,
                                color: Colors.white,
                              ),
                              title: Text(
                                  'Adds free movies and shows (experts sports)',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.device_hub,
                                color: Colors.white,
                              ),
                              title: Text(
                                  'Number of 4 devices that can be logged in',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                              title: Text('Max video quality- full HD 2160p',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.audiotrack,
                                color: Colors.white,
                              ),
                              title: Text('Min audio quality-Dolby Atmos',
                                  style: toptitleStyle),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      focusColor: Colors.blue,
                                      onTap: () {
                                        setState(() {
                                            index=0;
                                          print('ccc');
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            height: _isTV!?8.0.hp:6.0.hp,
                                          width: 
                                          _isTV!?10.0.wp:
                                          30.0.wp,
                                          decoration: BoxDecoration(
                                            color: index==0?Colors.amber.shade900.withOpacity(0.2):Colors.transparent,
                                              borderRadius: BorderRadius.circular(5),
                                              border:
                                                  Border.all(color: Colors.white)),
                                          child: Center(
                                            child: Text('Premium \u{20B9}899/year',
                                                style: TextStyle(
                                                
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),textAlign: TextAlign.center,),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                focusColor: Colors.red,
                                onTap: () {
                                  //Get.to(PaymentPage());
                                  Get.to(ThankyouPage());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40.0.h,
                                    width: _isTV!?30.0.wp:
                                    300.0.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: con6
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.topCenter,
                                      //     end: Alignment.bottomCenter,
                                      //     colors: <Color>[Colors.blue, Colors.black]),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Continue with super',
                                      style: toptitleStylebold,
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                    child: Container(
                      height: 100.0.hp,
                
                      //  color: Colors.red,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.block,
                                color: screenbackground,
                              ),
                              title: Text('Watch with advertisement',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.tv,
                                color: screenbackground,
                              ),
                              title: Text('Access restricted to one mobile only ',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.sports_baseball,
                                color: screenbackground,
                              ),
                              title:
                                  Text('No offine download', style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.device_hub,
                                color: screenbackground,
                              ),
                              title: Text(
                                  'Number of 2 devices that can be logged in',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.video_call,
                                color: screenbackground,
                              ),
                              title: Text('Max video quality- full HD 1080p',
                                  style: toptitleStyle),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.audiotrack,
                                color: screenbackground,
                              ),
                              title: Text('Min audio quality- Dolby Atmos',
                                  style: toptitleStyle),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Material(
                                   color: Colors.transparent,
                                  child: InkWell(
                                      focusColor: Colors.blue,
                                      onTap: () {
                                        setState(() {
                                          indexindex = 0;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: _isTV!?8.0.hp:6.0.hp,
                                            width: 
                                            _isTV!?10.0.wp:
                                            30.0.wp,
                                          decoration: BoxDecoration(
                                            color: indexindex==0?Colors.amber.shade900.withOpacity(0.2):Colors.transparent,
                                              borderRadius: BorderRadius.circular(5),
                                              border:
                                                  Border.all(color: Colors.white)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Premium',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.white)),
                                              Text('\u{20B9}1499/year',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Material(
                                   color: Colors.transparent,
                                  child: InkWell(
                                      focusColor: Colors.blue,
                                      onTap: () {
                                        setState(() {
                                           indexindex = 1;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                           height: _isTV!?8.0.hp:6.0.hp,
                                            width: 
                                            _isTV!?10.0.wp:
                                            30.0.wp,
                                          decoration: BoxDecoration(
                                            color: indexindex==1?Colors.amber.shade900.withOpacity(0.2):Colors.transparent,
                                              borderRadius: BorderRadius.circular(5),
                                              border:
                                                  Border.all(color: Colors.white)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Premium',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.white)),
                                              Text('\u{20B9}299/year',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0.h,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                focusColor: Colors.red,
                                onTap: () {
                                 // Get.to(PaymentPage());
                                 Get.to(ThankyouPage());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40.0.h,
                                    width: _isTV!?30.0.wp:
                                        300.0.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: con6
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.topCenter,
                                      //     end: Alignment.bottomCenter,
                                      //     colors: <Color>[Colors.blue, Colors.blue]),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Continue with Premium',
                                      style: toptitleStylebold,
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}
