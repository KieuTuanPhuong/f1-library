import '../../../helper/rk_validate.dart';

class SignUpRequest {
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? birthday;
  int? gender;
  String? address;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? userName;
  String? referralCode;

  SignUpRequest({
    this.phone,
    this.email,
    this.password,
    this.birthday,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.gender,
    this.fullName,
    this.address,
    this.userName,
    this.referralCode,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(password)) data['password'] = password;
    if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    if (!RkValidate.nullOrEmpty(fullName)) data['full_name'] = fullName;
    if (!RkValidate.nullOrEmpty(address)) data['address'] = address;
    if (!RkValidate.nullOrEmpty(phone)) data['phone'] = phone;
    if (!RkValidate.nullOrEmpty(birthday)) data['birthday'] = birthday;
    if (!RkValidate.nullOrEmpty(provinceId)) data['province_id'] = provinceId;
    if (!RkValidate.nullOrEmpty(districtId)) data['district_id'] = districtId;
    if (!RkValidate.nullOrEmpty(wardId)) data['ward_id'] = wardId;
    if (!RkValidate.nullOrEmpty(gender)) data['gender'] = gender;
    if (!RkValidate.nullOrEmpty(userName)) data['user_name'] = userName;
    !RkValidate.nullOrEmpty(referralCode) ? data['referral_code'] = referralCode : data['referral_code'] = "";

    return data;
  }
}
