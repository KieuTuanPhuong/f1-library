import '../../../helper/rk_validate.dart';

class CheckDuplicateTaxRequest {
  String? taxCode;

  CheckDuplicateTaxRequest({
    this.taxCode,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(taxCode)) data['tax_code'] = taxCode;

    return data;
  }
}
