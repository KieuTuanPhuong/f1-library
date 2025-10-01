import 'package:get/get.dart';

import '../../view/notification/notification_detail/notification_detail_page.dart';
import '../../view/notification/notification_settings/notification_settings_binding.dart';
import '../../view/notification/notification_settings/notification_settings_page.dart';
import '../../view/notification/notifications_binding.dart';
import '../../view/notification/notifications_page.dart';

class NotificationsRoutes {
  static const String LIST_NOTIFICATION = '/list_notification';
  static const String NOTIFICATION_DETAIL = '/notification_detail';
  static const String NOTIFICATION_SETTINGS = '/notification_settings';

  static List<GetPage> list = [
    GetPage(
      name: LIST_NOTIFICATION,
      page: () => ListNotificationsPage(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: NOTIFICATION_DETAIL,
      page: () => NotificationsDetailPage(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: NOTIFICATION_SETTINGS,
      page: () => NotificationSettingsPage(),
      binding: NotificationSettingsBinding(),
    ),
  ];
}
