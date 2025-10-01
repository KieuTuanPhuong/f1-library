import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/utils/color_resources.dart';

mixin RkAlert {
  static void error({required String message, Color? backgroundColor}) {
    Get.snackbar('error'.tr, message, backgroundColor: backgroundColor ?? Colors.red);
  }

  static void success({required String message, Color? backgroundColor}) {
    Get.snackbar(
      'success'.tr,
      message,
      backgroundColor: backgroundColor ?? ColorResources.CIRCLE_COLOR_BG3,
    );
  }

  static void info({required String message, Color? backgroundColor}) {}

  static void showSuccessToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorResources.SUCCESS_TOAST,
        textColor: ColorResources.BLACK,
        fontSize: RkDimensions.FONT_SIZE_SPAN_MEDIUM);
  }

  static void showErrorToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorResources.ERROR_TOAST,
        textColor: ColorResources.WHITE,
        fontSize: RkDimensions.FONT_SIZE_SPAN_MEDIUM);
  }

  static void showToast({required String message, Color? backgroundColor, Color? textColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: backgroundColor ?? ColorResources.GREY3,
        textColor: textColor ?? ColorResources.WHITE,
        fontSize: RkDimensions.FONT_SIZE_SPAN_MEDIUM);
  }
}
