import 'package:template/helper/rk_validate.dart';

class TransactionContentResponse {
  String? transactionContent;
  String? code;

  TransactionContentResponse({
    this.transactionContent,
    this.code,
  });

  factory TransactionContentResponse.fromJson(Map<String, dynamic> json) => TransactionContentResponse(
        transactionContent: RkValidate.parseStringFromJson(json["transaction_content"]),
        code: RkValidate.parseStringFromJson(json["code"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_content": transactionContent,
        "code": code,
      };
}
