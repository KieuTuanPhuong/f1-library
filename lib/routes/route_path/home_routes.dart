import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/view/root_view/root_view_binding.dart';
import 'package:template/view/root_view/root_view_page.dart';

import '../../view/home/home_binding.dart';
import '../../view/home/home_page.dart';

// ignore: avoid_classes_with_only_static_members
class RootViewRoutes {
  static const String ROOT_VIEW = '/root_view';

  static const String HOME = '/home';

  static List<GetPage> list = [
    GetPage(
      name: ROOT_VIEW,
      page: () => RootViewPage(),
      binding: RootViewBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
