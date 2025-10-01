import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_text.dart';

import '../../../base_widget/background/background.dart';
import '../../../base_widget/rk_app_bar.dart';
import '../../../base_widget/rk_button.dart';
import '../../../base_widget/rk_screen.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import 'notification_settings_controller.dart';

class NotificationSettingsPage extends GetView<NotificationSettingsController> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      widgetBottomSheet: Container(
        height: RkDimensions.screenSize.height * 0.11,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 15),
                child: RkButton(
                  onTap: () {
                    Get.back();
                  },
                  label: "Hủy bỏ",
                  labelStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.w600,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                    color: ColorResources.COLOR_F13A3A,
                  ),
                  type: RkButtonType.OUTLINE,
                  padding: EdgeInsets.zero,
                  colorBorder: ColorResources.COLOR_F13A3A,
                  colorBG: ColorResources.WHITE,
                  withBorder: 1,
                  colorDisible: ColorResources.GREY,
                  borderRadius: RkDimensions.ONE_UNIT_FONT * 40,
                  // width: RkDimensions.screenSize.width * 0.9,
                  height: RkDimensions.ONE_UNIT_FONT * 55,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: RkDimensions.ONE_UNIT_FONT * 15),
                child: RkButton(
                  onTap: () {},
                  label: "Lưu chỉnh sửa",
                  labelStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.w600,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                    color: ColorResources.WHITE,
                  ),
                  padding: EdgeInsets.zero,
                  colorBG: ColorResources.COLOR_F13A3A,
                  colorDisible: ColorResources.GREY,
                  borderRadius: RkDimensions.ONE_UNIT_FONT * 40,
                  // width: RkDimensions.screenSize.width * 0.9,
                  height: RkDimensions.ONE_UNIT_FONT * 55,
                ),
              ),
            ),
          ],
        ),
      ),
      isSingleChildScrollView: true,
      background: BackgroundDefault(),
      appBar: RkAppBar(
        title: 'Quản lý nhận thông báo',
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
        init: NotificationSettingsController(),
        builder: (NotificationSettingsController controller) {
          return buildBody();
        },
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: RkDimensions.ONE_UNIT_FONT * 16,
        vertical: RkDimensions.ONE_UNIT_FONT * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RkText(
            "Quản lý nhận thông báo",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: RkDimensions.ONE_UNIT_FONT * 20,
              color: ColorResources.COLOR_515151,
              fontFamily: Roboto,
            ),
          ),
          SizedBox(
            height: RkDimensions.ONE_UNIT_FONT * 15,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RkText(
                  "1. Thông báo bạn muốn nhận",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 16,
                    color: ColorResources.COLOR_515151,
                    fontFamily: Roboto,
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 15,
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  checkColor: ColorResources.WHITE,
                  side: BorderSide(
                    color: ColorResources.COLOR_B4B4B4,
                  ),
                  activeColor: ColorResources.COLOR_F13A3A,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 10),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  title: RkText(
                    "Tất cả",
                    maxLine: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_515151,
                      fontFamily: Roboto,
                    ),
                  ),
                  value: controller.isSelectAll,
                  onChanged: (value) {
                    controller.isSelectAll = value!;
                    if (controller.isSelectAll == true) {
                      controller.multipleSelected.addAll(controller.checkListItems);
                    } else {
                      controller.multipleSelected.clear();
                    }
                    for (var i = 0; i < controller.checkListItems.length; i++) {
                      controller.checkListItems[i]['value'] = controller.isSelectAll;
                    }
                    controller.update();
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.checkListItems.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        checkColor: ColorResources.WHITE,
                        side: BorderSide(
                          color: ColorResources.COLOR_B4B4B4,
                        ),
                        activeColor: ColorResources.COLOR_F13A3A,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 10),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        title: RkText(
                          controller.checkListItems[i]["title"],
                          maxLine: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            color: ColorResources.COLOR_515151,
                            fontFamily: Roboto,
                          ),
                        ),
                        value: controller.checkListItems[i]["value"],
                        onChanged: (value) {
                          controller.checkListItems[i]["value"] = value;
                          if (controller.checkListItems[i]["value"] == false) {
                            controller.multipleSelected.remove(controller.checkListItems[i]);
                            controller.isSelectAll = false;
                          } else if (controller.checkListItems[i]["value"] == true) {
                            controller.multipleSelected.add(controller.checkListItems[i]);
                            if (controller.multipleSelected.length == controller.checkListItems.length) {
                              controller.isSelectAll = true;
                            }
                          }
                          controller.update();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: RkDimensions.ONE_UNIT_FONT * 15,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RkText(
                  "2. Nhận thông báo qua email",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 16,
                    color: ColorResources.COLOR_515151,
                    fontFamily: Roboto,
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.checkListItems1.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        checkColor: ColorResources.WHITE,
                        side: BorderSide(
                          color: ColorResources.COLOR_B4B4B4,
                        ),
                        activeColor: ColorResources.COLOR_F13A3A,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 10),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        title: RkText(
                          controller.checkListItems1[i]["title"],
                          maxLine: 3,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            color: ColorResources.COLOR_515151,
                            fontFamily: Roboto,
                          ),
                        ),
                        value: controller.checkListItems1[i]["value"],
                        onChanged: (value) {
                          controller.checkListItems1[i]["value"] = value;
                          controller.update();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
