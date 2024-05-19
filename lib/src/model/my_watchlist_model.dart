// To parse this JSON data, do
//
//     final myWatchlistModel = myWatchlistModelFromJson(jsonString);

import 'dart:convert';

MyWatchlistModel myWatchlistModelFromJson(String str) => MyWatchlistModel.fromJson(json.decode(str));

String myWatchlistModelToJson(MyWatchlistModel data) => json.encode(data.toJson());

class MyWatchlistModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    MyWatchlistModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory MyWatchlistModel.fromJson(Map<String, dynamic> json) => MyWatchlistModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int id;
    int postId;
    PostType postType;
    String postTitle;
    String postImage;

    VideoStreamingApp({
        required this.id,
        required this.postId,
        required this.postType,
        required this.postTitle,
        required this.postImage,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        id: json["id"],
        postId: json["post_id"],
        postType: postTypeValues.map[json["post_type"]]!,
        postTitle: json["post_title"],
        postImage: json["post_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "post_type": postTypeValues.reverse[postType],
        "post_title": postTitle,
        "post_image": postImage,
    };


}

enum PostType {
    MOVIES
}

final postTypeValues = EnumValues({
    "Movies": PostType.MOVIES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
