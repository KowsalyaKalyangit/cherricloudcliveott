// To parse this JSON data, do
//
//     final serachModel = serachModelFromJson(jsonString);

import 'dart:convert';

SerachModel serachModelFromJson(String str) => SerachModel.fromJson(json.decode(str));

String serachModelToJson(SerachModel data) => json.encode(data.toJson());

class SerachModel {
    VideoStreamingApp videoStreamingApp;
    int statusCode;

    SerachModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory SerachModel.fromJson(Map<String, dynamic> json) => SerachModel(
        videoStreamingApp: VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": videoStreamingApp.toJson(),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    List<dynamic> movies;
    List<dynamic> shows;
    List<dynamic> sports;
    List<LiveTv> liveTv;

    VideoStreamingApp({
        required this.movies,
        required this.shows,
        required this.sports,
        required this.liveTv,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        movies: List<dynamic>.from(json["movies"].map((x) => x)),
        shows: List<dynamic>.from(json["shows"].map((x) => x)),
        sports: List<dynamic>.from(json["sports"].map((x) => x)),
        liveTv: List<LiveTv>.from(json["live_tv"].map((x) => LiveTv.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x)),
        "shows": List<dynamic>.from(shows.map((x) => x)),
        "sports": List<dynamic>.from(sports.map((x) => x)),
        "live_tv": List<dynamic>.from(liveTv.map((x) => x.toJson())),
    };
}

class LiveTv {
    int tvId;
    String tvTitle;
    String tvLogo;
    String tvAccess;

    LiveTv({
        required this.tvId,
        required this.tvTitle,
        required this.tvLogo,
        required this.tvAccess,
    });

    factory LiveTv.fromJson(Map<String, dynamic> json) => LiveTv(
        tvId: json["tv_id"],
        tvTitle: json["tv_title"],
        tvLogo: json["tv_logo"],
        tvAccess: json["tv_access"],
    );

    Map<String, dynamic> toJson() => {
        "tv_id": tvId,
        "tv_title": tvTitle,
        "tv_logo": tvLogo,
        "tv_access": tvAccess,
    };
}
