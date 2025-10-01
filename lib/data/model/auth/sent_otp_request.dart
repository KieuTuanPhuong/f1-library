import '../../../helper/rk_validate.dart';

class SentOtpRequest {
  // String? email;
  String? phone;

  SentOtpRequest({
    // this.email,
    this.phone,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    if (!RkValidate.nullOrEmpty(phone)) data['phone'] = phone;

    return data;
  }
}

class CheckAuthAccountRewardRequest {
  // String? email;
  String? phoneNumberSend;

  CheckAuthAccountRewardRequest({
    // this.email,
    this.phoneNumberSend,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    if (!RkValidate.nullOrEmpty(phoneNumberSend)) data['phone_number_send'] = phoneNumberSend;

    return data;
  }
}
