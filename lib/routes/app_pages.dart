import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/routes/route_path/auth_routes.dart';
import 'package:template/routes/route_path/home_routes.dart';
import 'package:template/routes/route_path/notifications_routes.dart';
import 'package:template/routes/route_path/profile_routes.dart';

import 'route_path/splash_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static List<GetPage> list = [
    ...RootViewRoutes.list,
    ...SplashRoutes.list,
    // ...AuthRoutes.list,
    ...ProfileRoutes.list,
    // ...NotificationsRoutes.list,
  ];
}
