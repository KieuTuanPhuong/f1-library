import '../../../helper/rk_validate.dart';

class ForgotPasswordRequest {
  String? email;
  String? newpassword;
  // String? otp;

  ForgotPasswordRequest({
    this.newpassword,
    this.email,
    // this.otp,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(newpassword)) data['newpassword'] = newpassword;
    if (!RkValidate.nullOrEmpty(email)) data['phone'] = email;
    // if (!RkValidate.nullOrEmpty(otp)) data['otp'] = otp;

    return data;
  }
}
