import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../base_widget/background/background.dart';
import '../../../base_widget/photo/rk_photo_view.dart';
import '../../../base_widget/rk_app_bar.dart';
import '../../../base_widget/rk_text.dart';
import '../../../base_widget/rk_screen.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import 'notification_detail_controller.dart';

class NotificationsDetailPage extends GetView<NotificationsDetailController> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      isSingleChildScrollView: true,
      background: BackgroundDefault(),
      appBar: RkAppBar(
        title: 'Chi tiết thông báo',
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
        init: NotificationsDetailController(),
        builder: (NotificationsDetailController controller) {
          return buildBody();
        },
      ),
    );
  }

  Widget buildBody() {
    return controller.notificationDetail != null
        ? Container(
            padding: EdgeInsets.all(RkDimensions.ONE_UNIT_FONT * 15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RkText(
                  controller.notificationDetail!.title,
                  maxLine: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                    color: ColorResources.COLOR_515151,
                    fontFamily: Roboto,
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 5,
                ),
                // Container(
                //   child: RkText(
                //     controller.notificationDetail!.description,
                //     style: TextStyle(
                //       fontWeight: FontWeight.w400,
                //       fontSize: RkDimensions.ONE_UNIT_FONT * 13,
                //       color: ColorResources.COLOR_515151,
                //       fontFamily: Roboto,
                //       height: 1.5,
                //     ),
                //     maxLine: 20,
                //   ),
                // ),
                // SingleChildScrollView(
                //   child:
                Container(
                  child: HtmlWidget(
                    controller.notificationDetail!.description!,
                    onTapImage: (ImageMetadata img) {
                      Get.to(RkPhotoView(
                        imageProvider: CachedNetworkImageProvider(img.sources.first.url),
                        photoDate: DateTime.now().toString(),
                      ));
                      // print("${img.sources.first.url}");
                    },
                    textStyle: TextStyle(
                      fontSize: RkDimensions.ONE_UNIT_FONT * 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: Roboto,
                      color: ColorResources.COLOR_515151,
                    ),
                  ),
                ),
                // ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 5,
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
