import '../../../helper/rk_validate.dart';
import 'create_post_real_estate_request.dart';
import 'list_real_estate_response.dart';

class DetailRealEstateResponse {
  int? type;
  String? categoryId;
  String? categoryName;
  String? agencyId;
  String? agencyName;
  String? address;
  double? longtitude;
  double? latitude;
  double? acreage;
  String? price;
  String? realEstateName;
  String? video;
  String? videoThumbnail;
  String? broker;
  String? brokerName;
  int? unitId;
  String? unitName;
  int? publishStatus;
  String? createAt;
  String? createBy;
  String? updateAt;
  String? updateBy;
  String? approveAt;
  String? approveBy;
  int? rank;
  String? projectId;
  String? projectName;
  int? viewStatus;
  int? status;
  int? wardId;
  int? districtId;
  int? provinceId;
  String? wardName;
  String? districtName;
  String? provinceName;
  String? description;
  int? realEstateStatus;
  int? newsStatus;
  String? design;
  String? fee;
  String? feeId;
  String? day;
  String? startDate;
  String? endDate;
  String? posterName;
  String? posterAvatar;
  JuridicalFile? juridicalFile;
  String? juridicalId;
  String? juridicalName;
  List<ImageRealEstateRequest>? image;
  List<String>? designImage;
  List<DescribeDetail>? describe;
  int? favorite;
  int? countPayment;
  String? paymentPrice;
  int? paymentStatus;
  int? posterStatus;
  String? countView;
  String? brokerAvatar;
  String? brokerPhone;
  String? brokerEmail;
  String? saleAvatar;
  String? salePhone;
  String? saleEmail;
  String? saleName;
  String? realEstateCode;
  double? wardLongtitude;
  double? wardLatitude;
  double? commission;
  String? posterPhone;
  int? posterType;

  DetailRealEstateResponse({
    this.type,
    this.categoryId,
    this.categoryName,
    this.agencyId,
    this.agencyName,
    this.address,
    this.longtitude,
    this.latitude,
    this.acreage,
    this.price,
    this.realEstateName,
    this.video,
    this.videoThumbnail,
    this.broker,
    this.brokerName,
    this.unitId,
    this.unitName,
    this.publishStatus,
    this.createAt,
    this.createBy,
    this.updateAt,
    this.updateBy,
    this.approveAt,
    this.approveBy,
    this.rank,
    this.projectId,
    this.projectName,
    this.viewStatus,
    this.status,
    this.wardId,
    this.districtId,
    this.provinceId,
    this.wardName,
    this.districtName,
    this.provinceName,
    this.description,
    this.realEstateStatus,
    this.newsStatus,
    this.design,
    this.fee,
    this.feeId,
    this.day,
    this.startDate,
    this.endDate,
    this.posterName,
    this.posterAvatar,
    this.juridicalFile,
    this.juridicalId,
    this.juridicalName,
    this.image,
    this.designImage,
    this.describe,
    this.favorite,
    this.countPayment,
    this.paymentPrice,
    this.paymentStatus,
    this.posterStatus,
    this.brokerAvatar,
    this.brokerEmail,
    this.brokerPhone,
    this.countView,
    this.saleAvatar,
    this.saleEmail,
    this.saleName,
    this.salePhone,
    this.realEstateCode,
    this.wardLatitude,
    this.wardLongtitude,
    this.commission,
    this.posterPhone,
    this.posterType,
  });

