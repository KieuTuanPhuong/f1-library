import '../../../helper/rk_validate.dart';

class UpdateViewStatusRealEstateRequest {
  String? id;
  String? viewStatus;

  UpdateViewStatusRealEstateRequest({
    this.viewStatus,
    this.id,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(id)) data['id'] = id;
    if (!RkValidate.nullOrEmpty(viewStatus)) data['view_status'] = viewStatus;

    return data;
  }
}
