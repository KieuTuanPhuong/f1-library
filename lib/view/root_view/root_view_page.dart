import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/helper/rk_number.dart';
import 'package:template/utils/color_resources.dart';

import '../../base_widget/rk_text.dart';
import '../../utils/fonts.dart';
import 'root_view_controller.dart';

class RootViewPage extends GetView<RootViewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (RootViewController value) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) => value.onDoubleBack(),
          child: Scaffold(
            backgroundColor: ColorResources.BACKGROUND_BLACK,
            body: Obx(() => controller.pages[controller.currentIndex.value]
                ['page'] as Widget),
            bottomNavigationBar: bottomNavigator(context),
          ),
        );
      },
    );
  }

  Widget onSelected(BuildContext context,
      {required String title, required RkImage icon, required int index}) {
    return Material(
      child: GestureDetector(
        // onTap: () => controller.onChangedPage(index),
        child: SizedBox(
          width: RkDimensions.screenSize.width / controller.pages.length,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder(
                builder: (RootViewController controller) => Container(
                  padding: EdgeInsets.all(5.0),
                  height: RkDimensions.ONE_UNIT_SIZE * 30,
                  width: RkDimensions.ONE_UNIT_SIZE * 30,
                  child: icon,
                ),
              ),
              Obx(
                () => Text(
                  title,
                  style: TextStyle(
                    color: controller.currentIndex.value == index
                        ? ColorResources.PRIMARY_CONTENT_COLOR
                        : ColorResources.LIGHT_GRAY,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigator(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorResources.STROKE,
            width: 1,
          ),
        ),
      ),
      // height: RkDimensions.ONE_UNIT_FONT * 50,
      child: CustomNavigationBar(
        // isFloating: true,
        iconSize: RkDimensions.ONE_UNIT_FONT * 35,
        // selectedColor: Color(0xff040307),
        //strokeColor: ColorResources.PRIMARY_BG_COLOR,
        // unSelectedColor: Color(0xffacacac),
        strokeColor: ColorResources.STROKE,
        backgroundColor: ColorResources.BACKGROUND_BLACK,
        items: [
          ...List.generate(controller.pages.length, (index) {
            return CustomNavigationBarItem(
              title: Container(
                // margin: EdgeInsets.only(bottom: RkDimensions.ONE_UNIT_FONT * 10),
                child: RkText(
                  controller.pages[index]['label'].toString().tr,
                  style: TextStyle(
                    fontSize: RkDimensions.FONT_SIZE_SPAN_SMALL * 1,
                    fontWeight: FontWeight.w400,
                    fontFamily: Roboto,
                    color: ColorResources.LIGHT_GRAY,
                  ),
                ),
              ),
              selectedTitle: Text(
                controller.pages[index]['label'].toString().tr,
                style: TextStyle(
                  fontSize: RkDimensions.FONT_SIZE_SPAN_SMALL * 1,
                  color: ColorResources.COLOR_EE3439,
                  fontWeight: FontWeight.w400,
                  fontFamily: Roboto,
                ),
              ),
              icon: Container(
                margin: EdgeInsets.only(bottom: RkDimensions.ONE_UNIT_FONT * 5),
                child: controller.pages[index]['icon'] as Widget,
              ),
              selectedIcon: Container(
                margin: EdgeInsets.only(bottom: RkDimensions.ONE_UNIT_FONT * 5),
                child: controller.pages[index]['selectedIcon'] as Widget,
              ),
              badgeCount:
                  RkNumber.parseInt(controller.pages[index]['badgeCount']),
              showBadge:
                  RkNumber.parseInt(controller.pages[index]['badgeCount']) == 0
                      ? false
                      : true,
            );
          })
        ],
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          // controller.onChangedPage(index);
        },
      ),
    );
  }
}
