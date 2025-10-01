import '../../../helper/rk_validate.dart';

class RefreshTokenRequest {
  String? token;

  RefreshTokenRequest({
    this.token,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(token)) data['token'] = token;

    return data;
  }
}
