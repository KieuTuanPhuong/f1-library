import '../../../helper/rk_validate.dart';

class ListWardByDistrictResponse {
  List<Ward>? ward;

  ListWardByDistrictResponse({
    this.ward,
  });

  factory ListWardByDistrictResponse.fromJson(Map<String, dynamic> json) => ListWardByDistrictResponse(
        ward: json["ward"] == null ? [] : List<Ward>.from(json["ward"]!.map((x) => Ward.fromJson(x))),
      );
}

class Ward {
  int? code;
  String? name;
  int? districtCode;
  String? slug;

  Ward({
    this.code,
    this.name,
    this.districtCode,
    this.slug,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Ward && other.name == name && other.code == code;
  }

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        code: RkValidate.parseIntFromJson(json["code"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        districtCode: RkValidate.parseIntFromJson(json["district_code"]),
        slug: RkValidate.parseStringFromJson(json["slug"]),
      );
}
