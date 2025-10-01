import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListNotificationsResponse {
  Pagination? pagination;
  int? countUnread;
  List<NotificationDetail>? notificationDetail;

  ListNotificationsResponse({
    this.pagination,
    this.notificationDetail,
    this.countUnread,
  });

  factory ListNotificationsResponse.fromJson(Map<String, dynamic> json) => ListNotificationsResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        countUnread: RkValidate.parseIntFromJson(json['count_unread']),
        notificationDetail: json["result"] == null ? [] : List<NotificationDetail>.from(json["result"]!.map((x) => NotificationDetail.fromJson(x))),
      );
}

class NotificationDetail {
  int? totalElement;
  int? countUnread;
  int? id;
  String? title;
  int? status;
  String? description;
  String? type;
  String? sourceType;
  int? sourceId;
  String? image;
  int? isDelete;
  String? createAt;
  String? pushAt;
  String? updateAt;
  int? memberId;
  int? notificationId;
  int? viewStatus;
  String? realEstateId;

  NotificationDetail(
      {this.totalElement,
      this.countUnread,
      this.id,
      this.title,
      this.status,
      this.description,
      this.type,
      this.sourceType,
      this.sourceId,
      this.image,
      this.isDelete,
      this.createAt,
      this.pushAt,
      this.updateAt,
      this.memberId,
      this.notificationId,
      this.viewStatus,
      this.realEstateId});

  factory NotificationDetail.fromJson(Map<String, dynamic> json) => NotificationDetail(
        id: RkValidate.parseIntFromJson(json["id"]),
        title: RkValidate.parseStringFromJson(json["title"]),
        pushAt: RkValidate.parseStringFromJson(json["push_at"]),
        status: RkValidate.parseIntFromJson(json["status"]),
        type: RkValidate.parseStringFromJson(json["type"]),
        sourceType: RkValidate.parseStringFromJson(json["source_type"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        image: RkValidate.parseStringFromJson(json["image"]),
        realEstateId: RkValidate.parseStringFromJson(json["real_estate_id"]),
      );
}
