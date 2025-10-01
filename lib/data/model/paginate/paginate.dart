import '../../../helper/rk_validate.dart';

class Pagination {
  int totalItems;
  int perPage;
  String currentPage;
  int totalPage;
  bool hasNextPage;
  bool hasPrevPage;
  int prePage;
  int nextPage;

  Pagination({
    this.totalItems = 0,
    this.perPage = 10,
    this.currentPage = '',
    this.totalPage = 0,
    this.hasNextPage = false,
    this.hasPrevPage = false,
    this.nextPage = 0,
    this.prePage = 0,
  });

  ///
  /// From JSON
  ///
  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      totalItems: RkValidate.parseIntFromJson(json['total_element']),
      perPage: RkValidate.parseIntFromJson(json['per_page']),
      currentPage: RkValidate.parseStringFromJson(json['page']),
      totalPage: RkValidate.parseIntFromJson(json['total_page']),
      hasNextPage: RkValidate.parseBoolFromJson(json['hasNextPage']),
      hasPrevPage: RkValidate.parseBoolFromJson(json['hasPrevPage']),
      prePage: RkValidate.parseIntFromJson(json['prePage']),
      nextPage: RkValidate.parseIntFromJson(json['nextPage']),
    );
  }
}
