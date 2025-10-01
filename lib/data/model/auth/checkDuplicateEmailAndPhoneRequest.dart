import '../../../helper/rk_validate.dart';

class CheckDuplicateEmailAndPhoneRequest {
  String? email;
  String? phone;

  CheckDuplicateEmailAndPhoneRequest({
    this.phone,
    this.email,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(phone)) data['phone'] = email;
    if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    return data;
  }
}
