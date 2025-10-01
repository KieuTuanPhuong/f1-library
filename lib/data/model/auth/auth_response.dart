import '../../../helper/rk_validate.dart';

class AuthResponse {
  String? id;
  String? member_code;
  String? accessToken;
  String? refreshToken;

  AuthResponse({
    this.id,
    this.accessToken,
    this.refreshToken,
    this.member_code,
  });

  AuthResponse.fromJson(Map<String, dynamic> json) {
    id = !RkValidate.nullOrEmpty(json['userData']['accessToken']) ? (json['userData']['id']).toString() : null;
    member_code = !RkValidate.nullOrEmpty(json['userData']['accessToken']) ? (json['userData']['member_code']).toString() : null;
    accessToken = !RkValidate.nullOrEmpty(json['userData']['accessToken']) ? json['userData']['accessToken'].toString() : null;
    refreshToken = !RkValidate.nullOrEmpty(json['userData']['refreshToken']) ? json['userData']['refreshToken'].toString() : null;
  }
}
