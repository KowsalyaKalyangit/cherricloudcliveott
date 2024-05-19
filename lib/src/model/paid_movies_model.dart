// To parse this JSON data, do
//
//     final paidMoviesModel = paidMoviesModelFromJson(jsonString);

import 'dart:convert';

PaidMoviesModel paidMoviesModelFromJson(String str) => PaidMoviesModel.fromJson(json.decode(str));

String paidMoviesModelToJson(PaidMoviesModel data) => json.encode(data.toJson());

class PaidMoviesModel {
    List<VideoStreamingApp> videoStreamingApp;
    int statusCode;

    PaidMoviesModel({
        required this.videoStreamingApp,
        required this.statusCode,
    });

    factory PaidMoviesModel.fromJson(Map<String, dynamic> json) => PaidMoviesModel(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int movieId;
    String movieName;
    String movieImage;
    dynamic movieDuration;
    String movieAccess;
    String movieUrl;

    VideoStreamingApp({
        required this.movieId,
        required this.movieName,
        required this.movieImage,
        required this.movieDuration,
        required this.movieAccess,
        required this.movieUrl,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        movieId: json["movie_id"]??'',
        movieName: json["movie_name"]??"",
        movieImage: json["movie_image"]??"",
        movieDuration: json["movie_duration"]??"",
        movieAccess: json["movie_access"]??'',
        movieUrl: json["movie_url"]??'',
    );

    Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "movie_name": movieName,
        "movie_image": movieImage,
        "movie_duration": movieDuration,
        "movie_access": movieAccess,
        "movie_url": movieUrl,
    };
}
