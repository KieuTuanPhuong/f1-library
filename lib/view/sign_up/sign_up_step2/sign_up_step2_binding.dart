import 'package:get/get.dart';

import 'sign_up_step2_controller.dart';

class SignUpStep2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpStep2Controller>(() => SignUpStep2Controller());
  }
}
