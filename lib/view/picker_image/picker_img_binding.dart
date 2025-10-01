import 'package:get/get.dart';

import 'controller/picker_image_controller.dart';

class PickerImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickerImageController>(
      () => PickerImageController(),
      fenix: true,
    );
  }
}
