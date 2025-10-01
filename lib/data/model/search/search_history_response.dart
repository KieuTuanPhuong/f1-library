import 'package:template/helper/rk_validate.dart';

class SearchHistoryResponse {
  List<ItemSearchHistory>? sh;

  SearchHistoryResponse({
    this.sh,
  });

  factory SearchHistoryResponse.fromJson(Map<String, dynamic> json) => SearchHistoryResponse(
        sh: json["sh"] == null ? [] : List<ItemSearchHistory>.from(json["sh"]!.map((x) => ItemSearchHistory.fromJson(x))),
      );
}

class ItemSearchHistory {
  String? id;
  String? name;
  String? memberId;

  ItemSearchHistory({
    this.id,
    this.name,
    this.memberId,
  });

  factory ItemSearchHistory.fromJson(Map<String, dynamic> json) => ItemSearchHistory(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        memberId: RkValidate.parseStringFromJson(json["member_id"]),
      );
}
