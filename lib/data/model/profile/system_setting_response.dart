import 'package:template/helper/rk_validate.dart';

class General {
  String? logo;
  String? companyName;
  String? phone;
  String? address;
  String? taxCode;
  String? certificate;
  String? email;
  String? website;
  String? hotline;
  String? mailSupport;
  String? hotline2;
  General({
    this.logo,
    this.companyName,
    this.phone,
    this.address,
    this.taxCode,
    this.certificate,
    this.email,
    this.website,
    this.hotline,
    this.mailSupport,
    this.hotline2,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        logo: RkValidate.parseStringFromJson(json["logo"]),
        companyName: RkValidate.parseStringFromJson(json["company_name"]),
        phone: RkValidate.parseStringFromJson(json["phone"]),
        address: RkValidate.parseStringFromJson(json["address"]),
        taxCode: RkValidate.parseStringFromJson(json["tax_code"]),
        certificate: RkValidate.parseStringFromJson(json["certificate"]),
        email: RkValidate.parseStringFromJson(json["email"]),
        website: RkValidate.parseStringFromJson(json["website"]),
        hotline: RkValidate.parseStringFromJson(json["hotline"]),
        mailSupport: RkValidate.parseStringFromJson(json["mail_support"]),
        hotline2: RkValidate.parseStringFromJson(json["hotline2"]),
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "company_name": companyName,
        "phone": phone,
        "address": address,
        "tax_code": taxCode,
        "certificate": certificate,
        "email": email,
        "website": website,
        "hotline": hotline,
        "mail_support": mailSupport,
      };
}

class PopupBanner {
  String? popupBanner;
  String? linkUrl;
  String? time;

  PopupBanner({
    this.popupBanner,
    this.linkUrl,
    this.time,
  });

  factory PopupBanner.fromJson(Map<String, dynamic> json) => PopupBanner(
        popupBanner: RkValidate.parseStringFromJson(json["popup_banner"]),
        linkUrl: RkValidate.parseStringFromJson(json["link_url"]),
        time: RkValidate.parseStringFromJson(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "popup_banner": popupBanner,
        "link_url": linkUrl,
        "time": time,
      };
}

class CategoryImage {
  String? land;
  String? sale;
  String? rent;
  String? project;

  CategoryImage({
    this.land,
    this.sale,
    this.rent,
    this.project,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) => CategoryImage(
        land: RkValidate.parseStringFromJson(json["land"]),
        sale: RkValidate.parseStringFromJson(json["sale"]),
        rent: RkValidate.parseStringFromJson(json["rent"]),
        project: RkValidate.parseStringFromJson(json["project"]),
      );

  Map<String, dynamic> toJson() => {
        "land": land,
        "sale": sale,
        "rent": rent,
        "project": project,
      };
}

class HomeBanner {
  String? homeBanner;

  HomeBanner({
    this.homeBanner,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        homeBanner: RkValidate.parseStringFromJson(json["home_banner"]),
      );

  Map<String, dynamic> toJson() => {
        "home_banner": homeBanner,
      };
}

class VersionApp {
  String? appIos;
  String? appAndroid;

  VersionApp({this.appIos, this.appAndroid});

  VersionApp.fromJson(Map<String, dynamic> json) {
    appIos = RkValidate.parseStringFromJson(json['app_ios']);
    appAndroid = RkValidate.parseStringFromJson(json['app_android']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_ios'] = this.appIos;
    data['app_android'] = this.appAndroid;
    return data;
  }
}
