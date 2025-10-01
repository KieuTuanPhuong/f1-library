import 'dart:io';

import '../../../helper/rk_validate.dart';

class UploadFileRequest {
  File? file;
  String? path;

  UploadFileRequest({
    this.file,
    this.path,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(file)) data['file'] = file;
    if (!RkValidate.nullOrEmpty(path)) data['path'] = path;

    return data;
  }
}
