import 'package:get/get.dart';

import 'notification_detail_controller.dart';

class NotificationsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsDetailController>(() => NotificationsDetailController());
  }
}
