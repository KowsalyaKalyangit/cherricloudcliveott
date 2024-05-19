// To parse this JSON data, do
//
//     final livetvCategoryModel = livetvCategoryModelFromJson(jsonString);

import 'dart:convert';

LivetvCategoryModel livetvCategoryModelFromJson(String str) => LivetvCategoryModel.fromJson(json.decode(str));

String livetvCategoryModelToJson(LivetvCategoryModel data) => json.encode(data.toJson());

class LivetvCategoryModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    LivetvCategoryModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory LivetvCategoryModel.fromJson(Map<String, dynamic> json) => LivetvCategoryModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int categoryId;
    String categoryName;

    VideoStreamingApp({
        required this.categoryId,
        required this.categoryName,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
    };
}
