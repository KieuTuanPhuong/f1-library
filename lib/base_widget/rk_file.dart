import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' hide Color;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/model/upload_image/upload_image_request.dart';
import '../data/provider/provider.dart';

import '../helper/rk_dimensions.dart';
import '../helper/rk_other.dart';
import '../helper/rk_size.dart';
import '../helper/rk_validate.dart';
import '../utils/color_resources.dart';
import '../utils/fonts.dart';
import '../utils/images_path.dart';
import 'rk_image.dart';
import 'rk_text.dart';

enum RkFileType {
  IMAGE,
  FILE,
  AVATAR,
}

class RkFile extends StatefulWidget {
  RkFile({
    this.height,
    this.width,
    this.imageSource = ImageSource.gallery,
    this.onPikerFile,
    this.margin,
    Key? key,
    this.imgFile,
  })  : type = RkFileType.IMAGE,
        super(key: key);

  RkFile.avatar({
    this.height,
    this.width,
    this.imageSource = ImageSource.gallery,
    this.onPikerFile,
    this.margin,
    Key? key,
    this.imgFile,
  })  : type = RkFileType.AVATAR,
        super(key: key);

  RkFile.file({
    this.height,
    this.width,
    this.onPikerFile,
    this.margin,
    this.color,
    this.isShowFileName = true,
    Key? key,
    this.imgFile,
  })  : type = RkFileType.FILE,
        super(key: key);

  final double? height, width;

  // TODO: return file
  final Function(File? val)? onPikerFile;
  final EdgeInsets? margin;
  Color? color;
  ImageSource? imageSource;
  RkFileType type;
  final String? imgFile;
  bool? isShowFileName = true;

  @override
  _RkFileState createState() => _RkFileState();
}

class _RkFileState extends State<RkFile> {
  final Provider provider = Provider();
  File? file;

  Future pickFiles() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      setState(() {
        file = File(
          result.files.single.path.toString(),
        );
      });
      widget.onPikerFile != null ? widget.onPikerFile!(file) : () {};
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<File> _resizeImage(String filePath, {int? height = 1024, int? width = 1024, int? quality = 100}) async {
    final file = File(filePath);

    final bytes = await file.readAsBytes();
    // print("Picture original size: ${bytes.length}");

    final image = decodeImage(bytes);
    final resized = copyResize(image!, width: width, height: height);
    final resizedBytes = encodeJpg(resized, quality: quality!);
    // print("Picture resized size: ${resizedBytes.length}");

    return file.writeAsBytes(resizedBytes);
  }

