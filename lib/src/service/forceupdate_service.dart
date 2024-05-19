import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/force_update_model.dart';
 
 

class ForceUpdateService {
  Future<ForceupdateModel?> getData({validate}) async {
    var body = {"validate": validate ?? "",};
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://www.cherritech.us/version/version.php"),
        body: bodyencode,
        
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ForceupdateModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
