// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    LoginModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int userId;
    String name;
    String email;
    String userImage;
    String msg;
    String success;
    String token;

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
        name: json["name"]??"",
        email: json["email"]??"",
        userImage: json["user_image"]??'',
        msg: json["msg"]??"",
        success: json["success"]??'',
        token: json["token"]??''
        ,
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
