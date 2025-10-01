import 'package:template/helper/rk_validate.dart';

class ParamsSearchResponse {
  List<EFilter>? priceFilter;
  List<EFilter>? acreageFilter;
  DirectionFilter? directionFilter;
  BadroomFilter? badroomFilter;

  ParamsSearchResponse({
    this.priceFilter,
    this.acreageFilter,
    this.directionFilter,
    this.badroomFilter,
  });

  factory ParamsSearchResponse.fromJson(Map<String, dynamic> json) => ParamsSearchResponse(
        priceFilter: json["price_filter"] == null ? [] : List<EFilter>.from(json["price_filter"]!.map((x) => EFilter.fromJson(x))),
        acreageFilter: json["acreage_filter"] == null ? [] : List<EFilter>.from(json["acreage_filter"]!.map((x) => EFilter.fromJson(x))),
        directionFilter: json["direction_filter"] == null ? null : DirectionFilter.fromJson(json["direction_filter"]),
        badroomFilter: json["bedroom_filter"] == null ? null : BadroomFilter.fromJson(json["bedroom_filter"]),
      );

  Map<String, dynamic> toJson() => {
        "price_filter": priceFilter == null ? [] : List<dynamic>.from(priceFilter!.map((x) => x.toJson())),
        "acreage_filter": acreageFilter == null ? [] : List<dynamic>.from(acreageFilter!.map((x) => x.toJson())),
        "direction_filter": directionFilter?.toJson(),
        "badroom_filter": badroomFilter?.toJson(),
      };
}

class EFilter {
  String? id;
  String? type;
  String? text;
  String? fromValue;
  String? toValue;

  EFilter({
    this.id,
    this.type,
    this.text,
    this.fromValue,
    this.toValue,
  });

  factory EFilter.fromJson(Map<String, dynamic> json) => EFilter(
        id: RkValidate.parseStringFromJson(json["id"]),
        type: RkValidate.parseStringFromJson(json["type"]),
        text: RkValidate.parseStringFromJson(json["text"]),
        fromValue: RkValidate.parseStringFromJson(json["from_value"]),
        toValue: RkValidate.parseStringFromJson(json["to_value"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "text": text,
        "from_value": fromValue,
        "to_value": toValue,
      };
}

class BadroomFilter {
  String? describeName;
  List<BadroomFilterValue>? value;

  BadroomFilter({
    this.describeName,
    this.value,
  });

  factory BadroomFilter.fromJson(Map<String, dynamic> json) => BadroomFilter(
        describeName: RkValidate.parseStringFromJson(json["describe_name"]),
        value: json["value"] == null ? [] : List<BadroomFilterValue>.from(json["value"]!.map((x) => BadroomFilterValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "describe_name": describeName,
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class BadroomFilterValue {
  String? id;
  String? name;

  BadroomFilterValue({
    this.id,
    this.name,
  });

  factory BadroomFilterValue.fromJson(Map<String, dynamic> json) => BadroomFilterValue(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class DirectionFilter {
  String? describeName;
  List<DirectionFilterValue>? value;

  DirectionFilter({
    this.describeName,
    this.value,
  });

  factory DirectionFilter.fromJson(Map<String, dynamic> json) => DirectionFilter(
        describeName: RkValidate.parseStringFromJson(json["describe_name"]),
        value: json["value"] == null ? [] : List<DirectionFilterValue>.from(json["value"]!.map((x) => DirectionFilterValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "describe_name": describeName,
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class DirectionFilterValue {
  String? id;
  String? name;

  DirectionFilterValue({
    this.id,
    this.name,
  });

  factory DirectionFilterValue.fromJson(Map<String, dynamic> json) => DirectionFilterValue(
        id: RkValidate.parseStringFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
