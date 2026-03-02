import 'package:get/get.dart';
import 'package:template/view/home/home_controller.dart';
// import 'package:template/view/picker_image/controller/picker_image_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<PickerImageController>(
    //   () => PickerImageController(),
    //   fenix: true,
    // );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
  }
}
