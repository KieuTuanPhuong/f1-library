import 'package:template/helper/rk_validate.dart';

import '../category/category_detail_response.dart';

class CreatePostRealEstateRequest {
  String? type;
  String? categoryId;
  String? address;
  String? wardId;
  String? districtId;
  String? provinceId;
  String? wardName;
  String? districtName;
  String? provinceName;
  String? projectId;
  double? longtitude;
  double? latitude;
  String? video;
  String? name;
  String? description;
  String? rank;
  String? fee;
  double? acreage;
  String? unitId;
  String? price;
  String? publishStatus;
  String? design;
  List<ImageRealEstateRequest>? image;
  List<String>? designFile;
  JuridicalFile? juridicalFile;
  List<DescribeRequest>? describe;
  String? id;
  double? wardLongtitude;
  double? wardLatitude;
  String? commission;

  CreatePostRealEstateRequest({
    this.type,
    this.categoryId,
    this.address,
    this.wardId,
    this.districtId,
    this.provinceId,
    this.wardName,
    this.districtName,
    this.provinceName,
    this.projectId,
    this.longtitude,
    this.latitude,
    this.video,
    this.name,
    this.description,
    this.rank,
    this.fee,
    this.acreage,
    this.unitId,
    this.price,
    this.publishStatus,
    this.design,
    this.image,
    this.designFile,
    this.juridicalFile,
    this.describe,
    this.id,
    this.wardLatitude,
    this.wardLongtitude,
    this.commission,
  });
  factory CreatePostRealEstateRequest.fromJson(Map<String, dynamic> json) => CreatePostRealEstateRequest(
        type: json["type"],
        categoryId: json["category_id"],
        address: json["address"],
        wardId: json["ward_id"],
        districtId: json["district_id"],
        provinceId: json["province_id"],
        wardName: json["ward_name"],
        districtName: json["district_name"],
        provinceName: json["province_name"],
        projectId: json["project_id"],
        longtitude: json["longtitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        video: json["video"],
        name: json["name"],
        description: json["description"],
        rank: json["rank"],
        fee: json["fee"],
        acreage: json["acreage"]?.toDouble(),
        unitId: json["unit_id"],
        price: json["price"],
        publishStatus: json["publish_status"],
        design: json["design"],
        image: json["image"] == null ? [] : List<ImageRealEstateRequest>.from(json["image"]!.map((x) => ImageRealEstateRequest.fromJson(x))),
        designFile: json["design_file"] == null ? [] : List<String>.from(json["design_file"]!.map((x) => x)),
        juridicalFile: json["juridical_file"] == null ? null : JuridicalFile.fromJson(json["juridical_file"]),
        describe: json["describe"] == null ? [] : List<DescribeRequest>.from(json["describe"]!.map((x) => Describe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": RkValidate.parseStringFromJson(type),
        "category_id": RkValidate.parseStringFromJson(categoryId),
        "address": RkValidate.parseStringFromJson(address),
        "ward_id": RkValidate.parseStringFromJson(wardId),
        "district_id": RkValidate.parseStringFromJson(districtId),
        "province_id": RkValidate.parseStringFromJson(provinceId),
        "ward_name": RkValidate.parseStringFromJson(wardName),
        "district_name": RkValidate.parseStringFromJson(districtName),
        "province_name": RkValidate.parseStringFromJson(provinceName),
        "project_id": RkValidate.parseStringFromJson(projectId),
        "longtitude": !RkValidate.nullOrEmpty(longtitude) ? RkValidate.parseDoubleFromJson(longtitude) : null,
        "latitude": !RkValidate.nullOrEmpty(latitude) ? RkValidate.parseDoubleFromJson(latitude) : null,
        "video": RkValidate.parseStringFromJson(video),
        "name": RkValidate.parseStringFromJson(name),
        "description": RkValidate.parseStringFromJson(description),
        "rank": RkValidate.parseStringFromJson(rank),
        "fee": RkValidate.parseStringFromJson(fee),
        "acreage": RkValidate.parseDoubleFromJson(acreage),
        "unit_id": RkValidate.parseStringFromJson(unitId),
        "price": RkValidate.parseStringFromJson(price),
        "publish_status": RkValidate.parseStringFromJson(publishStatus),
        "design": RkValidate.parseStringFromJson(design),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "design_file": designFile == null ? [] : List<dynamic>.from(designFile!.map((x) => x)),
        "juridical_file": juridicalFile?.toJson(),
        "describe": describe == null ? [] : List<dynamic>.from(describe!.map((x) => x.toJson())),
        'id': id == null ? [] : id,
        "ward_longtitude": !RkValidate.nullOrEmpty(wardLongtitude) ? RkValidate.parseDoubleFromJson(wardLongtitude) : null,
        "ward_latitude": !RkValidate.nullOrEmpty(wardLatitude) ? RkValidate.parseDoubleFromJson(wardLatitude) : null,
        'commission': RkValidate.nullOrEmpty(commission) ? "" : commission,
      };
}

class DescribeRequest {
  String? describeId;
  String? value;
  String? description;

  DescribeRequest({
    this.describeId,
    this.value,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "describe_id": RkValidate.parseIntFromJson(describeId),
        "value": RkValidate.parseStringFromJson(value),
        "description": RkValidate.parseStringFromJson(description),
      };
}

class ImageRealEstateRequest {
  String? path;
  int? is360;

  ImageRealEstateRequest({
    this.path,
    this.is360,
  });
  factory ImageRealEstateRequest.fromJson(Map<String, dynamic> json) => ImageRealEstateRequest(
        is360: RkValidate.parseIntFromJson(json["is_360"]),
        path: RkValidate.parseStringFromJson(json["path"]),
      );

  Map<String, dynamic> toJson() => {
        "path": RkValidate.parseStringFromJson(path),
        "is_360": is360,
      };
}

class JuridicalFile {
  String? juridicalId;
  List<String>? path;

  JuridicalFile({
    this.juridicalId,
    this.path,
  });
  factory JuridicalFile.fromJson(Map<String, dynamic> json) => JuridicalFile(
        juridicalId: json["juridical_id"],
        path: json["path"] == null ? [] : List<String>.from(json["path"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "juridical_id": RkValidate.parseStringFromJson(juridicalId),
        "path": path == null ? [] : List<String>.from(path!.map((x) => x)),
      };
}

class UpdatePostRealEstateRequest {
  String? id;
  String? type;
  String? categoryId;
  String? address;
  String? wardId;
  String? districtId;
  String? provinceId;
  String? wardName;
  String? districtName;
  String? provinceName;
  String? projectId;
  double? longtitude;
  double? latitude;
  String? video;
  String? name;
  String? description;
  String? rank;
  String? fee;
  double? acreage;
  String? unitId;
  String? price;
  String? publishStatus;
  String? design;
  List<ImageRealEstateRequest>? image;
  List<String>? designFile;
  JuridicalFile? juridicalFile;
  List<DescribeRequest>? describe;
  double? wardLongtitude;
  double? wardLatitude;
  String? commission;
  UpdatePostRealEstateRequest({
    this.type,
    this.categoryId,
    this.address,
    this.wardId,
    this.districtId,
    this.provinceId,
    this.wardName,
    this.districtName,
    this.provinceName,
    this.projectId,
    this.longtitude,
    this.latitude,
    this.video,
    this.name,
    this.description,
    this.rank,
    this.fee,
    this.acreage,
    this.unitId,
    this.price,
    this.publishStatus,
    this.design,
    this.image,
    this.designFile,
    this.juridicalFile,
    this.describe,
    this.id,
    this.wardLongtitude,
    this.wardLatitude,
    this.commission,
  });
  factory UpdatePostRealEstateRequest.fromJson(Map<String, dynamic> json) => UpdatePostRealEstateRequest(
        type: json["type"],
        categoryId: json["category_id"],
        address: json["address"],
        wardId: json["ward_id"],
        districtId: json["district_id"],
        provinceId: json["province_id"],
        wardName: json["ward_name"],
        districtName: json["district_name"],
        provinceName: json["province_name"],
        projectId: json["project_id"],
        longtitude: !RkValidate.nullOrEmpty(json["longtitude"]) ? RkValidate.parseDoubleFromJson(json["longtitude"]) : null,
        latitude: !RkValidate.nullOrEmpty(json["latitude"]) ? RkValidate.parseDoubleFromJson(json["latitude"]) : null,
        video: json["video"],
        name: json["name"],
        description: json["description"],
        rank: json["rank"],
        fee: json["fee"],
        acreage: json["acreage"]?.toDouble(),
        unitId: json["unit_id"],
        price: json["price"],
        publishStatus: json["publish_status"],
        design: json["design"],
        image: json["image"] == null ? [] : List<ImageRealEstateRequest>.from(json["image"]!.map((x) => ImageRealEstateRequest.fromJson(x))),
        designFile: json["design_file"] == null ? [] : List<String>.from(json["design_file"]!.map((x) => x)),
        juridicalFile: json["juridical_file"] == null ? null : JuridicalFile.fromJson(json["juridical_file"]),
        describe: json["describe"] == null ? [] : List<DescribeRequest>.from(json["describe"]!.map((x) => Describe.fromJson(x))),
        wardLongtitude: !RkValidate.nullOrEmpty(json["ward_longtitude"]) ? RkValidate.parseDoubleFromJson(json["ward_longtitude"]) : null,
        wardLatitude: !RkValidate.nullOrEmpty(json["ward_latitude"]) ? RkValidate.parseDoubleFromJson(json["ward_latitude"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": RkValidate.parseStringFromJson(id),
        "type": RkValidate.parseStringFromJson(type),
        "category_id": RkValidate.parseStringFromJson(categoryId),
        "address": RkValidate.parseStringFromJson(address),
        "ward_id": RkValidate.parseStringFromJson(wardId),
        "district_id": RkValidate.parseStringFromJson(districtId),
        "province_id": RkValidate.parseStringFromJson(provinceId),
        "ward_name": RkValidate.parseStringFromJson(wardName),
        "district_name": RkValidate.parseStringFromJson(districtName),
        "province_name": RkValidate.parseStringFromJson(provinceName),
        "project_id": RkValidate.parseStringFromJson(projectId),
        "longtitude": !RkValidate.nullOrEmpty(longtitude) ? RkValidate.parseDoubleFromJson(longtitude) : null,
        "latitude": !RkValidate.nullOrEmpty(latitude) ? RkValidate.parseDoubleFromJson(latitude) : null,
        "video": RkValidate.parseStringFromJson(video),
        "name": RkValidate.parseStringFromJson(name),
        "description": RkValidate.parseStringFromJson(description),
        "rank": RkValidate.parseStringFromJson(rank),
        "fee": RkValidate.parseStringFromJson(fee),
        "acreage": RkValidate.parseDoubleFromJson(acreage),
        "unit_id": RkValidate.parseStringFromJson(unitId),
        "price": RkValidate.parseStringFromJson(price),
        "publish_status": RkValidate.parseStringFromJson(publishStatus),
        "design": RkValidate.parseStringFromJson(design),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "design_file": designFile == null ? [] : List<dynamic>.from(designFile!.map((x) => x)),
        "juridical_file": juridicalFile?.toJson(),
        "describe": describe == null ? [] : List<dynamic>.from(describe!.map((x) => x.toJson())),
        "ward_longtitude": !RkValidate.nullOrEmpty(wardLongtitude) ? RkValidate.parseDoubleFromJson(wardLongtitude) : null,
        "ward_latitude": !RkValidate.nullOrEmpty(wardLatitude) ? RkValidate.parseDoubleFromJson(wardLatitude) : null,
        'commission': RkValidate.nullOrEmpty(commission) ? "" : commission,
      };
}
