import 'package:template/helper/rk_validate.dart';

import '../paginate/paginate.dart';

class ListProjectResponse {
  Pagination? pagination;
  List<ItemProject>? result;

  ListProjectResponse({
    this.pagination,
    this.result,
  });

  factory ListProjectResponse.fromJson(Map<String, dynamic> json) => ListProjectResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemProject>.from(json["result"]!.map((x) => ItemProject.fromJson(x))),
      );
}

class ItemProject {
  int? totalElement;
  String? projectId;
  String? thumbnail;
  String? name;
  String? code;
  String? owner;
  String? provinceName;
  String? districtName;
  double? acreage;
  String? unit;
  String? projectStatus;
  double? longtitude;
  double? latitude;

  ItemProject({
    this.totalElement,
    this.projectId,
    this.thumbnail,
    this.name,
    this.code,
    this.owner,
    this.provinceName,
    this.districtName,
    this.acreage,
    this.unit,
    this.projectStatus,
    this.latitude,
    this.longtitude,
  });
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ItemProject && other.name == name && other.projectId == projectId;
  }

  factory ItemProject.fromJson(Map<String, dynamic> json) => ItemProject(
        totalElement: RkValidate.parseIntFromJson(json["total_element"]),
        projectId: RkValidate.parseStringFromJson(json["project_id"]),
        thumbnail: RkValidate.parseStringFromJson(json["thumbnail"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        code: RkValidate.parseStringFromJson(json["code"]),
        owner: RkValidate.parseStringFromJson(json["owner"]),
        provinceName: RkValidate.parseStringFromJson(json["province_name"]),
        districtName: RkValidate.parseStringFromJson(json["district_name"]),
        acreage: RkValidate.parseDoubleFromJson(json["acreage"]),
        unit: RkValidate.parseStringFromJson(json["unit"]),
        projectStatus: RkValidate.parseStringFromJson(json["project_status"]),
        longtitude: RkValidate.parseDoubleFromJson(json["longtitude"]),
        latitude: RkValidate.parseDoubleFromJson(json["latitude"]),
      );
}
