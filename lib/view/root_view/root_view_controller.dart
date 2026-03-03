import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/data/provider/provider.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/images_path.dart';

import '../../di_container.dart';
import '../../helper/login_helper.dart';
import '../../helper/rk_alert.dart';
import '../../sharedpref/shared_preference_helper.dart';
import '../home/home_page.dart';

class RootViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Connectivity connectivity = Connectivity();

  final Provider provider = Provider();

  DateTime? currentBackPressTime;

  TextEditingController codeQR = TextEditingController();
  final FocusNode nodeQrCode = FocusNode();

  RxInt currentIndex = 0.obs;
  RxInt prevIndex = 2.obs;
  RxDouble widthPopup = (Get.width / 2).obs;
  RxDouble heightMenuPopup = 0.0.obs;

  bool? isLogin;

  Color appBarColor = Color(0xffffffff);

  @override
  void onInit() async {
    super.onInit();
    // isLogin = sl.get<SharedPreferenceHelper>().getLogin;
    // print("hhhhhhhhh $isLogin");
    onCheckLogin();
  }

  void onCheckLogin() async {
    isLogin = await sl.get<SharedPreferenceHelper>().getLogin;
    print("hhhhhhhhh $isLogin");
    update();
  }

  void onLogOut() {
    sl<SharedPreferenceHelper>().setLogin(status: false);

    isLogin = sl.get<SharedPreferenceHelper>().getLogin;
    update();
  }

  List<Map<String, dynamic>> pages = [
    {
      'label': "HOME",
      'icon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_home_svg,
          color: ColorResources.LIGHT_GRAY,
        ),
      ),
      'selectedIcon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_home_svg,
          color: ColorResources.SECONDARY_RED,
        ),
      ),
      'page': HomePage(),
      'badge': 0,
    },
    {
      'label': "STATS",
      'icon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_stats,
          color: ColorResources.LIGHT_GRAY,
        ),
      ),
      'selectedIcon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_stats,
          color: ColorResources.SECONDARY_RED,
        ),
      ),
      'page': Container(),
      'badge': 0,
    },
    {
      'label': "CALENDAR",
      'icon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_calendar,
          color: ColorResources.LIGHT_GRAY,
        ),
      ),
      'selectedIcon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_calendar,
          color: ColorResources.SECONDARY_RED,
        ),
      ),
      'page': Container(),
      'badge': 0,
    },
    {
      'label': "MORE",
      'icon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_more,
          color: ColorResources.LIGHT_GRAY,
        ),
      ),
      'selectedIcon': Container(
        alignment: Alignment.center,
        child: RkImage(
          ImagesPath.ic_more,
          color: ColorResources.SECONDARY_RED,
        ),
      ),
      'page': Container(),
      'badge': 0,
    },
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void onClose() {
    super.onClose();
  }

  // void onChangedPage(int index) {
  //   if (index == 4 && !LoginHelper.haveUser()) {
  //     LoginHelper.requestLogin(loginSuccess: () {
  //       currentIndex.value = index;
  //       prevIndex.value = 1;
  //       log("prevIndex.value ${prevIndex.value}");
  //     });
  //     log("prevIndex.value 1 ${prevIndex.value}");
  //   } else if (index == 3 && !LoginHelper.haveUser()) {
  //     LoginHelper.requestLogin(loginSuccess: () {
  //       currentIndex.value = index;
  //       prevIndex.value = currentIndex.value;
  //     });
  //   } else {
  //     currentIndex.value = index;
  //     update();
  //   }
  // }

  // void onLogOutSuccess() {
  //   onChangedPage(0);
  // }

  Future<bool> onDoubleBack() {
    EasyLoading.dismiss();
    final DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      RkAlert.info(message: "Bạn muốn thoát ứng dụng");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
