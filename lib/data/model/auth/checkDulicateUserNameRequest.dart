import '../../../helper/rk_validate.dart';

class CheckDuplicateUserNameRequest {
  String? userName;

  CheckDuplicateUserNameRequest({
    this.userName,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(userName)) data['user_name'] = userName;
    return data;
  }
}
