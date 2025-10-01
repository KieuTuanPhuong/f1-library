import '../../../helper/rk_validate.dart';

class RenewPostRealEstateRequest {
  String? realEstateId;
  String? rankPackage;
  String? rank;

  RenewPostRealEstateRequest({
    this.realEstateId,
    this.rankPackage,
    this.rank,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(rankPackage)) data['rank_package'] = rankPackage;
    if (!RkValidate.nullOrEmpty(rank)) data['rank'] = rank;
    if (!RkValidate.nullOrEmpty(realEstateId)) data['real_estate_id'] = realEstateId;

    return data;
  }
}
