// To parse this JSON data, do
//
//     final forceupdateModel = forceupdateModelFromJson(jsonString);

import 'dart:convert';

ForceupdateModel forceupdateModelFromJson(String str) => ForceupdateModel.fromJson(json.decode(str));

String forceupdateModelToJson(ForceupdateModel data) => json.encode(data.toJson());

class ForceupdateModel {
    int success;
    String status;
    String message;
    String version;

    ForceupdateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.version,
    });

    factory ForceupdateModel.fromJson(Map<String, dynamic> json) => ForceupdateModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "version": version,
    };
}
