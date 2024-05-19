// To parse this JSON data, do
//
//     final registerOtpModel = registerOtpModelFromJson(jsonString);

import 'dart:convert';

RegisterOtpModel registerOtpModelFromJson(String str) => RegisterOtpModel.fromJson(json.decode(str));

String registerOtpModelToJson(RegisterOtpModel data) => json.encode(data.toJson());

class RegisterOtpModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    RegisterOtpModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory RegisterOtpModel.fromJson(Map<String, dynamic> json) => RegisterOtpModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    String ?msg;
    String ?success;

    VideoStreamingApp({
        required this.msg,
        required this.success,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "success": success,
    };
}
