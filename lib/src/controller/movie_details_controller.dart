import 'dart:math';

import 'package:cliveott/src/model/home_model.dart';
import 'package:cliveott/src/model/movie_details_model.dart';
import 'package:cliveott/src/service/home_service.dart';
import 'package:cliveott/src/service/livetv_category_service.dart';
import 'package:cliveott/src/service/movie_details_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class MovieDetailsController extends GetxController {
  RxBool moviedetailsLoad = true.obs;

  var relatedmodel = <RelatedMovie>[].obs;
  List<MovieDetailsModel> _moviedetailsmodel = [];
  List<MovieDetailsModel> get moviedetails => _moviedetailsmodel;
  var moviedetailsservice = MovieDetailsService();

  movieDetailsController({user_id, movie_id}) async {
    try {
      var response = await moviedetailsservice.movieDetailsService(
          movie_id: movie_id, user_id: user_id);
      if (response != null) {
        _moviedetailsmodel.add(response);

        moviedetailsLoad(false);
        update(['related']);
      } else {
        moviedetailsLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  relatedmovieDetailsController({user_id, movie_id, context}) async {
    moviedetailsLoad(true);
    if (moviedetailsLoad.value) {
      _loadingBar(context);
    }
    try {
      var response = await moviedetailsservice.movieDetailsService(
          movie_id: movie_id, user_id: user_id);
      if (response != null) {
        _moviedetailsmodel.add(response);

        moviedetailsLoad(false);
      } else {
        moviedetailsLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
