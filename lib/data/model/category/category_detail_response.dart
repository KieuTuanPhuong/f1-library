import 'package:template/helper/rk_dimensions.dart';
import 'package:template/helper/rk_validate.dart';

class CategoryDetailResponse {
  String? categoryId;
  String? categoryName;
  String? icon;
  int? type;
  int? viewStatus;
  List<Juridical>? juridical;
  List<Describe>? describe;

  CategoryDetailResponse({
    this.categoryId,
    this.categoryName,
    this.icon,
    this.type,
    this.viewStatus,
    this.juridical,
    this.describe,
  });

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) => CategoryDetailResponse(
        categoryId: RkValidate.parseStringFromJson(json["category_id"]),
        categoryName: RkValidate.parseStringFromJson(json["category_name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        type: RkValidate.parseIntFromJson(json["type"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        juridical: json["juridical"] == null ? [] : List<Juridical>.from(json["juridical"]!.map((x) => Juridical.fromJson(x))),
        describe: json["describe"] == null ? [] : List<Describe>.from(json["describe"]!.map((x) => Describe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "icon": icon,
        "type": type,
        "view_status": viewStatus,
        "juridical": juridical == null ? [] : List<dynamic>.from(juridical!.map((x) => x.toJson())),
        "describe": describe == null ? [] : List<dynamic>.from(describe!.map((x) => x.toJson())),
      };
}

class Describe {
  String? describeId;
  String? describeName;
  String? icon;
  int? infoType;
  List<ValueDescribe>? value;
  String? valueId;
  String? valueDescribe;
  String? description;
  int? indexSelectValue;

  Describe({
    this.describeId,
    this.describeName,
    this.icon,
    this.infoType,
    this.value,
    this.description,
    this.valueDescribe,
    this.valueId,
    this.indexSelectValue,
  });

  factory Describe.fromJson(Map<String, dynamic> json) => Describe(
        describeId: RkValidate.parseStringFromJson(json["describe_id"]),
        describeName: RkValidate.parseStringFromJson(json["describe_name"]),
        icon: RkValidate.parseStringFromJson(json["icon"]),
        infoType: RkValidate.parseIntFromJson(json["info_type"]),
        valueId: RkValidate.parseStringFromJson(json["value_id"]),
        value: json["value"] == null ? [] : List<ValueDescribe>.from(json["value"]!.map((x) => ValueDescribe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "describe_id": describeId,
        "describe_name": describeName,
        "icon": icon,
        "info_type": infoType,
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class ValueDescribe {
  String? propertiesId;
  String? propertiesName;

  ValueDescribe({
    this.propertiesId,
    this.propertiesName,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueDescribe && other.propertiesId == propertiesId && other.propertiesName == propertiesName;
  }

  factory ValueDescribe.fromJson(Map<String, dynamic> json) => ValueDescribe(
        propertiesId: RkValidate.parseStringFromJson(json["properties_id"]),
        propertiesName: RkValidate.parseStringFromJson(json["properties_name"]),
      );

  Map<String, dynamic> toJson() => {
        "properties_id": propertiesId,
        "properties_name": propertiesName,
      };
}

class Juridical {
  String? juridicalId;
  String? juridicalName;
  bool? isSelect;

  Juridical({
    this.juridicalId,
    this.juridicalName,
    this.isSelect,
  });

  factory Juridical.fromJson(Map<String, dynamic> json) => Juridical(
        juridicalId: RkValidate.parseStringFromJson(json["juridical_id"]),
        juridicalName: RkValidate.parseStringFromJson(json["juridical_name"]),
        isSelect: false,
      );

  Map<String, dynamic> toJson() => {
        "juridical_id": juridicalId,
        "juridical_name": juridicalName,
      };
}
