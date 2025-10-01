import '../../../helper/rk_validate.dart';

class CheckDuplicateEmailRequest {
  String? email;

  CheckDuplicateEmailRequest({
    this.email,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    return data;
  }
}
