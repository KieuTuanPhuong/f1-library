import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helper/handle_image.dart';
import '../../../helper/rk_alert.dart';

class PickerImageController extends GetxController {
  List<File>? images;

  @override
  void onInit() {
    super.onInit();
    images = <File>[];
  }

  void onPickerImage(ImageSource imageSource) {
    images!.clear();
    // EasyLoading.show(status: 'loading'.tr, dismissOnTap: false);
    HandleImage().pickerImage(imageSource).then((value) async {
      // EasyLoading.dismiss(animation: true);
      int sizeInBytes = value.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > 15) {
        // This file is Longer the
        RkAlert.error(message: "Dữ liệu tải lên không được quá 15Mb.");
      } else {
        images!.add(value);
        print("5 ${images!}");
        Get.back(result: images);
      }
    }).catchError((onError) {
      // EasyLoading.dismiss(animation: true);
    });
  }
}
