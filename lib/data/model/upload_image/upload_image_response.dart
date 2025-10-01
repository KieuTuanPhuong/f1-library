import '../../../helper/rk_number.dart';
import '../../../helper/rk_validate.dart';

class UploadImageResponse {
  String? name;
  int? isPrivate;
  String? filename;
  String? filedata;
  UploadImageResponse({
    this.name,
    this.isPrivate,
    this.filename,
    this.filedata,
  });

  ///
  /// From JSON
  ///
  UploadImageResponse.fromJson(Map<String, dynamic> json) {
    name = !RkValidate.nullOrEmpty(json['name']) ? json['name'].toString() : null;
    isPrivate = !RkValidate.nullOrEmpty(json['is_private']) ? RkNumber.parseInt(json['is_private']) : null;
    filename = !RkValidate.nullOrEmpty(json['file_name']) ? json['file_name'].toString() : null;
    filedata = !RkValidate.nullOrEmpty(json['file_url']) ? json['file_url'].toString() : null;
  }

  // @override
  // fromJson(Map<String, dynamic> json) {
  //   filename = !RkValidate.nullOrEmpty(json['file_name']) ? json['file_name'].toString() : null;
  //   filedata = !RkValidate.nullOrEmpty(json['file_url']) ? json['file_url'].toString() : null;
  //   name = !RkValidate.nullOrEmpty(json['name']) ? json['name'].toString() : null;
  //   // isPrivate = !RkValidate.nullOrEmpty(json['is_private']) ? RkNumber.parseInt(json['is_private']) : null;
  // }

  ///
  /// To JSON
  ///
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(filename)) data['filename'] = filename;
    if (!RkValidate.nullOrEmpty(filedata)) data['filedata'] = filedata;
    return data;
  }

  @override
  String toString() => 'UploadImageResponse(filename: $filename, filedata: $filedata)';
}
