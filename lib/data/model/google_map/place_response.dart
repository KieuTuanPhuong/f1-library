import 'location_address.dart';

class PlaceResponse {
  PlaceResponse({
    this.results,
    this.status,
  });

  final List<LocationAddress>? results;
  final String? status;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) => PlaceResponse(
        results: List<LocationAddress>.from(json["results"].map((x) => LocationAddress.fromJson(x))),
        status: json["status"],
      );
}
