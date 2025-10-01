import 'package:template/helper/rk_number.dart';
import 'package:template/helper/rk_validate.dart';

class LocationAddress {
  LocationAddress({
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.address,
  });

  final String? formattedAddress;
  final Geometry? geometry;
  final String? placeId;
  final String? address;

  factory LocationAddress.fromJson(Map<String, dynamic> json) => LocationAddress(
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        address: json["address"],
      );
}

class Geometry {
  Geometry({
    this.location,
    this.locationType,
    this.viewport,
  });

  final Location? location;
  final String? locationType;
  final Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] != null ? Location.fromJson(json["location"]) : null,
        locationType: json["location_type"],
        viewport: !RkValidate.nullOrEmpty(json["viewport"]) ? Viewport.fromJson(json["viewport"]) : null,
      );
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  final double? lat;
  final double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: RkNumber.parseDouble(json["lat"]),
        lng: RkNumber.parseDouble(json["lng"]),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  final Location? northeast;
  final Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );
}
