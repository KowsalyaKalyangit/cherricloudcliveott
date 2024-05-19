import 'package:cliveott/src/view/dashboard/userProfile.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/user_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var reason;
  var city;
  TextEditingController mobile = TextEditingController();
  GetProfileController userController = Get.put(GetProfileController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black1,
      ),
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.00.h,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Name*',
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40.00.h, width: 320.00.w,
                    decoration: BoxDecoration(
                        color: bgcolor, borderRadius: BorderRadius.circular(5)),
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // enabled: false,
                      controller: userController.name,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 10.00.sp,
                              color: appcolor,
                              fontWeight: FontWeight.w700)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Email*',
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40.00.h, width: 320.00.w,
                    decoration: BoxDecoration(
                        color: bgcolor, borderRadius: BorderRadius.circular(5)),
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // enabled: false,
                      controller: userController.email,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 10.00.sp,
                              color: appcolor,
                              fontWeight: FontWeight.w700)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Phone*',
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40.00.h, width: 320.00.w,
                    decoration: BoxDecoration(
                        color: bgcolor, borderRadius: BorderRadius.circular(5)),
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // enabled: false,
                      controller: userController.phone,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 10.00.sp,
                              color: appcolor,
                              fontWeight: FontWeight.w700)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.00.h,
                  ),
                  Text(
                    'Address*',
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40.00.h, width: 320.00.w,
                    decoration: BoxDecoration(
                        color: bgcolor, borderRadius: BorderRadius.circular(5)),
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // enabled: false,
                      controller: userController.address,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 10.00.sp,
                              color: appcolor,
                              fontWeight: FontWeight.w700)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.00.h,
                  ),
                  Text(
                    "State*",
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Color(0xffD9D9D9).withOpacity(0.1),
                    height: 40.00.h, width: 320.00.w,
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // controller: userController.state,
                      style: categoryitems,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.00.h,
                  ),
                  Text(
                    "Country*",
                    style: categoryitems,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Color(0xffD9D9D9).withOpacity(0.1),
                    height: 40.00.h, width: 320.00.w,
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      // controller: userController.pincode,
                      style: categoryitems,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          //  hintText: userController.username.toString(),
                          prefixIcon: Icon(
                            Icons.pin,
                            color: appcolor,
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            userController.geteditprofileController(
                                context: context);
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'SAVE',
                              style: toptitleStylebold,
                            ),
                          ),
                          height: 40.0.h,
                          width: 100.0.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 52, 50, 71),
                            border: Border.all(color: Color(0xff283736)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
