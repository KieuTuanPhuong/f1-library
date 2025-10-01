import 'package:dio/dio.dart';

class ApiResponse {
  Response? response;
  dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        // ignore: prefer_initializing_formals
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      // ignore: prefer_initializing_formals
      : response = responseValue,
        error = null;
}
