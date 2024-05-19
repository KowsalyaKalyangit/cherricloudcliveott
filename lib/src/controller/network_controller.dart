import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
class NetworkController extends GetxController {
  var isOnline = true.obs; // Observable for online/offline status

  @override
  void onInit() {
    super.onInit();
    // Add a listener to check network connectivity when the app starts
    checkNetworkConnectivity();
  }

  void checkNetworkConnectivity() async {
    // You can use any network connectivity package like connectivity or dio for checking.
    // For example, using the connectivity package:
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isOnline.value = false;
    } else {
      isOnline.value = true;
    }
  }
}
