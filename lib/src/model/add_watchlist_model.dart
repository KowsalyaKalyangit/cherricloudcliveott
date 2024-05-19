// To parse this JSON data, do
//
//     final addWatchlistModel = addWatchlistModelFromJson(jsonString);

import 'dart:convert';

AddWatchlistModel addWatchlistModelFromJson(String str) => AddWatchlistModel.fromJson(json.decode(str));

String addWatchlistModelToJson(AddWatchlistModel data) => json.encode(data.toJson());

class AddWatchlistModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    AddWatchlistModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory AddWatchlistModel.fromJson(Map<String, dynamic> json) => AddWatchlistModel(
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
