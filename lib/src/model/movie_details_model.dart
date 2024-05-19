// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) =>
    MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) =>
    json.encode(data.toJson());

class MovieDetailsModel {
  bool userPlanStatus;
  int statusCode;
  Data data;

  MovieDetailsModel({
    required this.userPlanStatus,
    required this.statusCode,
    required this.data,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        userPlanStatus: json["user_plan_status"],
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "user_plan_status": userPlanStatus,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int movieId;
  ContentRating contentRating;
  String movieTitle;
  String movieImage;
  MovieAccess movieAccess;
  String description;
  String movieDuration;
  String releaseDate;
  String imdbRating;
  String videoType;
  String videoUrl;
  String videoUrl480;
  String videoUrl720;
  String videoUrl1080;
  String downloadEnable;
  String downloadUrl;
  int langId;
  String languageName;
  List<GenreList> genreList;
  String subtitleLanguage1;
  String subtitleUrl1;
  String subtitleLanguage2;
  String subtitleUrl2;
  String subtitleLanguage3;
  String subtitleUrl3;
  String videoQuality;
  String subtitleOnOff;
  String moviesTrailerUrl;
  String shareUrl;
  String views;
  List<dynamic> actorList;
  List<dynamic> directorList;
  bool inWatchlist;
  String upcoming;
  List<RelatedMovie> relatedMovies;

  Data({
    required this.movieId,
    required this.contentRating,
    required this.movieTitle,
    required this.movieImage,
    required this.movieAccess,
    required this.description,
    required this.movieDuration,
    required this.releaseDate,
    required this.imdbRating,
    required this.videoType,
    required this.videoUrl,
    required this.videoUrl480,
    required this.videoUrl720,
    required this.videoUrl1080,
    required this.downloadEnable,
    required this.downloadUrl,
    required this.langId,
    required this.languageName,
    required this.genreList,
    required this.subtitleLanguage1,
    required this.subtitleUrl1,
    required this.subtitleLanguage2,
    required this.subtitleUrl2,
    required this.subtitleLanguage3,
    required this.subtitleUrl3,
    required this.videoQuality,
    required this.subtitleOnOff,
    required this.moviesTrailerUrl,
    required this.shareUrl,
    required this.views,
    required this.actorList,
    required this.directorList,
    required this.inWatchlist,
    required this.upcoming,
    required this.relatedMovies,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movieId: json["movie_id"],
        contentRating: contentRatingValues.map[json["content_rating"]]!,
        movieTitle: json["movie_title"],
        movieImage: json["movie_image"],
        movieAccess: movieAccessValues.map[json["movie_access"]]!,
        description: json["description"],
        movieDuration: json["movie_duration"] ?? "",
        releaseDate: json["release_date"],
        imdbRating: json["imdb_rating"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
        videoUrl480: json["video_url_480"],
        videoUrl720: json["video_url_720"],
        videoUrl1080: json["video_url_1080"],
        downloadEnable: json["download_enable"],
        downloadUrl: json["download_url"],
        langId: json["lang_id"],
        languageName: json["language_name"],
        genreList: List<GenreList>.from(
            json["genre_list"].map((x) => GenreList.fromJson(x))),
        subtitleLanguage1: json["subtitle_language1"],
        subtitleUrl1: json["subtitle_url1"],
        subtitleLanguage2: json["subtitle_language2"],
        subtitleUrl2: json["subtitle_url2"],
        subtitleLanguage3: json["subtitle_language3"],
        subtitleUrl3: json["subtitle_url3"],
        videoQuality: json["video_quality"],
        subtitleOnOff: json["subtitle_on_off"],
        moviesTrailerUrl: json["movies_trailer_url"],
        shareUrl: json["share_url"],
        views: json["views"],
        actorList: List<dynamic>.from(json["actor_list"].map((x) => x)),
        directorList: List<dynamic>.from(json["director_list"].map((x) => x)),
        inWatchlist: json["in_watchlist"],
        upcoming: json["upcoming"],
        relatedMovies: List<RelatedMovie>.from(
            json["related_movies"].map((x) => RelatedMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "content_rating": contentRatingValues.reverse[contentRating],
        "movie_title": movieTitle,
        "movie_image": movieImage,
        "movie_access": movieAccessValues.reverse[movieAccess],
        "description": description,
        "movie_duration": movieDuration,
        "release_date": releaseDate,
        "imdb_rating": imdbRating,
        "video_type": videoType,
        "video_url": videoUrl,
        "video_url_480": videoUrl480,
        "video_url_720": videoUrl720,
        "video_url_1080": videoUrl1080,
        "download_enable": downloadEnable,
        "download_url": downloadUrl,
        "lang_id": langId,
        "language_name": languageName,
        "genre_list": List<dynamic>.from(genreList.map((x) => x.toJson())),
        "subtitle_language1": subtitleLanguage1,
        "subtitle_url1": subtitleUrl1,
        "subtitle_language2": subtitleLanguage2,
        "subtitle_url2": subtitleUrl2,
        "subtitle_language3": subtitleLanguage3,
        "subtitle_url3": subtitleUrl3,
        "video_quality": videoQuality,
        "subtitle_on_off": subtitleOnOff,
        "movies_trailer_url": moviesTrailerUrl,
        "share_url": shareUrl,
        "views": views,
        "actor_list": List<dynamic>.from(actorList.map((x) => x)),
        "director_list": List<dynamic>.from(directorList.map((x) => x)),
        "in_watchlist": inWatchlist,
        "upcoming": upcoming,
        "related_movies":
            List<dynamic>.from(relatedMovies.map((x) => x.toJson())),
      };
}

enum ContentRating { EMPTY, THE_16 }

final contentRatingValues =
    EnumValues({"": ContentRating.EMPTY, "16+": ContentRating.THE_16});

class GenreList {
  String genreId;
  String genreName;

  GenreList({
    required this.genreId,
    required this.genreName,
  });

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreId: json["genre_id"],
        genreName: json["genre_name"],
      );

  Map<String, dynamic> toJson() => {
        "genre_id": genreId,
        "genre_name": genreName,
      };
}

enum MovieAccess { FREE, PAID }

final movieAccessValues =
    EnumValues({"Free": MovieAccess.FREE, "Paid": MovieAccess.PAID});

class RelatedMovie {
  int movieId;
  ContentRating contentRating;
  String movieTitle;
  String moviePoster;
  String? movieDuration;
  MovieAccess movieAccess;

  RelatedMovie({
    required this.movieId,
    required this.contentRating,
    required this.movieTitle,
    required this.moviePoster,
    this.movieDuration,
    required this.movieAccess,
  });

  factory RelatedMovie.fromJson(Map<String, dynamic> json) => RelatedMovie(
        movieId: json["movie_id"],
        contentRating: contentRatingValues.map[json["content_rating"]]!,
        movieTitle: json["movie_title"],
        moviePoster: json["movie_poster"],
        movieDuration: json["movie_duration"],
        movieAccess: movieAccessValues.map[json["movie_access"]]!,
      );

  Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "content_rating": contentRatingValues.reverse[contentRating],
        "movie_title": movieTitle,
        "movie_poster": moviePoster,
        "movie_duration": movieDuration,
        "movie_access": movieAccessValues.reverse[movieAccess],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
