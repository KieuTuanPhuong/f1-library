import 'package:template/helper/rk_validate.dart';

class UploadFileResponse {
  List<ListResult>? listResult;

  UploadFileResponse({
    this.listResult,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => UploadFileResponse(
        listResult: json["list_result"] == null ? [] : List<ListResult>.from(json["list_result"]!.map((x) => ListResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_result": listResult == null ? [] : List<dynamic>.from(listResult!.map((x) => x.toJson())),
      };
}

class ListResult {
  String? path;
  String? pathTemp;
  int? is360;

  ListResult({
    this.path,
    this.pathTemp,
    this.is360,
  });

  factory ListResult.fromJson(Map<String, dynamic> json) => ListResult(
        path: RkValidate.parseStringFromJson(json["path"]),
        pathTemp: RkValidate.parseStringFromJson(json["path_tam"]),
        is360: RkValidate.parseIntFromJson(json["is_360"]),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "path_tam": pathTemp,
        "is_360": is360,
      };
}
