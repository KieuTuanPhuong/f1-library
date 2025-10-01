import '../../../helper/rk_validate.dart';
// import '../auction/auction_detail_response.dart';

class DetailProfileResponse {
  String? id;
  String? fullName;
  String? email;
  String? phone;
  String? birthday;
  int? gender;
  String? address;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? provinceName;
  String? districtName;
  String? wardName;
  String? taxCode;
  String? idNumber;
  String? idDate;
  String? idPlace;
  String? idBack;
  String? idFront;
  String? avatar;
  String? rank;
  String? balance;
  int? approveStatus;
  String? memberCode;
  String? userName;
  String? referralCode;
  String? phoneNumberSend;

  DetailProfileResponse({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.provinceName,
    this.districtName,
    this.wardName,
    this.taxCode,
    this.idNumber,
    this.idDate,
    this.idPlace,
    this.idBack,
    this.idFront,
    this.avatar,
    this.rank,
    this.balance,
    this.approveStatus,
    this.memberCode,
    this.userName,
    this.referralCode,
    this.phoneNumberSend,
  });

  factory DetailProfileResponse.fromJson(Map<String, dynamic> json) => DetailProfileResponse(
        id: RkValidate.parseStringFromJson(json["id"]),
        fullName: RkValidate.parseStringFromJson(json["full_name"]),
        email: RkValidate.parseStringFromJson(json["email"]),
        phone: RkValidate.parseStringFromJson(json["phone"]),
        birthday: RkValidate.parseStringFromJson(json["birthday"]),
        gender: RkValidate.parseIntFromJson(json["gender"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        provinceId: json["province_id"] != null ? RkValidate.parseIntFromJson(json["province_id"]) : null,
        districtId: json["district_id"] != null ? RkValidate.parseIntFromJson(json["district_id"]) : null,
        wardId: json["ward_id"] != null ? RkValidate.parseIntFromJson(json["ward_id"]) : null,
        provinceName: RkValidate.parseStringFromJson(json["province_name"]),
        districtName: RkValidate.parseStringFromJson(json["district_name"]),
        wardName: RkValidate.parseStringFromJson(json["ward_name"]),
        taxCode: RkValidate.parseStringFromJson(json["tax_code"]),
        idNumber: RkValidate.parseStringFromJson(json["id_number"]),
        idDate: RkValidate.parseStringFromJson(json["id_date"]),
        idPlace: RkValidate.parseStringFromJson(json["id_place"]),
        idBack: RkValidate.parseStringFromJson(json["id_back"]),
        idFront: RkValidate.parseStringFromJson(json["id_front"]),
        avatar: RkValidate.parseStringFromJson(json["avatar"]),
        rank: RkValidate.parseStringFromJson(json["rank"]),
        balance: RkValidate.parseStringFromJson(json["balance"]),
        approveStatus: RkValidate.parseIntFromJson(json["approve_status"]),
        memberCode: RkValidate.parseStringFromJson(json["member_code"]),
        userName: RkValidate.parseStringFromJson(json["user_name"]),
        referralCode: RkValidate.parseStringFromJson(json["referral_code"]),
        phoneNumberSend: RkValidate.parseStringFromJson(json["phone_number_send"]),
      );
}
