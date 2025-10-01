import 'package:get/get.dart';
import 'package:template/view/sign_up/sign_up_step_3/sign_up_step_3_controller.dart';

class SignUpStep3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpStep3Controller>(() => SignUpStep3Controller());
  }
}
