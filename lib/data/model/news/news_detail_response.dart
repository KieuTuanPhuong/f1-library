import 'package:template/helper/rk_validate.dart';

class NewsDetailResponse {
  String? code;
  String? id;
  String? title;
  String? description;
  String? categoryName;
  int? viewStatus;
  String? link;
  String? newsContent;
  String? image;
  String? createdBy;
  String? createAt;
  String? updatedBy;
  String? updateAt;

  NewsDetailResponse({
    this.code,
    this.id,
    this.title,
    this.description,
    this.categoryName,
    this.viewStatus,
    this.link,
    this.newsContent,
    this.image,
    this.createdBy,
    this.createAt,
    this.updatedBy,
    this.updateAt,
  });

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) => NewsDetailResponse(
        code: RkValidate.parseStringFromJson(json["code"]),
        id: RkValidate.parseStringFromJson(json["id"]),
        title: RkValidate.parseStringFromJson(json["title"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        categoryName: RkValidate.parseStringFromJson(json["category_name"]),
        viewStatus: RkValidate.parseIntFromJson(json["view_status"]),
        link: RkValidate.parseStringFromJson(json["link"]),
        newsContent: RkValidate.parseStringFromJson(json["news_content"]),
        image: RkValidate.parseStringFromJson(json["image"]),
        createdBy: RkValidate.parseStringFromJson(json["created_by"]),
        createAt: RkValidate.parseStringFromJson(json["create_at"]),
        updatedBy: RkValidate.parseStringFromJson(json["updated_by"]),
        updateAt: RkValidate.parseStringFromJson(json["update_at"]),
      );
}
