import '../../../helper/rk_validate.dart';

class ListProvinceResponse {
  List<Province>? province;

  ListProvinceResponse({
    this.province,
  });

  factory ListProvinceResponse.fromJson(Map<String, dynamic> json) => ListProvinceResponse(
        province: json["province"] == null ? [] : List<Province>.from(json["province"]!.map((x) => Province.fromJson(x))),
      );
}

class Province {
  int? code;
  String? name;
  String? slug;

  Province({
    this.code,
    this.name,
    this.slug,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Province && other.name == name && other.code == code;
  }

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        code: RkValidate.parseIntFromJson(json["code"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        slug: RkValidate.parseStringFromJson(json["slug"]),
      );
}
