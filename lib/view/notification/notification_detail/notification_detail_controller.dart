import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:template/data/model/notification/read_notification_request.dart';

import '../../../data/api_endpoint/api_endpoint.dart';
import '../../../data/model/error_response/error_custom_response.dart';
import '../../../data/model/notification/list_notification_response.dart';
import '../../../data/provider/provider.dart';
import '../../../helper/rk_alert.dart';
import '../../../helper/rk_validate.dart';

class NotificationsDetailController extends GetxController {
  final Provider provider = Provider();
  int? notificationId;
  NotificationDetail? notificationDetail;

  ReadNotificationRequest readNotificationRequest = ReadNotificationRequest();
  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments["id"] != null) {
        notificationId = Get.arguments["id"] as int;
        onGetDetailNotification();
        // onReadNotification();
      }
    }
    super.onInit();
  }

  void goToDetailNotification(int type) {
    if (type == 1) {
      // Get.toNamed(NewsRoutes.NEWS_DETAIL, arguments: {
      //   "news_id": notificationDetail!.newsId,
      // });
    } else if (type == 3) {
      // Get.toNamed(ProfileRoutes.AUCTION_PROPERTY_PROFILE, arguments: {
      //   "status": notificationDetail!.assetStatus,
      //   "propertyId": notificationDetail!.assetId,
      //   "auction_id": notificationDetail!.auctionId,
      //   "is_client": notificationDetail!.isClient,
      //   "publicStatus": notificationDetail!.publicStatus,
      //   "approveStatus": notificationDetail!.approveStatus,
      //   "reviewStatus": notificationDetail!.reviewStatus,
      // });
    } else if (type == 4 || type == 5 || type == 6 || type == 13) {
      // Get.toNamed(
      //   ProfileRoutes.DETAIL_AUCTION_PROFILE,
      //   arguments: {
      //     "auction_id": notificationDetail!.auctionId,
      //   },
      // );
    }
  }

  void onGetDetailNotification() {
    EasyLoading.show(status: "loading".tr);
    provider.get(
      endPoint: APIEndPoint.getNotificationDetail(notification_id: notificationId!),
      onSuccess: (data) {
        if (!RkValidate.nullOrEmpty(data)) {
          notificationDetail = NotificationDetail.fromJson(data as Map<String, dynamic>);
        }

        EasyLoading.dismiss();
        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        try {
          Map<String, dynamic> convertDynamicToMap(dynamic data) {
            Map<String, dynamic> convertedMap = json.decode(data);
            return convertedMap;
          }

          Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
          final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);

          RkAlert.error(message: errorCustomResponse.error!);
        } catch (e) {
          if (!Get.isSnackbarOpen) {
            RkAlert.error(message: 'Lỗi hệ thống');
          }
        }
        // RkAlert.error(message: 'api_error'.tr);
      },
    );
  }

  void onReadNotification() {
    readNotificationRequest = ReadNotificationRequest(
      notificationId: notificationId,
    );
    provider.put(
      endPoint: APIEndPoint.viewNotification,
      data: readNotificationRequest.toJson(),
      onSuccess: (data) {
        // EasyLoading.dismiss();
        update();
      },
      onError: (onError) {
        // EasyLoading.dismiss();
        try {
          Map<String, dynamic> convertDynamicToMap(dynamic data) {
            Map<String, dynamic> convertedMap = json.decode(data);
            return convertedMap;
          }

          Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
          final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);

          RkAlert.error(message: errorCustomResponse.error!);
        } catch (e) {
          if (!Get.isSnackbarOpen) {
            RkAlert.error(message: 'Lỗi hệ thống');
          }
        }
        // RkAlert.error(message: 'api_error'.tr);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
