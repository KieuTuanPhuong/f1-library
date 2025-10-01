import 'package:get/get.dart';

import '../../view/splash/splash_binding.dart';
import '../../view/splash/splash_view_page.dart';

// ignore: avoid_classes_with_only_static_members
class SplashRoutes {
  static const String SPLASH = '/';

  static List<GetPage> list = [
    GetPage(
      name: SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
