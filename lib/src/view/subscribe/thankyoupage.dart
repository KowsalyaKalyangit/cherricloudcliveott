import 'package:cliveott/src/view/dashboard/homescreen.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';

class ThankyouPage extends StatefulWidget {
  const ThankyouPage({super.key});

  @override
  State<ThankyouPage> createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  bool? _isTV = false;
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
    return Scaffold(
      backgroundColor: black1,
      // appBar: AppBar(
      //   backgroundColor: black,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.0.wp,),
Center(
  child:   CircleAvatar(
    backgroundColor: clivecolor,
    radius: 50,
    child: Icon(Icons.check,color:screenbackground,size: 70,)),
  
),
SizedBox(height: 3.0.hp,),
  Text('Thank you for Subscribing',style: toptitleStylebold,),
  SizedBox(height: 1.0.wp,),
    Text('We will send you text message promotions & update ',style: toptitleStylebold,textAlign: TextAlign.center,),
    SizedBox(height: 5.0.wp,),
    Image.asset('assets/images/left.png',height: 10.0.hp,width: 10.0.wp,),
     SizedBox(height: 2.0.wp,),
    InkWell(
      focusColor: Colors.red,
      onTap: () {
        Get.to(HomeScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
          height: _isTV!?  10.0.hp:5.0.hp,
          
          width: _isTV!?  15.0.wp:40.0.wp,
          decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.amber[900],
        ),
        child: Center(child: Text('Go to Home',style: toptitleStylebold,)),
        ),
      ),
    )

  
        ],
      ),
    );
  }
}