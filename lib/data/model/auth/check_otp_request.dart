import '../../../helper/rk_validate.dart';

class CheckOtpRequest {
  String? email;
  String? otp;

  CheckOtpRequest({
    this.otp,
    this.email,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(otp)) data['otp'] = otp;
    if (!RkValidate.nullOrEmpty(email)) data['phone'] = email;

    return data;
  }
}

class ValidOTPRewardRequest {
  String? email;
  String? otp;

  ValidOTPRewardRequest({
    this.otp,
    this.email,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(otp)) data['otp'] = otp;
    if (!RkValidate.nullOrEmpty(email)) data['phone'] = email;

    return data;
  }
}
