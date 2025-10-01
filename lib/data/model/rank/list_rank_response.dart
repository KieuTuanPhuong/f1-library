import 'package:template/helper/rk_validate.dart';

class ItemRankPackage {
  String? id;
  int? day;
  int? discountPercent;
  int? isDelete;

  ItemRankPackage({
    this.id,
    this.day,
    this.discountPercent,
    this.isDelete,
  });

  factory ItemRankPackage.fromJson(Map<String, dynamic> json) => ItemRankPackage(
        id: RkValidate.parseStringFromJson(json["id"]),
        day: RkValidate.parseIntFromJson(json["day"]),
        discountPercent: RkValidate.parseIntFromJson(json["discount_percent"]),
        isDelete: RkValidate.parseIntFromJson(json["is_delete"]),
      );
}

class ItemRank {
  String? id;
  String? name;
  String? background;
  String? price;
  int? isDelete;
  String? rankOrder;
  String? backgroundColor;

  ItemRank({
    this.id,
    this.name,
    this.background,
    this.price,
    this.isDelete,
    this.rankOrder,
    this.backgroundColor,
  });

  factory ItemRank.fromJson(Map<String, dynamic> json) => ItemRank(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        background: RkValidate.parseStringFromJson(json["background"]),
        price: RkValidate.parseStringFromJson(json["price"]),
        isDelete: RkValidate.parseIntFromJson(json["is_delete"]),
        rankOrder: RkValidate.parseStringFromJson(json["rank_order"]),
        backgroundColor: RkValidate.parseStringFromJson(json["background_color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "background": background,
        "price": price,
        "is_delete": isDelete,
        "rank_order": rankOrder,
      };
}
