import 'package:template/helper/rk_validate.dart';

import '../paginate/paginate.dart';
import 'create_post_real_estate_request.dart';

class ListRealEstateResponse {
  Pagination? pagination;
  List<ItemRealEstate>? result;

  ListRealEstateResponse({
    this.pagination,
    this.result,
  });

  factory ListRealEstateResponse.fromJson(Map<String, dynamic> json) => ListRealEstateResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemRealEstate>.from(json["result"]!.map((x) => ItemRealEstate.fromJson(x))),
      );
}

class ItemRealEstate {
  String? id;
  String? video;
  String? unitName;
  String? realEstateName;
  int? type;
  String? categoryName;
  int? rank;
  String? startDate;
  double? acreage;
  String? provinceName;
  String? endDate;
  int? newsStatus;
  int? viewStatus;
  int? realEstateStatus;
  String? createAt;
  String? price;
  String? description;
  List<ImageRealEstateRequest>? image;
  List<DescribeHome>? describe;
  int? favorite;
  String? rankName;
  String? backgroundColor;
  String? background;
  String? address;
  int? bathroom;
  int? bedroom;

  ItemRealEstate({
    this.id,
    this.video,
    this.unitName,
    this.realEstateName,
    this.type,
    this.categoryName,
    this.rank,
    this.startDate,
    this.acreage,
    this.provinceName,
    this.endDate,
    this.newsStatus,
    this.viewStatus,
    this.realEstateStatus,
    this.createAt,
    this.price,
    this.description,
    this.image,
    this.describe,
    this.favorite,
    this.rankName,
    this.backgroundColor,
    this.background,
    this.address,
    this.bedroom,
    this.bathroom,
  });

  factory ItemRealEstate.fromJson(Map<String, dynamic> json) => ItemRealEstate(
        id: RkValidate.parseStringFromJson(json["id"]),
        video: RkValidate.parseStringFromJson(json["video"]),
        unitName: RkValidate.parseStringFromJson(json["unit_name"]),
        realEstateName: RkValidate.parseStringFromJson(json["real_estate_name"]),
        type: RkValidate.parseIntFromJson(json["type"]),
        categoryName: RkValidate.parseStringFromJson(json["category_name"]),
        rank: RkValidate.parseIntFromJson(json["rank"]),
        startDate: RkValidate.parseStringFromJson(json["start_date"]),
        acreage: RkValidate.parseDoubleFromJson(json["acreage"]),
        provinceName: RkValidate.parseStringFromJson(json["province_name"]),
        endDate: RkValidate.parseStringFromJson(json["end_date"]),
        newsStatus: RkValidate.parseIntFromJson(json["news_status"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        realEstateStatus: RkValidate.parseIntFromJson(json["real_estate_status"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
        price: RkValidate.parseStringFromJson(json["price"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        image: json["image"] == null ? [] : List<ImageRealEstateRequest>.from(json["image"]!.map((x) => ImageRealEstateRequest.fromJson(x))),
        describe: json["describe"] == null ? [] : List<DescribeHome>.from(json["describe"]!.map((x) => DescribeHome.fromJson(x))),
        favorite: RkValidate.parseIntFromJson(json["favorite"]),
        rankName: RkValidate.parseStringFromJson(json["rank_name"]),
        backgroundColor: RkValidate.parseStringFromJson(json["background_color"]),
        background: RkValidate.parseStringFromJson(json["background"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        bedroom: RkValidate.parseIntFromJson(json["bedroom"]),
        bathroom: RkValidate.parseIntFromJson(json["bathroom"]),
      );
}

class DescribeDetail {
  String? describeId;
  String? describeName;
  String? icon;
  int? infoType;
  String? valueId;
  String? value;
  String? describeUnit;
  String? description;

  DescribeDetail({
    this.describeId,
    this.describeName,
    this.icon,
    this.infoType,
    this.valueId,
    this.value,
    this.describeUnit,
    this.description,
  });

  factory DescribeDetail.fromJson(Map<String, dynamic> json) => DescribeDetail(
        describeId: RkValidate.parseStringFromJson(json["describe_id"]),
        describeName: RkValidate.parseStringFromJson(json["describe_name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        infoType: RkValidate.parseIntFromJson(json["info_type"]),
        valueId: RkValidate.parseStringFromJson(json["value_id"]),
        value: RkValidate.parseStringFromJson(json["value"]),
        describeUnit: RkValidate.parseStringFromJson(json["describe_unit"]),
        description: RkValidate.parseStringFromJson(json["description"]),
      );

  Map<String, dynamic> toJson() => {
        "describe_id": describeId,
        "describe_name": describeName,
        "icon": icon,
        "info_type": infoType,
        "value_id": valueId,
        "value": value,
        "describe_unit": describeUnit,
        "description": description,
      };
}

class DescribeHome {
  String? describeId;
  String? describeName;
  String? icon;
  int? infoType;
  String? value;

  DescribeHome({
    this.describeId,
    this.describeName,
    this.icon,
    this.infoType,
    this.value,
  });

  factory DescribeHome.fromJson(Map<String, dynamic> json) => DescribeHome(
        describeId: RkValidate.parseStringFromJson(json["describe_id"]),
        describeName: RkValidate.parseStringFromJson(json["describe_name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        infoType: RkValidate.parseIntFromJson(json["info_type"]),
        value: RkValidate.parseStringFromJson(json["value"]),
      );
}
