import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

mixin FileHelper {
  static Future<String> findLocalPath() async {
    final platform = (Platform.isAndroid) ? TargetPlatform.android : TargetPlatform.iOS;
    if (platform == TargetPlatform.android) {
      final directory = await getExternalStorageDirectory();
      return directory?.path ?? '';
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  static Future<bool> checkPermission() async {
    final status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      final result = await Permission.storage.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}