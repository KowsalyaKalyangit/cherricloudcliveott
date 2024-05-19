// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String msg;
    int success;
    int statusCode;
    List<VideoStreamingApp> videoStreamingApp;

    ProfileModel({
        required this.msg,
        required this.success,
        required this.statusCode,
        required this.videoStreamingApp,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        msg: json["msg"],
        success: json["success"],
        statusCode: json["status_code"],
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "success": success,
        "status_code": statusCode,
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
    };
}

class VideoStreamingApp {
    String userId;
    String name;
    String email;
    String phone;
    String userAddress;
    String userImage;
    String state;
    String country;
    String loginmethod;
    String msg;
    String success;

    VideoStreamingApp({
        required this.userId,
        required this.name,
        required this.email,
        required this.phone,
        required this.userAddress,
        required this.userImage,
        required this.state,
        required this.country,
        required this.loginmethod,
        required this.msg,
        required this.success,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        userAddress: json["user_address"],
        userImage: json["user_image"],
        state: json["state"],
        country: json["country"],
        loginmethod: json["loginmethod"],
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "user_address": userAddress,
        "user_image": userImage,
        "state": state,
        "country": country,
        "loginmethod": loginmethod,
        "msg": msg,
        "success": success,
    };
}
