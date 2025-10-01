import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class EventHistoryResponse {
  Pagination? pagination;
  List<ItemEventHistory>? result;

  EventHistoryResponse({
    this.pagination,
    this.result,
  });

  factory EventHistoryResponse.fromJson(Map<String, dynamic> json) => EventHistoryResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemEventHistory>.from(json["result"]!.map((x) => ItemEventHistory.fromJson(x))),
      );
}

class ItemEventHistory {
  String? id;
  String? eventName;
  String? eventIcon;
  int? rewardStatus;
  String? createAt;
  String? rewardName;
  int? rewardType;

  ItemEventHistory({
    this.id,
    this.eventName,
    this.eventIcon,
    this.rewardStatus,
    this.createAt,
    this.rewardName,
    this.rewardType,
  });

  factory ItemEventHistory.fromJson(Map<String, dynamic> json) => ItemEventHistory(
        id: !RkValidate.nullOrEmpty(json["id"]) ? RkValidate.parseStringFromJson(json["id"]) : null,
        eventName: !RkValidate.nullOrEmpty(json["event_name"]) ? RkValidate.parseStringFromJson(json["event_name"]) : null,
        eventIcon: !RkValidate.nullOrEmpty(json["event_icon"]) ? RkValidate.parseStringFromJson(json["event_icon"]) : null,
        rewardStatus: !RkValidate.nullOrEmpty(json["reward_status"]) ? RkValidate.parseIntFromJson(json["reward_status"]) : null,
        createAt: !RkValidate.nullOrEmpty(json["create_at"]) ? RkValidate.parseStringFromJson(json["create_at"]) : null,
        rewardName: !RkValidate.nullOrEmpty(json["reward_name"]) ? RkValidate.parseStringFromJson(json["reward_name"]) : null,
        rewardType: !RkValidate.nullOrEmpty(json["reward_type"]) ? RkValidate.parseIntFromJson(json["reward_type"]) : 0,
      );
}

class ConfirmRewardRequest {
  String? id;
  String? addressSend;
  String? phoneNumberSend;
  List<String>? image;

  ConfirmRewardRequest({
    this.id,
    this.addressSend,
    this.phoneNumberSend,
    this.image,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(id)) data['id'] = id;
    if (!RkValidate.nullOrEmpty(addressSend)) data['address_send'] = addressSend;
    if (!RkValidate.nullOrEmpty(phoneNumberSend)) data['phone_number_send'] = phoneNumberSend;
    if (!RkValidate.nullOrEmpty(image)) data['image'] = List<String>.from(image!.map((x) => x));

    return data;
  }
}
