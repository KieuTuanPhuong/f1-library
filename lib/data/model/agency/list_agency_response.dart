import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListAgencyResponse {
  Pagination? pagination;
  List<ItemAgency>? result;

  ListAgencyResponse({
    this.pagination,
    this.result,
  });

  factory ListAgencyResponse.fromJson(Map<String, dynamic> json) => ListAgencyResponse(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        result: json["result"] == null ? [] : List<ItemAgency>.from(json["result"]!.map((x) => ItemAgency.fromJson(x))),
      );
}

class ItemAgency {
  String? id;
  String? agencyName;
  String? agencyCode;
  String? address;
  String? image;
  String? manage;
  int? countStaff;
  String? phone;
  int? viewStatus;

  ItemAgency({
    this.id,
    this.agencyName,
    this.agencyCode,
    this.address,
    this.image,
    this.manage,
    this.countStaff,
    this.phone,
    this.viewStatus,
  });

  factory ItemAgency.fromJson(Map<String, dynamic> json) => ItemAgency(
        id: RkValidate.parseStringFromJson(json["id"]),
        agencyName: RkValidate.parseStringFromJson(json["agency_name"]),
        agencyCode: RkValidate.parseStringFromJson(json["agency_code"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        image: RkValidate.parseStringFromJson(json["image"]),
        manage: RkValidate.parseStringFromJson(json["manage"]),
        countStaff: RkValidate.parseIntFromJson(json["count_staff"]),
        phone: RkValidate.parseStringFromJson(json["phone"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
      );
}
