import '../../../helper/rk_validate.dart';
import '../paginate/paginate.dart';

class ListNewsResponse {
  List<ItemNewsResponse>? detailNewsResponse;
  Pagination? pagination;
  ListNewsResponse({
    this.detailNewsResponse,
    this.pagination,
  });

  factory ListNewsResponse.fromJson(Map<String, dynamic> json) => ListNewsResponse(
        pagination: !RkValidate.nullOrEmpty(json['pagination']) ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>) : null,
        detailNewsResponse: json["result"] == null ? [] : List<ItemNewsResponse>.from(json["result"]!.map((x) => ItemNewsResponse.fromJson(x))),
      );
}

class ItemNewsResponse {
  int? totalElement;
  String? id;
  String? title;
  String? description;
  String? category;
  String? categoryName;
  int? viewStatus;
  String? link;
  String? newsContent;
  String? image;
  String? createdBy;
  String? createAt;
  String? updatedBy;
  String? updateAt;

  ItemNewsResponse({
    this.totalElement,
    this.id,
    this.title,
    this.description,
    this.category,
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

  factory ItemNewsResponse.fromJson(Map<String, dynamic> json) => ItemNewsResponse(
        totalElement: RkValidate.parseIntFromJson(json["total_element"]),
        id: RkValidate.parseStringFromJson(json["id"]),
        title: RkValidate.parseStringFromJson(json["title"]),
        description: RkValidate.parseStringFromJson(json["description"]),
        category: RkValidate.parseStringFromJson(json["category"]),
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
