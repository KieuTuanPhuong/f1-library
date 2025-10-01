import '../../../helper/rk_validate.dart';

class UpdateBankInfoRequest {
  String? bankAccountName;
  String? bankAccountNumber;
  String? branch;
  int? bankId;
  String? password;

  UpdateBankInfoRequest({
    this.bankId,
    this.branch,
    this.bankAccountName,
    this.bankAccountNumber,
    this.password,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(bankAccountName)) data['bank_account_name'] = bankAccountName;
    if (!RkValidate.nullOrEmpty(bankId)) data['bank_id'] = bankId;
    if (!RkValidate.nullOrEmpty(bankAccountNumber)) data['bank_account_number'] = bankAccountNumber;
    if (!RkValidate.nullOrEmpty(branch)) data['branch'] = branch;
    if (!RkValidate.nullOrEmpty(password)) data['password'] = password;

    return data;
  }
}
