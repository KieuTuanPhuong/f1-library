import '../../../helper/rk_validate.dart';

class ListDistrictByProvinceResponse {
  List<District>? district;

  ListDistrictByProvinceResponse({
    this.district,
  });

  factory ListDistrictByProvinceResponse.fromJson(Map<String, dynamic> json) => ListDistrictByProvinceResponse(
        district: json["district"] == null ? [] : List<District>.from(json["district"]!.map((x) => District.fromJson(x))),
      );
}

class District {
  int? code;
  String? name;
  int? provinceCode;
  String? slug;

  District({
    this.code,
    this.name,
    this.provinceCode,
    this.slug,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is District && other.name == name && other.code == code;
  }

  factory District.fromJson(Map<String, dynamic> json) => District(
        code: RkValidate.parseIntFromJson(json["code"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        provinceCode: RkValidate.parseIntFromJson(json["province_code"]),
        slug: RkValidate.parseStringFromJson(json["slug"]),
      );
}
