import 'package:template/helper/rk_validate.dart';

import '../real_estate/create_post_real_estate_request.dart';

class DetailProjectResponse {
  String? name;
  String? address;
  int? provinceId;
  int? districtId;
  String? provinceName;
  String? districtName;
  String? wardName;
  String? projectStatus;
  String? owner;
  String? description;
  String? design;
  double? longtitude;
  double? latitude;
  String? video;
  String? videoThumbnail;
  String? icon;
  String? projectCategory;
  double? acreage;
  String? unit;
  List<ImageRealEstateRequest>? image;
  List<ProjectDescribe>? projectDescribe;
  List<Utility>? utilities;
  String? hotline;

  DetailProjectResponse({
    this.name,
    this.address,
    this.provinceId,
    this.districtId,
    this.provinceName,
    this.districtName,
    this.wardName,
    this.projectStatus,
    this.owner,
    this.description,
    this.design,
    this.longtitude,
    this.latitude,
    this.video,
    this.videoThumbnail,
    this.icon,
    this.projectCategory,
    this.acreage,
    this.unit,
    this.image,
    this.projectDescribe,
    this.utilities,
    this.hotline,
  });

  factory DetailProjectResponse.fromJson(Map<String, dynamic> json) => DetailProjectResponse(
        name: RkValidate.parseStringFromJson(json["name"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        provinceId: RkValidate.parseIntFromJson(json["province_id"]),
        districtId: RkValidate.parseIntFromJson(json["district_id"]),
        provinceName: RkValidate.parseStringFromJson(json["province_name"]),
        districtName: RkValidate.parseStringFromJson(json["district_name"]),
        wardName: RkValidate.parseStringFromJson(json["ward_name"]),
        projectStatus: RkValidate.parseStringFromJson(json["project_status"]),
        owner: RkValidate.parseStringFromJson(json["owner"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        design: RkValidate.parseStringFromJson(json["design"]),
        longtitude: RkValidate.parseDoubleFromJson(json["longtitude"]),
        latitude: RkValidate.parseDoubleFromJson(json["latitude"]),
        video: RkValidate.parseStringFromJson(json["video"]),
        videoThumbnail: RkValidate.parseStringFromJson(json["video_thumbnail"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        projectCategory: RkValidate.parseStringFromJson(json["project_category"]),
        acreage: RkValidate.parseDoubleFromJson(json["acreage"]),
        unit: RkValidate.parseStringFromJson(json["unit"]),
        image: json["image"] == null ? [] : List<ImageRealEstateRequest>.from(json["image"]!.map((x) => ImageRealEstateRequest.fromJson(x))),
        projectDescribe: json["project_describe"] == null ? [] : List<ProjectDescribe>.from(json["project_describe"]!.map((x) => ProjectDescribe.fromJson(x))),
        utilities: json["utilities"] == null ? [] : List<Utility>.from(json["utilities"]!.map((x) => Utility.fromJson(x))),
        hotline: RkValidate.parseStringFromJson(json["hotline"]),
      );
}

class ProjectDescribe {
  String? projectDescribeId;
  String? name;
  String? icon;
  String? value;

  ProjectDescribe({
    this.projectDescribeId,
    this.name,
    this.icon,
    this.value,
  });

  factory ProjectDescribe.fromJson(Map<String, dynamic> json) => ProjectDescribe(
        projectDescribeId: RkValidate.parseStringFromJson(json["project_describe_id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        value: RkValidate.parseStringFromJson(json["value"]),
      );
}

class Utility {
  String? id;
  String? name;
  String? icon;

  Utility({
    this.id,
    this.name,
    this.icon,
  });

  factory Utility.fromJson(Map<String, dynamic> json) => Utility(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
      );
}
