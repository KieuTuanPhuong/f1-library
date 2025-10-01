import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_button.dart';
import 'package:template/base_widget/rk_text.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/fonts.dart';

import '../helper/rk_dimensions.dart';
import '../helper/rk_validate.dart';

// ignore: avoid_classes_with_only_static_members
class RkDialog {
  static Future<void> showDialog({
    required String lable,
    //required String title,
    String? confirmLabel,
    String? cancelLabel,
    String? description,
    Function? onConfirm,
    Function? onCancel,
    bool? isOnebuttonConfirm,
  }) {
    return Get.defaultDialog(
      // pa: EdgeInsets.only(
      //   top: RkDimensions.SPACE_SIZE_5X,
      // ),
      radius: RkDimensions.ONE_UNIT_SIZE * 10,
      barrierDismissible: true,
      title: lable,
      content: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.only(
          //     top: RkDimensions.ONE_UNIT_SIZE * 10,
          //   ),
          //   child: RkText(
          //     title,
          //     textAlign: TextAlign.center,
          //     maxLine: 1,
          //     style: TextStyle(
          //       fontFamily: OpenSans,
          //       fontWeight: FontWeight.w700,
          //       fontSize: RkDimensions.ONE_UNIT_SIZE * 24,
          //     ),
          //   ),
          // ),
          Container(
            // margin: EdgeInsets.only(
            //   bottom: RkDimensions.SPACE_SIZE_5X,
            // ),
            padding: EdgeInsets.symmetric(
              horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
            ),
            child: RkText(
              description ?? '',
              textAlign: TextAlign.center,
              maxLine: 7,
              style: TextStyle(
                fontFamily: Barlow,
                fontWeight: FontWeight.w400,
                fontSize: RkDimensions.ONE_UNIT_SIZE * 24,
              ),
            ),
          ),
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 30,
          ),
          if (isOnebuttonConfirm == false)
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                if (!RkValidate.nullOrEmpty(onCancel))
                  RkButton(
                    margin: const EdgeInsets.all(0),
                    type: RkButtonType.OUTLINE,
                    colorBG: ColorResources.WHITE,
                    colorText: ColorResources.BLACK,
                    label: cancelLabel ?? "Hủy",
                    borderRadius: RkDimensions.BLUR_RADIUS_2X,
                    width: RkDimensions.screenSize.width * 0.3,
                    height: RkDimensions.ONE_UNIT_SIZE * 60,
                    padding: EdgeInsets.symmetric(
                      vertical: RkDimensions.ONE_UNIT_SIZE * 0,
                    ),
                    withBorder: 1,
                    onTap: () {
                      onCancel!();
                    },
                  ),
                const Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                if (!RkValidate.nullOrEmpty(onConfirm))
                  RkButton(
                    margin: EdgeInsets.all(0),
                    colorBG: ColorResources.COLOR_F13A3A,
                    color: ColorResources.WHITE,
                    borderRadius: RkDimensions.BLUR_RADIUS_2X,
                    width: RkDimensions.screenSize.width * 0.3,
                    height: RkDimensions.ONE_UNIT_SIZE * 60,
                    padding: EdgeInsets.symmetric(
                      vertical: RkDimensions.ONE_UNIT_SIZE * 0,
                    ),
                    label: confirmLabel ?? "Đồng ý",
                    onTap: () {
                      onConfirm!();
                    },
                  ),
                const Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
              ],
            )
          else
            Container(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              child: !RkValidate.nullOrEmpty(onConfirm)
                  ? RkButton(
                      colorBG: ColorResources.highlight,
                      color: ColorResources.WHITE,
                      borderRadius: RkDimensions.BLUR_RADIUS_2X,
                      width: RkDimensions.screenSize.width * 0.7,
                      padding: EdgeInsets.symmetric(
                        horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
                        vertical: RkDimensions.ONE_UNIT_SIZE * 20,
                      ),
                      label: confirmLabel ?? "Đồng ý",
                      onTap: () {
                        onConfirm!();
                      },
                    )
                  : SizedBox(),
            ),
        ],
      ),
    );
  }
}
