 
import 'package:cliveott/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/add_watchlist_model.dart';
import '../service/add_watchlist_service.dart';
import 'login_controller.dart';

class AddWatchListController extends GetxController {
  RxBool addwatchlistload = true.obs;
  List<AddWatchlistModel> _addmywatchlist = [];
  List<AddWatchlistModel> get addwatchlist => _addmywatchlist;
  var addwatchlistservice = AddWatchListService();
  Future addwatchlistController({post_id, context}) async {
    if (addwatchlistload.value) {
      _loadingBar(context);
    }
    try {
      var response = await addwatchlistservice.addWatchlist(post_id: post_id);
      if (response != null) {
        _addmywatchlist.add(response);

        Fluttertoast.showToast(
            msg: _addmywatchlist[0].videoStreamingApp[0].msg.toString(),
            backgroundColor: clivecolor);

        addwatchlistload(false);
        Get.back();
      } else {
        addwatchlistload(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
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
