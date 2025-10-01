import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListRealEstateForMemberResponse {
  Pagination? pagination;
  List<ItemRealEstateForMember>? itemRealEstateForMember;

  ListRealEstateForMemberResponse({
    this.pagination,
    this.itemRealEstateForMember,
  });

  factory ListRealEstateForMemberResponse.fromJson(Map<String, dynamic> json) => ListRealEstateForMemberResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        itemRealEstateForMember: json["result"] == null ? [] : List<ItemRealEstateForMember>.from(json["result"]!.map((x) => ItemRealEstateForMember.fromJson(x))),
      );
}

class ItemRealEstateForMember {
  int? totalElement;
  String? id;
  String? thumbnail;
  String? name;
  String? createAt;
  String? updateAt;
  int? newsStatus;
  int? viewStatus;

  ItemRealEstateForMember({
    this.totalElement,
    this.id,
    this.thumbnail,
    this.name,
    this.createAt,
    this.updateAt,
    this.newsStatus,
    this.viewStatus,
  });

  factory ItemRealEstateForMember.fromJson(Map<String, dynamic> json) => ItemRealEstateForMember(
        totalElement: RkValidate.parseIntFromJson(json["total_element"]),
        id: RkValidate.parseStringFromJson(json["id"]),
        thumbnail: RkValidate.parseStringFromJson(json["thumbnail"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
        updateAt: RkValidate.parseStringFromJson(json["update_at"]),
        newsStatus: RkValidate.parseIntFromJson(json["news_status"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
      );
}
