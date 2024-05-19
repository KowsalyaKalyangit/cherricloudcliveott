import 'package:cliveott/src/controller/user_profile_controller.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/textstyles.dart';
import 'edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  GetProfileController userController = Get.put(GetProfileController());
  @override
  void initState() {
    userController.userController();

    initPlatformState();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userController.profileLoad.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (userController.getProfileModel.isEmpty) {
        return Center(
          child: Text('No data found'),
        );
      } else {
        return Scaffold(
            body: Container(
                height: 1000.0.h,
                width: 1000.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/loginbg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.amber[900],
                                    backgroundImage: NetworkImage(userController
                                        .getProfileModel[0]
                                        .videoStreamingApp[0]
                                        .userImage
                                        .toString()),
                                  ),
                                  SizedBox(
                                    width: 2.0.wp,
                                  ),
                                  Text(
                                    'My Accounts',
                                    style: toptitleStylebold,
                                  ),
                                ],
                              ),
                              InkWell(
                                focusColor: Colors.blue,
                                onTap: () {
                                  Get.to(EditProfileScreen());
                                },
                                child: Container(
                                  height: 4.0.hp,
                                  width: 15.0.wp,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.amber[900]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Edit',
                                        style: toptitleStylebold,
                                      ),
                                      Icon(
                                        Icons.edit_outlined,
                                        color: screenbackground,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: clivecolor,
                          thickness: 1,
                        ),
                        Container(
                          height: 5.0.hp,
                          width: 100.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xff151522)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Subscription plan',
                              style: toptitleStylebold,
                            ),
                          ),
                        ),
                        // Divider(
                        //   color: clivecolor,
                        //   thickness: 1,
                        // ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: _isTV! ? 35.0.hp : 30.0.hp,
                            width: _isTV! ? 50.0.wp : 90.0.wp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff151522)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'My Info',
                                      style: categoryitems,
                                    ),
                                  ),
                                  Divider(
                                    color: clivecolor,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Name:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].name
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Email:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].email
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Mobile:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].phone
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Country:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].country
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'State:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].state
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Login Method:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        userController.getProfileModel[0]
                                            .videoStreamingApp[0].loginmethod
                                            .toString(),
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.0.hp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: _isTV! ? 35.0.hp : 30.0.hp,
                            width: _isTV! ? 50.0.wp : 90.0.wp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff151522)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15.0, left: 8),
                                  child: Text(
                                    'Devices',
                                    style: categoryitems,
                                  ),
                                ),
                                Divider(
                                  color: clivecolor,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Device 1:',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        'vivo android',
                                        style: categoryitems,
                                      ),
                                      Text(
                                        'vivo 1796',
                                        style: categoryitems,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])),
                )));
      }
    });
  }
}
