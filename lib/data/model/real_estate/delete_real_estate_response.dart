import '../../../helper/rk_validate.dart';

class DeleteRealEstateRequest {
  String? id;

  DeleteRealEstateRequest({
    this.id,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(id)) data['id'] = id;

    return data;
  }
}
