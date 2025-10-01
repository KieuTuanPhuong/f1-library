import 'package:get/get.dart';

import 'root_view_controller.dart';

class RootViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RootViewController>(() => RootViewController());
  }
}