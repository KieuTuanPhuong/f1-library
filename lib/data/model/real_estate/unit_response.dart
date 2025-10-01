class UnitResponse {
  String? id;
  String? name;
  int? status;
  int? isDelete;
  int? type;

  UnitResponse({
    this.id,
    this.name,
    this.status,
    this.isDelete,
    this.type,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnitResponse && other.id == id && other.name == name;
  }

  factory UnitResponse.fromJson(Map<String, dynamic> json) => UnitResponse(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        isDelete: json["is_delete"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "is_delete": isDelete,
        "type": type,
      };
}
