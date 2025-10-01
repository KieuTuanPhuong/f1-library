import '../../../helper/rk_validate.dart';

class AuthRequest {
  String? email;
  String? password;
  String? deviceToken;
  String? deviceName;
  String? userName;

  AuthRequest({
    this.password,
    this.email,
    this.deviceToken,
    this.deviceName,
    this.userName,
  }) : super();

  factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        userName: RkValidate.parseStringFromJson(json["user_name"]),
        password: RkValidate.parseStringFromJson(json["password"]),
        email: RkValidate.parseStringFromJson(json["user_name"]),
        deviceToken: RkValidate.parseStringFromJson(json["deviceToken"]),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(password)) data['password'] = password;
    if (!RkValidate.nullOrEmpty(email)) data['user_name'] = email;
    if (!RkValidate.nullOrEmpty(deviceToken)) data['deviceToken'] = deviceToken;
    if (!RkValidate.nullOrEmpty(deviceName)) data['device_name'] = deviceName;
    if (!RkValidate.nullOrEmpty(userName)) data['user_name'] = userName;

    return data;
  }
}
