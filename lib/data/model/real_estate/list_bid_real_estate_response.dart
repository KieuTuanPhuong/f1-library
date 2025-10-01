import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListBidRealEstateResponse {
  Pagination? pagination;
  List<ItemBidRealEstate>? itemBidRealEstate;

  ListBidRealEstateResponse({
    this.pagination,
    this.itemBidRealEstate,
  });

  factory ListBidRealEstateResponse.fromJson(Map<String, dynamic> json) => ListBidRealEstateResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        itemBidRealEstate: json["result"] == null ? [] : List<ItemBidRealEstate>.from(json["result"]!.map((x) => ItemBidRealEstate.fromJson(x))),
      );
}

class ItemBidRealEstate {
  int? totalElement;
  String? avatar;
  String? fullName;
  String? price;
  String? time;
  String? unitId;
  String? unitName;

  ItemBidRealEstate({
    this.totalElement,
    this.fullName,
    this.price,
    this.avatar,
    this.time,
    this.unitId,
    this.unitName,
  });

  factory ItemBidRealEstate.fromJson(Map<String, dynamic> json) => ItemBidRealEstate(
        totalElement: RkValidate.parseIntFromJson(json["total_element"]),
        fullName: RkValidate.parseStringFromJson(json["full_name"]),
        avatar: RkValidate.parseStringFromJson(json["avatar"]),
        price: RkValidate.parseStringFromJson(json["price"]),
        time: RkValidate.parseStringFromJson(json["time"]),
        unitId: RkValidate.parseStringFromJson(json["unit_id"]),
        unitName: RkValidate.parseStringFromJson(json["unit_name"]),
      );
}
