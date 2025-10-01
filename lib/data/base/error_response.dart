import 'package:template/helper/rk_validate.dart';

/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]

class ErrorResponse {
  late List<Errors> _errors;

  List<Errors> get errors => _errors;

  ErrorResponse({required List<Errors> errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    _errors = [];
    json['errors'].forEach((v) {
      _errors.add(Errors.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errors'] = _errors.map((v) => v.toJson()).toList();
    return map;
  }
}

/// code : "l_name"
/// message : "The last name field is required."

class Errors {
  late String _code;
  late String _message;
  late int _logoutStatus;

  String get code => _code;
  String get message => _message;
  int get logoutStatus => _logoutStatus;

  Errors({required String code, required String message, int? logoutStatus}) {
    _code = code;
    _message = message;
    _logoutStatus = logoutStatus!;
  }

  Errors.fromJson(dynamic json) {
    if (json.runtimeType != Map<String, dynamic>.from({}).runtimeType || (RkValidate.nullOrEmpty(json['errors']))) {
      _code = 'Unknown error';
      _message = 'Unknown error';
      _logoutStatus = 0;
    } else {
      _code = json['code'].toString();
      _logoutStatus = RkValidate.parseIntFromJson(['logout_status']);
      final errors = json['errors'] as List;
      if (errors.isNotEmpty) {
        _logoutStatus = RkValidate.parseIntFromJson(['logout_status']);
        _message = errors.first['detail'].toString();
      } else {
        _message = 'Unknown error';
      }
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }
}
