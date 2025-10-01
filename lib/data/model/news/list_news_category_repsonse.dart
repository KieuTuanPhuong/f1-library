import 'package:template/helper/rk_validate.dart';

class NewsCategoryResponse {
  String? id;
  String? name;
  int? isDelete;

  NewsCategoryResponse({
    this.id,
    this.name,
    this.isDelete,
  });

  factory NewsCategoryResponse.fromJson(Map<String, dynamic> json) => NewsCategoryResponse(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        isDelete: RkValidate.parseIntFromJson(json["is_delete"]),
      );
}
