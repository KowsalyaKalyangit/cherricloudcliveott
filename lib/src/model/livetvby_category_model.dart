// To parse this JSON data, do
//
//     final livetvByCategoryModel = livetvByCategoryModelFromJson(jsonString);

import 'dart:convert';

LivetvByCategoryModel livetvByCategoryModelFromJson(String str) => LivetvByCategoryModel.fromJson(json.decode(str));

String livetvByCategoryModelToJson(LivetvByCategoryModel data) => json.encode(data.toJson());

class LivetvByCategoryModel {
    List<VideoStreamingApp> videoStreamingApp;
    String categoryName;
    int totalRecords;
    int statusCode;

    LivetvByCategoryModel({
        required this.videoStreamingApp,
        required this.categoryName,
        required this.totalRecords,
        required this.statusCode,
    });

    factory LivetvByCategoryModel.fromJson(Map<String, dynamic> json) => LivetvByCategoryModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        categoryName: json["category_name"],
        totalRecords: json["total_records"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "category_name": categoryName,
        "total_records": totalRecords,
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int tvId;
    String tvTitle;
    String tvLogo;
    String tvAccess;
    String tvUrl;

    VideoStreamingApp({
        required this.tvId,
        required this.tvTitle,
        required this.tvLogo,
        required this.tvAccess,
        required this.tvUrl,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        tvId: json["tv_id"],
        tvTitle: json["tv_title"],
        tvLogo: json["tv_logo"],
        tvAccess: json["tv_access"],
        tvUrl: json["tv_url"],
    );

    Map<String, dynamic> toJson() => {
        "tv_id": tvId,
        "tv_title": tvTitle,
        "tv_logo": tvLogo,
        "tv_access": tvAccess,
        "tv_url": tvUrl,
    };
}
