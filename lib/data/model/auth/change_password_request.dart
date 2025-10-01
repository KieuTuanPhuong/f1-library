import '../../../helper/rk_validate.dart';

class ChangePasswordRequest {
  String? oldPassword;
  String? newPassword;

  ChangePasswordRequest({this.newPassword, this.oldPassword}) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(oldPassword)) data['oldpassword'] = oldPassword;
    if (!RkValidate.nullOrEmpty(newPassword)) data['newpassword'] = newPassword;

    return data;
  }
}
