import 'package:template/helper/rk_validate.dart';

import '../paginate/paginate.dart';

class ListTransactionResponse {
  Pagination? pagination;
  List<ItemTransaction>? result;

  ListTransactionResponse({
    this.pagination,
    this.result,
  });

  factory ListTransactionResponse.fromJson(Map<String, dynamic> json) => ListTransactionResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemTransaction>.from(json["result"]!.map((x) => ItemTransaction.fromJson(x))),
      );
}

class ItemTransaction {
  String? id;
  String? transactionCode;
  String? transactionContent;
  String? createAt;
  String? balance;
  int? type;
  String? successStatus;
  int? amount;
  String? realEstateCode;
  String? realEstateId;

  ItemTransaction({
    this.id,
    this.transactionCode,
    this.transactionContent,
    this.createAt,
    this.balance,
    this.type,
    this.successStatus,
    this.amount,
    this.realEstateCode,
    this.realEstateId,
  });

  factory ItemTransaction.fromJson(Map<String, dynamic> json) => ItemTransaction(
        id: RkValidate.parseStringFromJson(json["id"]),
        transactionCode: RkValidate.parseStringFromJson(json["transaction_code"]),
        transactionContent: RkValidate.parseStringFromJson(json["transaction_content"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
        balance: RkValidate.parseStringFromJson(json["balance"]),
        type: RkValidate.parseIntFromJson(json["type"]),
        successStatus: RkValidate.parseStringFromJson(json["success_status"]),
        amount: RkValidate.parseIntFromJson(json["amount"]),
        realEstateCode: RkValidate.parseStringFromJson(json["real_estate_code"]),
        realEstateId: RkValidate.parseStringFromJson(json["real_estate_id"]),
      );
}
