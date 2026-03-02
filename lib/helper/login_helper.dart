import 'package:get/get.dart';
import 'package:template/helper/rk_validate.dart';

import '../di_container.dart';
import '../routes/route_path/auth_routes.dart';
import '../sharedpref/shared_preference_helper.dart';

class LoginHelper {
  static bool haveUser() {
    final token = sl<SharedPreferenceHelper>().getJwtToken;
    if (!RkValidate.nullOrEmpty(token)) {
      return true;
    }
    return false;
  }

  // static void requestLogin({required Function() loginSuccess}) {
  //   Get.toNamed(AuthRoutes.LOGIN, arguments: {'requestLogin': true})?.then((value) {
  //     if (value != null && value == true) {
  //       loginSuccess();
  //     }
  //   });
  // }

  static bool haveApproveMember() {
    final approveStatus = sl<SharedPreferenceHelper>().getApproveMemberStatus;
    if (!RkValidate.nullOrEmpty(approveStatus) && approveStatus == "2") {
      return true;
    }
    return false;
  }
}
