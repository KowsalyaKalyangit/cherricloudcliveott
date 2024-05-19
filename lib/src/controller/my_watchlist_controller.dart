import 'package:cliveott/src/service/my_watchlist_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/my_watchlist_model.dart';
import 'login_controller.dart';

class MyWatchListController extends GetxController {
  RxBool mywatchlistload = true.obs;
  List<MyWatchlistModel> _mymywatchlist = [];
  List<MyWatchlistModel> get mywatchlist => _mymywatchlist;
  var mywatchlistservice = MyWatchListService();
  mywatchlistController({context}) async {
    mywatchlistload(true);
    if (mywatchlistload.value) {
      _loadingBar(context);
    }
    try {
      var response = await mywatchlistservice.myWatchlistService();
      if (response != null) {
        _mymywatchlist.clear();
        _mymywatchlist.add(response);

        mywatchlistload(false);
        Get.back();
      } else {
        mywatchlistload(false);

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
