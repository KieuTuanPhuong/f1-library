import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/images_path.dart';
import 'package:template/view/widget/aura_app_bar_widget.dart';
import 'dart:io' show Platform;

class AuraScreen extends StatefulWidget {
  const AuraScreen({Key? key, required this.appBarWidget, required this.body}) : super(key: key);
  final AuraAppBarWidget appBarWidget;
  final Widget body;

  @override
  State<AuraScreen> createState() => _AuraScreenState();
}

class _AuraScreenState extends State<AuraScreen> {
  double paddingTop = 0.0;

  @override
  void initState() {
    super.initState();
    paddingTop = (Platform.isAndroid) ? Get.statusBarHeight / 1.5 * RkDimensions.ONE_UNIT_SIZE : Get.statusBarHeight / 2 * RkDimensions.ONE_UNIT_SIZE;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future(() => true);
      },
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: ColorResources.WHITE,
          ),
          RkImage(
            ImagesPath.background_gradient,
            width: Get.width,
            height: Get.height,
          ),
          Column(
            children: [buildAppBar(), Expanded(child: widget.body)],
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(top: paddingTop, bottom: RkDimensions.ONE_UNIT_SIZE * 15),
      child: Column(
        children: [widget.appBarWidget],
      ),
    );
  }
}
