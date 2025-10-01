import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListCategoryCreatePostResponse {
  Pagination? pagination;
  List<ItemCategory>? result;

  ListCategoryCreatePostResponse({
    this.pagination,
    this.result,
  });

  factory ListCategoryCreatePostResponse.fromJson(Map<String, dynamic> json) => ListCategoryCreatePostResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemCategory>.from(json["result"]!.map((x) => ItemCategory.fromJson(x))),
      );
}

class ItemCategory {
  String? id;
  String? categoryName;
  String? image;
  String? parentId;
  String? icon;
  int? type;
  int? viewStatus;
  int? countRealEstate;

  ItemCategory({
    this.id,
    this.categoryName,
    this.image,
    this.parentId,
    this.icon,
    this.type,
    this.viewStatus,
    this.countRealEstate,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ItemCategory && other.id == id && other.categoryName == categoryName;
  }

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        id: RkValidate.parseStringFromJson(json["id"]),
        categoryName: RkValidate.parseStringFromJson(json["category_name"]),
        image: RkValidate.parseStringFromJson(json["image"]),
        parentId: RkValidate.parseStringFromJson(json["parent_id"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        type: RkValidate.parseIntFromJson(json["type"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        countRealEstate: RkValidate.parseIntFromJson(json["count_real_estate"]),
      );
}
