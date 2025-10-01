import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../data/model/notification/list_notification_response.dart';
import '../../data/model/notification/read_notification_request.dart';
import '../../data/provider/provider.dart';

class NotificationsController extends GetxController with GetTickerProviderStateMixin {
  final Provider provider = Provider();
  int page = 1;
  int perPage = 1000;
  int nextPage = 0;
  ListNotificationsResponse? listNotificationsResponse;
  List<NotificationDetail> mNotificationDetail = [];
  RefreshController refreshControllers = RefreshController();
  RefreshController refreshControllers1 = RefreshController();
  ReadNotificationRequest readNotificationRequest = ReadNotificationRequest();
  GlobalKey refresherKey = GlobalKey(debugLabel: "1");
  GlobalKey refresherKey1 = GlobalKey(debugLabel: "2");
  TabController? tabController;
  List tabBarName = [
    "Thông báo hệ thống",
    "Thông báo tin đăng",
  ];

  int tabBarIndex = 0;

  String? endPoint;
  @override
  void onInit() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
