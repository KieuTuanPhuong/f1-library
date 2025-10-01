import '../../../helper/rk_validate.dart';

class ListBankResponse {
  List<Bank>? bank;

  ListBankResponse({
    this.bank,
  });

  factory ListBankResponse.fromJson(Map<String, dynamic> json) => ListBankResponse(
        bank: json["bank"] == null ? [] : List<Bank>.from(json["bank"]!.map((x) => Bank.fromJson(x))),
      );
}

class Bank {
  String? code;
  int? id;
  String? name;
  String? shortName;

  Bank({
    this.code,
    this.id,
    this.name,
    this.shortName,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        code: RkValidate.parseStringFromJson(json["code"]),
        id: RkValidate.parseIntFromJson(json["id"]),
        name: RkValidate.parseStringFromJson(json["name"]),
        shortName: RkValidate.parseStringFromJson(json["shortName"]),
      );
}
