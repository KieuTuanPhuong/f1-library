import 'package:template/helper/rk_validate.dart';

class EventResponse {
  ItemEvent? event;

  EventResponse({
    this.event,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        event: json["event"] == null ? null : ItemEvent.fromJson(json["event"]),
      );
}

class ItemEvent {
  String? id;
  String? name;
  String? eventIcon;

  ItemEvent({
    this.id,
    this.name,
    this.eventIcon,
  });

  factory ItemEvent.fromJson(Map<String, dynamic> json) => ItemEvent(
        id: !RkValidate.nullOrEmpty(json["id"]) ? RkValidate.parseStringFromJson(json["id"]) : null,
        name: !RkValidate.nullOrEmpty(json["name"]) ? RkValidate.parseStringFromJson(json["name"]) : null,
        eventIcon: !RkValidate.nullOrEmpty(json["event_icon"]) ? RkValidate.parseStringFromJson(json["event_icon"]) : null,
      );
}
