import '../../../helper/rk_validate.dart';

class CheckDuplicatePhoneRequest {
  String? phone;

  CheckDuplicatePhoneRequest({
    this.phone,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(phone)) data['phone'] = phone;
    return data;
  }
}
