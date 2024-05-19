// To parse this JSON data, do
//
//     final profileEditModel = profileEditModelFromJson(jsonString);

import 'dart:convert';

ProfileEditModel profileEditModelFromJson(String str) => ProfileEditModel.fromJson(json.decode(str));

String profileEditModelToJson(ProfileEditModel data) => json.encode(data.toJson());

class ProfileEditModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    ProfileEditModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory ProfileEditModel.fromJson(Map<String, dynamic> json) => ProfileEditModel(
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
