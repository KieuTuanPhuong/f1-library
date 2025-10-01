class CityResponse {
  List<DataCity>? data;

  CityResponse({this.data});

  CityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCity>[];
      json['data'].forEach((v) {
        data!.add(new DataCity.fromJson(v));
      });
    }
  }
}

class DataCity {
  int? id;
  String? name;
  String? type;

  DataCity({
    this.id,
    this.name,
    this.type,
  });

  DataCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
