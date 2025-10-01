import 'package:template/helper/rk_validate.dart';

class DetailAgencyResponse {
  String? id;
  String? agencyName;
  String? agencyCode;
  String? image;
  String? description;
  String? address;
  double? longtitude;
  double? latitude;
  String? phone;
  int? viewStatus;
  String? email;
  String? title;
  int? countStaff;
  String? manager;
  String? managerAvatar;
  String? createAt;

  DetailAgencyResponse({
    this.id,
    this.agencyName,
    this.agencyCode,
    this.image,
    this.description,
    this.address,
    this.longtitude,
    this.latitude,
    this.phone,
    this.viewStatus,
    this.email,
    this.title,
    this.countStaff,
    this.manager,
    this.managerAvatar,
    this.createAt,
  });

  factory DetailAgencyResponse.fromJson(Map<String, dynamic> json) => DetailAgencyResponse(
        id: RkValidate.parseStringFromJson(json["id"]),
        agencyName: RkValidate.parseStringFromJson(json["agency_name"]),
        agencyCode: RkValidate.parseStringFromJson(json["agency_code"]),
        image: RkValidate.parseStringFromJson(json["image"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        longtitude: RkValidate.parseDoubleFromJson(json["longtitude"]),
        latitude: RkValidate.parseDoubleFromJson(json["latitude"]),
        phone: RkValidate.parseStringFromJson(json["phone"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        email: RkValidate.parseStringFromJson(json["email"]),
        title: RkValidate.parseStringFromJson(json["title"]),
        countStaff: RkValidate.parseIntFromJson(json["count_staff"]),
        manager: RkValidate.parseStringFromJson(json["manager"]),
        managerAvatar: RkValidate.parseStringFromJson(json["manager_avatar"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
      );
}
