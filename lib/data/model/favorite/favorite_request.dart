import '../../../helper/rk_validate.dart';

class FavoriteRealEstateRequest {
  String? realEstateId;

  FavoriteRealEstateRequest({
    this.realEstateId,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(realEstateId)) data['real_estate_id'] = realEstateId;

    return data;
  }
}
