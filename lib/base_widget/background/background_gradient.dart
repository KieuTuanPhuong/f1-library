import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/images_path.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND,
        body:
            // SizedBox(),
            Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage(ImagesPath.img_bg_login)),
            // color: ColorResources.BLACK,
            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromRGBO(0, 0, 0, 1),
            //     Color.fromRGBO(21, 21, 21, 1),
            //     Color.fromRGBO(91, 71, 27, 1),
            //     Color.fromRGBO(19, 19, 19, 1),
            //     Color.fromRGBO(0, 0, 0, 1),
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.center,
            // ),
          ),
          child: SizedBox(),
        ),
      ),
    );
  }
}
