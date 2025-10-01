import 'package:template/helper/rk_number.dart';
import 'package:template/helper/rk_validate.dart';

class ListImgRealEstate {
  List<ImgRealEstate>? image;

  ListImgRealEstate({
    this.image,
  });

  factory ListImgRealEstate.fromJson(Map<String, dynamic> json) => ListImgRealEstate(
        image: json["list_result"] == null ? [] : List<ImgRealEstate>.from(json["list_result"]!.map((x) => ImgRealEstate.fromJson(x))),
      );
}

class ImgRealEstate {
  String? path;
  String? pathTemp;
  int? is360;
  bool? isSelect360;

  ImgRealEstate({
    this.path,
    this.pathTemp,
    this.is360,
    this.isSelect360 = true,
  });

  factory ImgRealEstate.fromJson(Map<String, dynamic> json) => ImgRealEstate(
        path: RkValidate.parseStringFromJson(json["path"]),
        pathTemp: RkValidate.parseStringFromJson(json["path_tam"]),
        is360: RkValidate.parseIntFromJson(json["is_360"]),
        isSelect360: true,
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "path_tam": pathTemp,
        "is_360": is360,
      };
}
