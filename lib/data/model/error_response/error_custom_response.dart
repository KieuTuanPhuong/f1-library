import 'dart:convert';

import 'package:template/helper/rk_validate.dart';

class ErrorDemo {
  List<ErrorCustomResponse>? data;

  ErrorDemo({this.data});

  factory ErrorDemo.fromJson(Map<String, dynamic> json) => ErrorDemo(
        data: json["data"] == null ? [] : List<ErrorCustomResponse>.from(json["data"]!.map((x) => ErrorCustomResponse.fromJson(x))),
      );
}

class ErrorCustomResponse {
  int? logoutStatus;
  String? error;
  String? message;

  ErrorCustomResponse({
    this.logoutStatus,
    this.error,
    this.message,
  });

  // Map<String, dynamic> convertDynamicToMap(dynamic data) {
  //   Map<String, dynamic> convertedMap = json.decode(data);
  //   return convertedMap;
  // }

  factory ErrorCustomResponse.fromJson(Map<String, dynamic> json) => ErrorCustomResponse(
        logoutStatus: RkValidate.parseIntFromJson(json["logout_status"]),
        error: RkValidate.parseStringFromJson(json["error"]),
        message: RkValidate.parseStringFromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "logout_status": logoutStatus,
        "error": error,
      };
}
