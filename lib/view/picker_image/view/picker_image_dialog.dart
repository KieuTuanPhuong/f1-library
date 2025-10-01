
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/base_widget/rk_text.dart';
import 'package:template/utils/fonts.dart';

import '../controller/picker_image_controller.dart';

class ImagePickerDialog extends GetView<PickerImageController> {
  final String? nameMessage;

  ImagePickerDialog({this.nameMessage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickerImageController>(
      key: UniqueKey(),
      builder: (value) => CupertinoActionSheet(
        message: Text(nameMessage != null ? nameMessage! : ""),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Container(
              // height: RkDimensions.ONE_UNIT_FONT * 40,
              padding: EdgeInsets.zero,
              child: RkText(
                "Chụp Ảnh",
                style: TextStyle(
                  fontFamily: Roboto,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                  // height: 10,
                ),
              ),
            ),
            onPressed: () {
              controller.onPickerImage(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: RkText(
              "Chọn ảnh từ thư viện",
              style: TextStyle(
                fontFamily: Roboto,
                fontWeight: FontWeight.w400,
                color: Colors.red,
                // height: 10,
              ),
            ),
            onPressed: () {
              controller.onPickerImage(ImageSource.gallery);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: RkText("Hủy"),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
