import 'package:template/data/model/upload_image/upload_image_response.dart';

import '../../../helper/rk_validate.dart';

class UploadImageRequest extends UploadImageResponse {
  UploadImageRequest();

  ///
  /// From JSON
  ///
  @override
  UploadImageRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // filename = !RkValidate.nullOrEmpty(json['file_name']) ? json['file_name'].toString() : null;
    // filedata = !RkValidate.nullOrEmpty(json['file_url']) ? json['file_url'].toString() : null;
  }

  // @override
  // fromJson(Map<String, dynamic> json) {
  //   filename = !RkValidate.nullOrEmpty(json['file_name']) ? json['file_name'].toString() : null;
  //   filedata = !RkValidate.nullOrEmpty(json['file_url']) ? json['file_url'].toString() : null;
  // }

  ///
  /// To JSON
  ///
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(filename)) data['filename'] = filename;
    if (!RkValidate.nullOrEmpty(filedata)) data['filedata'] = filedata;
    return data;
  }

  @override
  String toString() => 'UploadImageResponse(filename: $filename, filedata: $filedata)';
}
