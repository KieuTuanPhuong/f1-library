import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // isLogin = sl.get<SharedPreferenceHelper>().getLogin;
    // print("hhhhhhhhh $isLogin");
    // onCheckLogin();
  }

  List menu = [
    {
      'title': 'Drivers',
      'description': 'Hello',
    },
    {
      'title': 'Teams',
      'description': 'Hello',
    },
    {
      'title': 'Seasons',
      'description': 'Hello',
    },
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void onClose() {
    super.onClose();
  }
}
