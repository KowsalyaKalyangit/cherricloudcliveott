import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/edit_profile_model.dart';
import '../model/user_model.dart';
import '../service/user_profile_service.dart';
import 'login_controller.dart';

class GetProfileController extends GetxController {
  RxBool profileLoad = true.obs;
  List<ProfileModel> _profileModel = [];
  List<ProfileModel> get getProfileModel => _profileModel;
  var userservice = UserService();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
//  TextEditingController password = TextEditingController();
  RxBool profileeditLoad = true.obs;
  List<ProfileEditModel> _profileditmodel = [];
  List<ProfileEditModel> get getProfileeditModel => _profileditmodel;
  RxString password = ''.obs;
  RxString country = ''.obs;
  RxString state = ''.obs;
  var image = '';

  userController() async {
    print('enterrrr------------');
    try {
      var data = await userservice.userService();
      if (data != null) {
        _profileModel.add(data);
        update();
        name.text = _profileModel[0].videoStreamingApp[0].name;

        email.text = _profileModel[0].videoStreamingApp[0].email;
        phone.text = _profileModel[0].videoStreamingApp[0].phone;
        address.text = _profileModel[0].videoStreamingApp[0].userAddress;

        log('profile-----');
        log(name.text.toString());
        //  log(_profileModel[0].videoStreamingApp[0].name.toString());

        profileLoad(false);
      } else {
        profileLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  ///
  Future geteditprofileController({context}) async {
    profileeditLoad(true);
    if (profileeditLoad.value) {
      _loadingBar(context);
    }
    try {
      var data = await userservice.userEditService(
          name: name.text,
          email: email.text,
          phone: phone.text,
          user_address: address.text,
          user_image: image,
          password: password.value,
          country: country.value,
          state: state.value);
      if (data != null) {
        _profileditmodel.clear();

        _profileditmodel.add(data);

        profileeditLoad(false);
        Get.back();
      } else {
        profileeditLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
