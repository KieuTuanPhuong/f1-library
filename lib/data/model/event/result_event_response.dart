import '../../../helper/rk_validate.dart';

class ResultEventResponse {
  ResultEvent? result;

  ResultEventResponse({
    this.result,
  });

  factory ResultEventResponse.fromJson(Map<String, dynamic> json) => ResultEventResponse(
        result: json["result"] == null ? null : ResultEvent.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class ResultEvent {
  String? id;
  String? name;
  String? image;
  String? description;
  String? price;

  ResultEvent({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
  });

  factory ResultEvent.fromJson(Map<String, dynamic> json) => ResultEvent(
        id: !RkValidate.nullOrEmpty(json["id"]) ? RkValidate.parseStringFromJson(json["id"]) : null,
        name: !RkValidate.nullOrEmpty(json["name"]) ? RkValidate.parseStringFromJson(json["name"]) : null,
        image: !RkValidate.nullOrEmpty(json["image"]) ? RkValidate.parseStringFromJson(json["image"]) : null,
        description: !RkValidate.nullOrEmpty(json["description"]) ? RkValidate.parseStringFromJson(json["description"]) : null,
        price: !RkValidate.nullOrEmpty(json["price"]) ? RkValidate.parseStringFromJson(json["price"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
      };
}
