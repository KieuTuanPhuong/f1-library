import '../../../helper/rk_validate.dart';

class ReadNotificationRequest {
  int? notificationId;

  ReadNotificationRequest({
    this.notificationId,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(notificationId)) data['id'] = notificationId;

    return data;
  }
}
