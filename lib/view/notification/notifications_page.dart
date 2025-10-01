import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_widget/background/background.dart';
import '../../base_widget/rk_app_bar.dart';
import '../../base_widget/rk_screen.dart';
import '../../helper/rk_dimensions.dart';
import '../../utils/color_resources.dart';
import '../../utils/fonts.dart';
import 'notifications_controller.dart';

class ListNotificationsPage extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      isSingleChildScrollView: false,
      background: BackgroundDefault(),
      appBar: RkAppBar(
        title: 'Thông báo',
        isShowBack: true,
        actions: [
          SizedBox(),
        ],
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: RkDimensions.ONE_UNIT_FONT * 20,
          color: ColorResources.COLOR_686868,
          fontFamily: Roboto,
        ),
        colorBG: ColorResources.WHITE,
        colorTitle: ColorResources.COLOR_686868,
      ),
      body: GetBuilder(
        init: NotificationsController(),
        builder: (NotificationsController controller) {
          return buildBody();
        },
      ),
    );
  }

  Widget buildBody() {
    return Container();
  }
}
