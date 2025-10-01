import '../../../helper/rk_validate.dart';

class VerifyMemberRequest {
  String? fullName;
  String? birthday;
  String? address;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? idNumber;
  String? idDate;
  String? idPlace;
  String? taxCode;
  int? gender;
  String? idFront;
  String? idBack;
  String? phone;
  String? email;

  VerifyMemberRequest({
    this.fullName,
    this.birthday,
    this.address,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.idNumber,
    this.idDate,
    this.idPlace,
    this.taxCode,
    this.gender,
    this.idFront,
    this.idBack,
    this.phone,
    this.email,
  });

  Map<String, dynamic> toJson() => {
        "full_name": RkValidate.parseStringFromJson(fullName),
        "birthday": RkValidate.parseStringFromJson(birthday),
        "address": RkValidate.parseStringFromJson(address),
        "province_id": RkValidate.parseIntFromJson(provinceId),
        "district_id": RkValidate.parseIntFromJson(districtId),
        "ward_id": RkValidate.parseIntFromJson(wardId),
        "id_number": RkValidate.parseStringFromJson(idNumber),
        "id_date": RkValidate.parseStringFromJson(idDate),
        "id_place": RkValidate.parseStringFromJson(idPlace),
        "tax_code": RkValidate.parseStringFromJson(taxCode),
        "gender": RkValidate.parseIntFromJson(gender),
        "id_front": RkValidate.parseStringFromJson(idFront),
        "id_back": RkValidate.parseStringFromJson(idBack),
        "phone": RkValidate.parseStringFromJson(phone),
        "email": RkValidate.parseStringFromJson(email),
      };
}
