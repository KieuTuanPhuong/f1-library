import '../../../helper/rk_validate.dart';

class UpdateProfileRequest {
  String? memberName;
  String? repName;
  String? position;
  String? phone;
  String? email;
  // String? password;
  String? birthday;
  String? repAddress;
  String? memberAddress;
  String? provinceId;
  String? districtId;
  String? wardId;
  String? idNumber;
  String? idDate;
  String? idPlace;
  String? taxCode;
  String? taxDate;
  String? taxPlace;
  String? gender;
  String? idBackSide;
  String? idFrontFace;
  String? businessRegistration;
  List<String>? filePath;

  UpdateProfileRequest({
    this.memberName,
    this.repName,
    this.position,
    this.phone,
    this.email,
    // this.password,
    this.birthday,
    this.repAddress,
    this.memberAddress,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.idNumber,
    this.idDate,
    this.idPlace,
    this.taxCode,
    this.taxDate,
    this.taxPlace,
    this.gender,
    this.idBackSide,
    this.idFrontFace,
    this.businessRegistration,
    this.filePath,
  });

  Map<String, dynamic> toJson() => {
        "member_name": RkValidate.parseStringFromJson(memberName),
        "rep_name": RkValidate.parseStringFromJson(repName),
        "position": RkValidate.parseStringFromJson(position),
        "phone": RkValidate.parseStringFromJson(phone),
        "email": RkValidate.parseStringFromJson(email),
        // "password": RkValidate.parseStringFromJson(password),
        "birthday": RkValidate.parseStringFromJson(birthday),
        "rep_address": RkValidate.parseStringFromJson(repAddress),
        "member_address": RkValidate.parseStringFromJson(memberAddress),
        "province_id": RkValidate.parseStringFromJson(provinceId),
        "district_id": RkValidate.parseStringFromJson(districtId),
        "ward_id": RkValidate.parseStringFromJson(wardId),
        "id_number": RkValidate.parseStringFromJson(idNumber),
        "id_date": RkValidate.parseStringFromJson(idDate),
        "id_place": RkValidate.parseStringFromJson(idPlace),
        "tax_code": RkValidate.parseStringFromJson(taxCode),
        "tax_date": RkValidate.parseStringFromJson(taxDate),
        "tax_place": RkValidate.parseStringFromJson(taxPlace),
        "gender": RkValidate.parseStringFromJson(gender),
        "id_back_side": RkValidate.parseStringFromJson(idBackSide),
        "id_front_face": RkValidate.parseStringFromJson(idFrontFace),
        "business_registration": RkValidate.parseStringFromJson(businessRegistration),
        "file_path": filePath == null ? [] : List<String>.from(filePath!.map((x) => x)),
      };
}