  ///
  /// Pick images
  ///
  Future pickImages() async {
    try {
      final result = await ImagePicker().pickImage(
        source: widget.imageSource!,
      );
      if (result == null) return;
      if (await File(result.path).length() > 2 * 1024 * 1024) {
        await _resizeImage(result.path, height: 512, width: 512).then((value) {
          setState(() {
            file = value;
          });
        });
      } else {
        setState(() {
          file = File(result.path);
          onPikerFile();
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void onPicker(RkFileType type) async {
    if (type == RkFileType.FILE) {
      if (Platform.isIOS) {
        final status = await Permission.storage.request();
        if (status.isGranted) {
          pickFiles();
        }
      } else {
        pickFiles();
      }
    } else {
      PermissionStatus? status;
      if (widget.imageSource == ImageSource.gallery) {
        // status = await Permission.photos.request();
        pickImages();
      } else {
        status = await Permission.camera.request();
        if (status.isGranted) {
          pickImages();
        }
      }
    }
  }

  void onPikerFile() {
    if (!RkValidate.nullOrEmpty(widget.onPikerFile) && !RkValidate.nullOrEmpty(file)) {
      final UploadImageRequest upload = UploadImageRequest();
      upload.filename = file!.path.split('/').last.toString();
      final List<int> imageBytes = file!.readAsBytesSync();
      // print(base64Encode(imageBytes));
      upload.filedata = base64Encode(imageBytes);
      // TODO: Upload file and return url image
      // provider.uploadImage(
      //   UploadImageResponse(),
      //   requestBody: upload.toJson(),
      //   onSuccess: (data) {
      //     print("data $data");
      //     final image = data as UploadImageResponse;
      //     widget.onPikerFile!(image.filedata);
      //   },
      //   onError: (onError) {
      //     print("Upload error image $onError");
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.type == RkFileType.FILE
          ? fileWidget()
          : widget.type == RkFileType.AVATAR
              ? avatar()
              : imageWidget(),
    );
  }

  Widget fileWidget() {
    return GestureDetector(
      onTap: () {
        onPicker(widget.type);
      },
      child: Row(
        children: [
          RkImage(
            widget.imgFile ?? ImagesPath.img_import_pdf,
            height: RkDimensions.ONE_UNIT_FONT * 45,
            width: RkDimensions.ONE_UNIT_FONT * 45,
          ),
          SizedBox(
            width: RkDimensions.ONE_UNIT_FONT * 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.color != null ? widget.color : ColorResources.COLOR_D0D0D0,
                borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 20),
              ),
              height: RkDimensions.ONE_UNIT_FONT * 50,
              padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 15),
              alignment: Alignment.centerLeft,
              child: widget.isShowFileName == true
                  ? RkText(
                      RkValidate.nullOrEmpty(file) ? "Chọn tập tin" : file!.path.split('/').last.toString(),
                      maxLine: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                        color: ColorResources.COLOR_929292,
                        fontFamily: Roboto,
                      ),
                    )
                  : RkText(
                      "Chọn tập tin",
                      maxLine: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                        color: ColorResources.COLOR_929292,
                        fontFamily: Roboto,
                      ),
                    ),
            ),
          ),
        ],
      ),
      // Container(
      //   margin: widget.margin ??
      //       EdgeInsets.symmetric(
      //         vertical: RkDimensions.BLUR_RADIUS_2X,
      //       ),
      //   padding: EdgeInsets.symmetric(
      //     horizontal: RkDimensions.SPACE_SIZE_2X,
      //   ),
      //   height: RkValidate.nullOrEmpty(widget.height) ? RkDimensions.ONE_UNIT_SIZE * 70 : widget.height!,
      //   width: RkValidate.nullOrEmpty(widget.width) ? double.infinity : widget.width!,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(
      //         RkDimensions.BLUR_RADIUS_2X,
      //       ),
      //       color: ColorResources.WHITE,
      //       border: Border.all(
      //         color: ColorResources.GREEN,
      //         width: 2,
      //       ),
      //       boxShadow: RkOther().boxShadow),
      //   child: RkValidate.nullOrEmpty(file)
      //       ? Container(
      //           color: ColorResources.WHITE,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Expanded(
      //                 child: RkText(
      //                   "Chọn tập tin",
      //                 ),
      //               ),
      //               const Icon(
      //                 Icons.folder,
      //                 color: ColorResources.CIRCLE_COLOR_BG3,
      //               ),
      //             ],
      //           ),
      //         )
      //       : Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Expanded(
      //               child: RkText(
      //                 file!.path.split('/').last.toString(),
      //                 maxLine: 1,
      //               ),
      //             ),
      //             const Icon(Icons.folder, color: ColorResources.CIRCLE_COLOR_BG3)
      //           ],
      //         ),
      // ),
    );
  }

  Widget imageWidget() {
    return Container(
      margin: widget.margin ??
          EdgeInsets.symmetric(
            vertical: RkDimensions.BLUR_RADIUS_2X,
          ),
      height: RkValidate.nullOrEmpty(widget.height) ? RkDimensions.ONE_UNIT_SIZE * 250 : widget.height!,
      width: RkValidate.nullOrEmpty(widget.width) ? RkDimensions.ONE_UNIT_SIZE * 250 : widget.width!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          RkDimensions.BLUR_RADIUS_3X,
        ),
        color: ColorResources.GREY.withOpacity(0.7),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: RkValidate.nullOrEmpty(widget.height) ? RkDimensions.ONE_UNIT_SIZE * 250 : widget.height!,
            width: RkValidate.nullOrEmpty(widget.width) ? RkDimensions.ONE_UNIT_SIZE * 250 : widget.width!,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                RkDimensions.BLUR_RADIUS_3X,
              ),
              boxShadow: RkOther().boxShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                RkDimensions.BLUR_RADIUS_3X,
              ),
              child: RkImage.file(
                file,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: RkValidate.nullOrEmpty(widget.height) ? RkDimensions.ONE_UNIT_SIZE * 50 : widget.height! / 4,
            width: RkValidate.nullOrEmpty(widget.width) ? RkDimensions.ONE_UNIT_SIZE * 50 : widget.height! / 4,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorResources.CIRCLE_COLOR_BG3,
                width: 3,
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  onPicker(widget.type);
                },
                child: Icon(
                  Icons.add,
                  color: ColorResources.CIRCLE_COLOR_BG3,
                  size: !RkValidate.nullOrEmpty(widget.height) ? widget.height! / 6 : RkDimensions.ONE_UNIT_SIZE * 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget avatar() {
    return GestureDetector(
      onTap: () {
        onPicker(widget.type);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          shape: BoxShape.circle,
          boxShadow: RkOther().boxShadow,
        ),
        padding: EdgeInsets.all(
          RkSize.device == RkDevice.TABLE ? RkDimensions.ONE_UNIT_SIZE * 18 : RkDimensions.ONE_UNIT_SIZE * 5,
        ),
        child: Icon(
          Icons.camera_alt,
          size: RkSize.device == RkDevice.TABLE ? RkDimensions.ONE_UNIT_SIZE * 40 : RkDimensions.ONE_UNIT_SIZE * 28,
        ),
      ),
    );
  }
}
