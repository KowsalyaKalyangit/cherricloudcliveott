// To parse this JSON data, do
//
//     final liveTvDetailsModel = liveTvDetailsModelFromJson(jsonString);

import 'dart:convert';

LiveTvDetailsModel liveTvDetailsModelFromJson(String str) => LiveTvDetailsModel.fromJson(json.decode(str));

String liveTvDetailsModelToJson(LiveTvDetailsModel data) => json.encode(data.toJson());

class LiveTvDetailsModel {
    VideoStreamingApp videoStreamingApp;
    bool userPlanStatus;
    int statusCode;

    LiveTvDetailsModel({
        required this.videoStreamingApp,
        required this.userPlanStatus,
        required this.statusCode,
    });

    factory LiveTvDetailsModel.fromJson(Map<String, dynamic> json) => LiveTvDetailsModel(
        videoStreamingApp: VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
        userPlanStatus: json["user_plan_status"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": videoStreamingApp.toJson(),
        "user_plan_status": userPlanStatus,
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    int tvId;
    String tvTitle;
    String tvLogo;
    String tvAccess;
    String description;
    String tvUrlType;
    String tvUrl;
    String tvUrl2;
    String tvUrl3;
    int tvCatId;
    String categoryName;
    String views;
    String shareUrl;
    bool inWatchlist;
    List<RelatedLiveTv> relatedLiveTv;

    VideoStreamingApp({
        required this.tvId,
        required this.tvTitle,
        required this.tvLogo,
        required this.tvAccess,
        required this.description,
        required this.tvUrlType,
        required this.tvUrl,
        required this.tvUrl2,
        required this.tvUrl3,
        required this.tvCatId,
        required this.categoryName,
        required this.views,
        required this.shareUrl,
        required this.inWatchlist,
        required this.relatedLiveTv,
    });

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        tvId: json["tv_id"],
        tvTitle: json["tv_title"],
        tvLogo: json["tv_logo"],
        tvAccess: json["tv_access"],
        description: json["description"],
        tvUrlType: json["tv_url_type"],
        tvUrl: json["tv_url"],
        tvUrl2: json["tv_url2"],
        tvUrl3: json["tv_url3"],
        tvCatId: json["tv_cat_id"],
        categoryName: json["category_name"],
        views: json["views"],
        shareUrl: json["share_url"],
        inWatchlist: json["in_watchlist"],
        relatedLiveTv: List<RelatedLiveTv>.from(json["related_live_tv"].map((x) => RelatedLiveTv.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tv_id": tvId,
        "tv_title": tvTitle,
        "tv_logo": tvLogo,
        "tv_access": tvAccess,
        "description": description,
        "tv_url_type": tvUrlType,
        "tv_url": tvUrl,
        "tv_url2": tvUrl2,
        "tv_url3": tvUrl3,
        "tv_cat_id": tvCatId,
        "category_name": categoryName,
        "views": views,
        "share_url": shareUrl,
        "in_watchlist": inWatchlist,
        "related_live_tv": List<dynamic>.from(relatedLiveTv.map((x) => x.toJson())),
    };
}

class RelatedLiveTv {
    int tvId;
    String tvTitle;
    String tvLogo;
    String tvAccess;

    RelatedLiveTv({
        required this.tvId,
        required this.tvTitle,
        required this.tvLogo,
        required this.tvAccess,
    });

    factory RelatedLiveTv.fromJson(Map<String, dynamic> json) => RelatedLiveTv(
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
