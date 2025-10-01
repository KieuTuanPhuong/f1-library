import 'package:flutter/material.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/helper/rk_validate.dart';
import 'package:template/utils/color_resources.dart';
import 'package:url_launcher/url_launcher.dart';

class RkOther {
  ///
  /// open link url
  ///
  static Future openLink({required String url}) async {
    if (!RkValidate.nullOrEmpty(url)) {
      if (await canLaunch(url)) {
        await launch(url);
      }
    }
  }

  List<BoxShadow> boxShadow = [
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: RkDimensions.BLUR_RADIUS_4X,
      color: ColorResources.BLACK.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(0, -2),
      blurRadius: RkDimensions.BLUR_RADIUS_4X,
      color: ColorResources.BLACK.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(2, 0),
      blurRadius: RkDimensions.BLUR_RADIUS_4X,
      color: ColorResources.BLACK.withAlpha(10),
    ),
    BoxShadow(
      offset: const Offset(-2, 0),
      blurRadius: RkDimensions.BLUR_RADIUS_4X,
      color: ColorResources.BLACK.withAlpha(10),
    ),
  ];
}