  factory DetailRealEstateResponse.fromJson(Map<String, dynamic> json) => DetailRealEstateResponse(
        type: RkValidate.parseIntFromJson(json["type"]),
        categoryId: RkValidate.parseStringFromJson(json["category_id"]),
        categoryName: RkValidate.parseStringFromJson(json["category_name"]),
        agencyId: RkValidate.parseStringFromJson(json["agency_id"]),
        agencyName: RkValidate.parseStringFromJson(json["agency_name"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        longtitude: !RkValidate.nullOrEmpty(json["longtitude"]) ? RkValidate.parseDoubleFromJson(json["longtitude"]) : null,
        latitude: !RkValidate.nullOrEmpty(json["latitude"]) ? RkValidate.parseDoubleFromJson(json["latitude"]) : null,
        acreage: RkValidate.parseDoubleFromJson(json["acreage"]),
        price: RkValidate.parseStringFromJson(json["price"]),
        realEstateName: RkValidate.parseStringFromJson(json["real_estate_name"]),
        video: RkValidate.parseStringFromJson(json["video"]),
        videoThumbnail: RkValidate.parseStringFromJson(json["video_thumbnail"]),
        broker: RkValidate.parseStringFromJson(json["broker"]),
        brokerName: RkValidate.parseStringFromJson(json["broker_name"]),
        unitId: RkValidate.parseIntFromJson(json["unit_id"]),
        unitName: RkValidate.parseStringFromJson(json["unit_name"]),
        publishStatus: RkValidate.parseIntFromJson(json["publish_status"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
        createBy: RkValidate.parseStringFromJson(json["create_by"]),
        updateAt: RkValidate.parseStringFromJson(json["update_at"]),
        updateBy: RkValidate.parseStringFromJson(json["update_by"]),
        approveAt: RkValidate.parseStringFromJson(json["approve_at"]),
        approveBy: RkValidate.parseStringFromJson(json["approve_by"]),
        rank: RkValidate.parseIntFromJson(json["rank"]),
        projectId: RkValidate.parseStringFromJson(json["project_id"]),
        projectName: RkValidate.parseStringFromJson(json["project_name"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        status: RkValidate.parseIntFromJson(json["status"]),
        wardId: RkValidate.parseIntFromJson(json["ward_id"]),
        districtId: RkValidate.parseIntFromJson(json["district_id"]),
        provinceId: RkValidate.parseIntFromJson(json["province_id"]),
        wardName: RkValidate.parseStringFromJson(json["ward_name"]),
        districtName: RkValidate.parseStringFromJson(json["district_name"]),
        provinceName: RkValidate.parseStringFromJson(json["province_name"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        realEstateStatus: RkValidate.parseIntFromJson(json["real_estate_status"]),
        newsStatus: RkValidate.parseIntFromJson(json["news_status"]),
        design: RkValidate.parseStringFromJson(json["design"]),
        fee: RkValidate.parseStringFromJson(json["fee"]),
        feeId: RkValidate.parseStringFromJson(json["fee_id"]),
        day: RkValidate.parseStringFromJson(json["day"]),
        startDate: RkValidate.parseStringFromJson(json["start_date"]),
        endDate: RkValidate.parseStringFromJson(json["end_date"]),
        posterName: RkValidate.parseStringFromJson(json["poster_name"]),
        posterAvatar: RkValidate.parseStringFromJson(json["poster_avatar"]),
        juridicalFile: !RkValidate.nullOrEmpty(json['juridical_file']) ? JuridicalFile.fromJson(json['juridical_file'] as Map<String, dynamic>) : null,
        juridicalId: RkValidate.parseStringFromJson(json["juridical_id"]),
        juridicalName: RkValidate.parseStringFromJson(json["juridical_name"]),
        image: json["image"] == null ? [] : List<ImageRealEstateRequest>.from(json["image"]!.map((x) => ImageRealEstateRequest.fromJson(x))),
        designImage: json["design_image"] == null ? [] : List<String>.from(json["design_image"]!.map((x) => x)),
        describe: json["describe"] == null ? [] : List<DescribeDetail>.from(json["describe"]!.map((x) => DescribeDetail.fromJson(x))),
        favorite: RkValidate.parseIntFromJson(json["favorite"]),
        paymentStatus: RkValidate.parseIntFromJson(json["payment_status"]),
        paymentPrice: RkValidate.parseStringFromJson(json["payment_price"]),
        countPayment: RkValidate.parseIntFromJson(json["count_payment"]),
        posterStatus: RkValidate.parseIntFromJson(json["poster_status"]),
        brokerAvatar: RkValidate.parseStringFromJson(json["broker_avatar"]),
        brokerPhone: RkValidate.parseStringFromJson(json["broker_phone"]),
        countView: RkValidate.parseStringFromJson(json["count_view"]),
        brokerEmail: RkValidate.parseStringFromJson(json["broker_email"]),
        saleName: RkValidate.parseStringFromJson(json["sale_name"]),
        salePhone: RkValidate.parseStringFromJson(json["sale_phone"]),
        saleEmail: RkValidate.parseStringFromJson(json["sale_email"]),
        saleAvatar: RkValidate.parseStringFromJson(json["sale_avatar"]),
        realEstateCode: RkValidate.parseStringFromJson(json["real_estate_code"]),
        wardLongtitude: !RkValidate.nullOrEmpty(json["ward_longtitude"]) ? RkValidate.parseDoubleFromJson(json["ward_longtitude"]) : null,
        wardLatitude: !RkValidate.nullOrEmpty(json["ward_latitude"]) ? RkValidate.parseDoubleFromJson(json["ward_latitude"]) : null,
        commission: !RkValidate.nullOrEmpty(json["commission"]) ? RkValidate.parseDoubleFromJson(json["commission"]) : null,
        posterType: RkValidate.parseIntFromJson(json["poster_type"]),
        posterPhone: RkValidate.parseStringFromJson(json["poster_phone"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "category_id": categoryId,
        "category_name": categoryName,
        "agency_id": agencyId,
        "agency_name": agencyName,
        "address": address,
        "longtitude": longtitude,
        "latitude": latitude,
        "acreage": acreage,
        "price": price,
        "real_estate_name": realEstateName,
        "video": video,
        "video_thumbnail": videoThumbnail,
        "broker": broker,
        "broker_name": brokerName,
        "unit_id": unitId,
        "unit_name": unitName,
        "publish_status": publishStatus,
        "create_at": createAt,
        "create_by": createBy,
        "update_at": updateAt,
        "update_by": updateBy,
        "approve_at": approveAt,
        "approve_by": approveBy,
        "rank": rank,
        "project_id": projectId,
        "project_name": projectName,
        "view_status": viewStatus,
        "status": status,
        "ward_id": wardId,
        "district_id": districtId,
        "province_id": provinceId,
        "ward_name": wardName,
        "district_name": districtName,
        "province_name": provinceName,
        "description": description,
        "real_estate_status": realEstateStatus,
        "news_status": newsStatus,
        "design": design,
        "fee": fee,
        "fee_id": feeId,
        "day": day,
        "start_date": startDate,
        "end_date": endDate,
        "poster_name": posterName,
        "poster_avatar": posterAvatar,
        "juridical_file": juridicalFile?.toJson(),
        "juridical_id": juridicalId,
        "juridical_name": juridicalName,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "design_image": designImage == null ? [] : List<dynamic>.from(designImage!.map((x) => x)),
        "describe": describe == null ? [] : List<dynamic>.from(describe!.map((x) => x.toJson())),
      };
}
