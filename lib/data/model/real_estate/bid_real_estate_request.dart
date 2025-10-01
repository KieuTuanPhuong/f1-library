import '../../../helper/rk_validate.dart';

class BidRealEstateRequest {
  String? price;
  String? realEstateId;

  BidRealEstateRequest({
    this.price,
    this.realEstateId,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(price)) data['price'] = price;
    if (!RkValidate.nullOrEmpty(realEstateId)) data['real_estate_id'] = realEstateId;

    return data;
  }
}
