import '../../../helper/rk_validate.dart';

class AddReferralCodeRequest {
  String? referralCode;

  AddReferralCodeRequest({
    this.referralCode,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    !RkValidate.nullOrEmpty(referralCode) ? data['referral_code'] = referralCode : data['referral_code'] = "";

    return data;
  }
}
