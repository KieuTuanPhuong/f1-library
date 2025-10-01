import '../../../helper/rk_validate.dart';

class DetailEventResponse {
  InfoEvent? event;
  ItemSpinner? spiner;

  DetailEventResponse({
    this.event,
    this.spiner,
  });

  factory DetailEventResponse.fromJson(Map<String, dynamic> json) => DetailEventResponse(
        event: json["event"] == null ? null : InfoEvent.fromJson(json["event"]),
        spiner: json["spiner"] == null ? null : ItemSpinner.fromJson(json["spiner"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event?.toJson(),
        "spiner": spiner?.toJson(),
      };
}

class InfoEvent {
  String? id;
  String? name;
  String? coverImageWeb;
  String? coverImageApp;
  String? spinVector;
  String? arrowVector;
  String? rules;
  String? reward;

  InfoEvent({
    this.id,
    this.name,
    this.coverImageWeb,
    this.coverImageApp,
    this.spinVector,
    this.arrowVector,
    this.rules,
    this.reward,
  });

  factory InfoEvent.fromJson(Map<String, dynamic> json) => InfoEvent(
        id: !RkValidate.nullOrEmpty(json["id"]) ? RkValidate.parseStringFromJson(json["id"]) : null,
        name: !RkValidate.nullOrEmpty(json["name"]) ? RkValidate.parseStringFromJson(json["name"]) : null,
        coverImageWeb: !RkValidate.nullOrEmpty(json["cover_image_web"]) ? RkValidate.parseStringFromJson(json["cover_image_web"]) : null,
        coverImageApp: !RkValidate.nullOrEmpty(json["cover_image_app"]) ? RkValidate.parseStringFromJson(json["cover_image_app"]) : null,
        spinVector: !RkValidate.nullOrEmpty(json["spin_vector"]) ? RkValidate.parseStringFromJson(json["spin_vector"]) : null,
        arrowVector: !RkValidate.nullOrEmpty(json["arrow_vector"]) ? RkValidate.parseStringFromJson(json["arrow_vector"]) : null,
        rules: !RkValidate.nullOrEmpty(json["rules"]) ? RkValidate.parseStringFromJson(json["rules"]) : null,
        reward: !RkValidate.nullOrEmpty(json["reward"]) ? RkValidate.parseStringFromJson(json["reward"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover_image_web": coverImageWeb,
        "cover_image_app": coverImageApp,
        "spin_vector": spinVector,
        "arrow_vector": arrowVector,
        "rules": rules,
        "reward": reward,
      };
}

class ItemSpinner {
  String? id;
  String? image;
  List<ListReward>? listReward;

  ItemSpinner({
    this.id,
    this.image,
    this.listReward,
  });

  factory ItemSpinner.fromJson(Map<String, dynamic> json) => ItemSpinner(
        id: !RkValidate.nullOrEmpty(json["id"]) ? RkValidate.parseStringFromJson(json["id"]) : null,
        image: !RkValidate.nullOrEmpty(json["image"]) ? RkValidate.parseStringFromJson(json["image"]) : null,
        listReward: json["list_reward"] == null ? [] : List<ListReward>.from(json["list_reward"]!.map((x) => ListReward.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "list_reward": listReward == null ? [] : List<dynamic>.from(listReward!.map((x) => x.toJson())),
      };
}

class ListReward {
  String? image;
  String? id;
  String? name;
  String? price;
  String? description;

  ListReward({
    this.image,
    this.id,
    this.name,
    this.price,
    this.description,
  });

  factory ListReward.fromJson(Map<String, dynamic> json) => ListReward(
        image: json["image"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "id": id,
        "name": name,
        "price": price,
        "description": description,
      };
}
