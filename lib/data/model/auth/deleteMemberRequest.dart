import '../../../helper/rk_validate.dart';

class DeleteMemberRequest {
  String? password;

  DeleteMemberRequest({
    this.password,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(password)) data['password'] = password;

    return data;
  }
}
