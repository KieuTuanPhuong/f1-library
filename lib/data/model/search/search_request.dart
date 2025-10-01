import 'package:template/helper/rk_validate.dart';

class SearchRequest {
  String? name;
  String? type;
  List<String>? categoryId;
  List<String>? projectId;
  String? longtitude;
  String? latitude;
  String? range;
  String? provinceId;
  String? districtId;
  String? wardId;
  List<String>? direction;
  List<String>? bedroom;
  List<String>? media;
  List<String>? price;
  List<String>? acreage;
  int? page;
  int? perPage;

  SearchRequest({
    this.name,
    this.type,
    this.categoryId,
    this.projectId,
    this.longtitude,
    this.latitude,
    this.range,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.direction,
    this.bedroom,
    this.media,
    this.price,
    this.acreage,
    this.page,
    this.perPage,
  });

  Map<String, dynamic> toJson() => {
        "name": !RkValidate.nullOrEmpty(name) ? name : "",
        "type": !RkValidate.nullOrEmpty(type) ? type : "",
        "category_id": categoryId == null ? [] : List<String>.from(categoryId!.map((x) => x)),
        "project_id": projectId == null ? [] : List<String>.from(projectId!.map((x) => x)),
        "longtitude": !RkValidate.nullOrEmpty(longtitude) ? longtitude : "",
        "latitude": !RkValidate.nullOrEmpty(latitude) ? latitude : "",
        "range": !RkValidate.nullOrEmpty(range) ? range : "",
        "province_id": !RkValidate.nullOrEmpty(provinceId) ? provinceId : "",
        "district_id": !RkValidate.nullOrEmpty(districtId) ? districtId : "",
        "ward_id": !RkValidate.nullOrEmpty(wardId) ? wardId : "",
        "direction": direction == null ? [] : List<String>.from(direction!.map((x) => x)),
        "bedroom": bedroom == null ? [] : List<String>.from(bedroom!.map((x) => x)),
        "media": media == null ? [] : List<String>.from(media!.map((x) => x)),
        "price": price == null ? [] : List<String>.from(price!.map((x) => x)),
        "acreage": acreage == null ? [] : List<String>.from(acreage!.map((x) => x)),
        "page": !RkValidate.nullOrEmpty(page) ? page : 1,
        "per_page": !RkValidate.nullOrEmpty(perPage) ? perPage : 20,
      };
}
