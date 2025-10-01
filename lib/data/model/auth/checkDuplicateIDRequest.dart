import '../../../helper/rk_validate.dart';

class CheckDuplicateIDRequest {
  String? idNumber;

  CheckDuplicateIDRequest({
    this.idNumber,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(idNumber)) data['id_number'] = idNumber;

    return data;
  }
}
