// To parse this JSON data, do
//
//     final loginOtpModel = loginOtpModelFromJson(jsonString);

import 'dart:convert';

LoginOtpModel loginOtpModelFromJson(String str) => LoginOtpModel.fromJson(json.decode(str));

String loginOtpModelToJson(LoginOtpModel data) => json.encode(data.toJson());

class LoginOtpModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    LoginOtpModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory LoginOtpModel.fromJson(Map<String, dynamic> json) => LoginOtpModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    String ?userId;
    String ?name;
    String ? email;
    String ? userImage;
    String ? msg;
    String  ? success;
    String ? token;

    VideoStreamingApp({
        required this.userId,
        required this.name,
        required this.email,
        required this.userImage,
        required this.msg,
        required this.success,
        required this.token,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        userImage: json["user_image"],
        msg: json["msg"],
        success: json["success"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "user_image": userImage,
        "msg": msg,
        "success": success,
        "token": token,
    };
}
