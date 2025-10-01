import '../../../helper/rk_validate.dart';

class AutoPredictions {
  AutoPredictions({
    this.predictions,
    this.status,
  });

  final List<Prediction>? predictions;
  final String? status;

  factory AutoPredictions.fromJson(Map<String, dynamic> json) => AutoPredictions(
        predictions: json["predictions"] == null ? [] : List<Prediction>.from(json["predictions"]!.map((x) => Prediction.fromJson(x))),
        status: json["status"],
      );
}

class Prediction {
  Prediction({
    this.description,
    this.placeId,
    this.structuredFormatting,
  });

  final String? description;
  final String? placeId;
  final StructuredFormatting? structuredFormatting;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        description: RkValidate.parseStringFromJson(json["description"]),
        placeId: RkValidate.parseStringFromJson(json["placeId"]),
        structuredFormatting: StructuredFormatting.fromJson(json["structured_formatting"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "place_id": placeId,
        "structured_formatting": !RkValidate.nullOrEmpty(structuredFormatting) ? structuredFormatting!.toJson() : "",
      };
}

class StructuredFormatting {
  StructuredFormatting({
    this.mainText,
    this.secondaryText,
  });

  final String? mainText;
  final String? secondaryText;

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => StructuredFormatting(
        mainText: RkValidate.parseStringFromJson(json["mainText"]),
        secondaryText: RkValidate.parseStringFromJson(json["secondaryText"]),
      );

  Map<String, dynamic> toJson() => {
        "main_text": mainText,
        "secondary_text": secondaryText,
      };
}
