// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    RegisterModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    String msg;
    String success;
    int tempuserid;
    int otp;

    VideoStreamingApp({
        required this.msg,
        required this.success,
        required this.tempuserid,
        required this.otp,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        msg: json["msg"],
        success: json["success"],
        tempuserid: json["tempuserid"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "success": success,
        "tempuserid": tempuserid,
        "otp": otp,
    };
}
