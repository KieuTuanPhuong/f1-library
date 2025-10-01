import '../../../helper/rk_validate.dart';

class CreateTransactionRequest {
  String? code;
  String? amount;

  CreateTransactionRequest({
    this.code,
    this.amount,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(code)) data['code'] = code;
    if (!RkValidate.nullOrEmpty(amount)) data['amount'] = amount;

    return data;
  }
}
