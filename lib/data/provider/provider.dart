import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:template/data/base/api_response.dart';
import 'package:template/data/datasource/remote/dio/dio_client.dart';
import 'package:template/data/datasource/remote/exception/api_error_handler.dart';
import 'package:template/helper/rk_validate.dart';
import 'package:template/utils/app_constants.dart';

enum RkMethod {
  GET,
  ADD,
  POST,
  UPDATE,
  DELETE,
  PAGINATE,
  FIND,
  UPLOAD_FILE,
  UPLOAD_AVATAR,
  AUTO_PREDICTION,
}

class Provider<T> {
  final DioClient? dioClient = GetIt.I.get<DioClient>();

  String getEndPoint(dynamic typeModel) {
    // if (typeModel.runtimeType == QuestionResponse) {
    //   return 'states';
    // } else if (typeModel.runtimeType == ListCourseResponse) {
    //   return 'vehicles';
    // } else if (typeModel.runtimeType == CourseResponse) {
    //   return 'categories';
    // }
    return 'states';
  }

  Future<void> uploadImage({
    required File image,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    required String endPoint,
  }) async {
    final file = await MultipartFile.fromFile(image.path.toString());
    final FormData formData = FormData.fromMap({'files': file});
    final ApiResponse apiResponse = await getReponstory(
      method: RkMethod.ADD,
      endPoint: endPoint,
      data: formData,
    );
    if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response!.data as dynamic;
      if (!RkValidate.nullOrEmpty(results['data']['file'])) {
        onSuccess(results['data']['file'][0].toString());
      } else {
        onError('Cannot get url image');
      }
    } else {
      onError(apiResponse.error);
    }
  }

  FormData getFormData(dynamic data) {
    final FormData formData = FormData.fromMap(data as Map<String, dynamic>);
    return formData;
  }

  Future<ApiResponse> getReponstory({
    required RkMethod method,
    required String endPoint,
    dynamic data,
    int? page,
    int? limit,
    String? filter,
    String? id,
  }) async {
    Response<dynamic>? response;
    String url = '$BASE_URL/$endPoint';
    print('WILL CALL: $url');
    if (method == RkMethod.PAGINATE) {
      if (filter!.isEmpty) {
        url += '?page=$page&limit=$limit';
      } else {
        url += '?page=$page&limit=$limit$filter';
      }
    } else if (method == RkMethod.DELETE || method == RkMethod.FIND) {
      // if (id!.isNotEmpty) {
      //   url += '/$id';
      // }
    } else if (method == RkMethod.AUTO_PREDICTION) {
      url = endPoint;
    }
    try {
      if (method == RkMethod.GET) {
        if (!RkValidate.nullOrEmpty(dioClient)) {
          response = await dioClient!.get(url);
        }
      } else if (method == RkMethod.ADD || method == RkMethod.POST || method == RkMethod.UPLOAD_FILE) {
        if (!RkValidate.nullOrEmpty(dioClient) && !RkValidate.nullOrEmpty(data)) {
          response = await dioClient!.post(url, data: data);
        }
      } else if (method == RkMethod.UPDATE || method == RkMethod.UPLOAD_AVATAR) {
        if (!RkValidate.nullOrEmpty(dioClient) && !RkValidate.nullOrEmpty(data)) {
          response = await dioClient!.put(url, data: data);
        }
      } else if (method == RkMethod.DELETE) {
        if (!RkValidate.nullOrEmpty(dioClient)) {
          response = await dioClient!.delete(url, data: data);
        }
      } else if (method == RkMethod.PAGINATE) {
        if (!RkValidate.nullOrEmpty(dioClient)) {
          response = await dioClient!.get(url);
        }
      } else if (method == RkMethod.FIND) {
        if (!RkValidate.nullOrEmpty(dioClient)) {
          response = await dioClient!.get(url);
        } else if (method == RkMethod.UPLOAD_AVATAR) {
          if (!RkValidate.nullOrEmpty(dioClient) && !RkValidate.nullOrEmpty(data)) {
            response = await dioClient!.uploadAvatar(url, data: data);
          }
        }
      } else if (method == RkMethod.UPLOAD_FILE) {
        if (!RkValidate.nullOrEmpty(dioClient) && !RkValidate.nullOrEmpty(data)) {
          response = await dioClient!.uploadFile(url, data: data);
        }
      } else if (method == RkMethod.AUTO_PREDICTION) {
        if (!RkValidate.nullOrEmpty(dioClient)) {
          response = await dioClient!.get(endPoint);
        }
      }

      if (!RkValidate.nullOrEmpty(response)) {
        print("API: $url => $response");

        return ApiResponse.withSuccess(response!);
      }

      EasyLoading.dismiss();
      return ApiResponse.withError("No value");
    } catch (e) {
      EasyLoading.dismiss();
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> put({
    required T data,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    bool? bodyIsFormData = false,
    RkMethod? method = RkMethod.UPDATE,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: method!,
      endPoint: endPoint ?? getEndPoint(data),
      data: bodyIsFormData == true ? getFormData(data) : data,
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> get({
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    RkMethod? method = RkMethod.GET,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: method!,
      endPoint: endPoint ?? '',
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> autoPrediction({
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    RkMethod? method = RkMethod.AUTO_PREDICTION,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: method!,
      endPoint: endPoint ?? '',
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> post({
    required T data,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    bool? bodyIsFormData = false,
    RkMethod? method = RkMethod.POST,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: method!,
      endPoint: endPoint ?? getEndPoint(data),
      data: bodyIsFormData == true ? getFormData(data) : data,
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> uploadFile({
    required T data,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    bool? bodyIsFormData = false,
    RkMethod? method = RkMethod.UPLOAD_FILE,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: method!,
      endPoint: endPoint ?? getEndPoint(data),
      data: bodyIsFormData == true ? getFormData(data) : data,
    );
    if (apiResponse.response != null && apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> delete({
    T? data,
    required Function(dynamic) onSuccess,
    required Function(dynamic error) onError,
    bool? bodyIsFormData = false,
    String? endPoint,
  }) async {
    final ApiResponse apiResponse = await getReponstory(
      method: RkMethod.DELETE,
      endPoint: endPoint ?? getEndPoint(data),
      data: bodyIsFormData == true ? getFormData(data) : data,
    );
    if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response!.data as dynamic;
      onSuccess(results);
    } else {
      onError(apiResponse.error);
    }
  }

// dynamic getModel(dynamic typeModel, {required dynamic data}) {
//   if (typeModel.runtimeType == QuestionResponse) {
//     return QuestionResponse.fromJson(data as Map<String, dynamic>);
//   } else if (typeModel.runtimeType == ListCourseResponse) {
//     return ListCourseResponse.fromJson(data as Map<String, dynamic>);
//   } else if (typeModel.runtimeType == AuthRequest) {
//     return AuthRequest.fromJson(data as Map<String, dynamic>);
//   } else if (typeModel.runtimeType == AuthResponse) {
//     return AuthResponse.fromJson(data as Map<String, dynamic>);
//   } else if (typeModel.runtimeType == CourseResponse) {
//     return CourseResponse.fromJson(data as Map<String, dynamic>);
//     // } else if (typeModel.runtimeType == QuestionResponse) {
//     //   return QuestionResponse.fromJson(data as Map<String, dynamic>);
//     // } else if (typeModel.runtimeType == ConverstationRequest || typeModel.runtimeType == ConversationResponse) {
//     //   return ConverstationRequest.fromJson(data as Map<String, dynamic>);
//     // } else if (typeModel.runtimeType == ContestsResponse || typeModel.runtimeType == ContestsRequest) {
//     //   return ContestsRequest.fromJson(data as Map<String, dynamic>);
//   }
//   return T;
// }

// Future<void> call({
//   required RkMethod method,
//   required T typeModel,
//   String? endPoint,
//   int? page = 1,
//   int? limit = 10,
//   String? filter = '',
//   String? id = '',
//   T? data,
//   required Function(List<T> data) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: method,
//     endPoint: endPoint ?? getEndPoint(typeModel),
//     page: page,
//     limit: limit,
//     filter: filter,
//     id: id,
//     data: data,
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     List<dynamic> results = [];
//     if (apiResponse.response!.data['data'].runtimeType == List) {
//       results = apiResponse.response!.data['data'] as List<dynamic>;
//     } else {
//       results = [apiResponse.response!.data['data'] as Map<String, dynamic>];
//     }
//     onSuccess(results.map((e) => getModel(typeModel, data: e)).toList().cast<T>());
//   } else {
//     onError(apiResponse.error);
//   }
// }

// Future<void> all(
//   T typeModel, {
//   required Function(List<T> data) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: RkMethod.GET,
//     endPoint: getEndPoint(typeModel),
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     // call back data success
//     List<dynamic> results = [];
//     if (apiResponse.response!.data['data'].runtimeType == List) {
//       results = apiResponse.response!.data['data'] as List;
//     } else {
//       results = [apiResponse.response!.data['data'] as Map<String, dynamic>];
//     }
//     onSuccess(results.map((e) => getModel(typeModel, data: e)).toList().cast<T>());
//   } else {
//     onError(apiResponse.error);
//   }
// }
//
// Future<void> add(
//   T typeModel, {
//   required T requestBody,
//   required Function(T data) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: RkMethod.ADD,
//     endPoint: getEndPoint(typeModel),
//     data: requestBody,
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     // call back data success
//     final results = apiResponse.response!.data['data'] as dynamic;
//     onSuccess(getModel(typeModel, data: results) as T);
//   } else {
//     onError(apiResponse.error);
//   }
// }
//
// Future<void> update(
//   T typeModel, {
//   required T requestBody,
//   required Function(T data) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: RkMethod.UPDATE,
//     endPoint: getEndPoint(typeModel),
//     data: requestBody,
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     // call back data success
//     final results = apiResponse.response!.data['data'] as dynamic;
//     onSuccess(getModel(typeModel, data: results) as T);
//   } else {
//     onError(apiResponse.error);
//   }
// }
//

//
// Future<void> paginate(
//   T typeModel, {
//   required int page,
//   required int limit,
//   required String filter,
//   required Function(List<T> bangGiaDonHangs) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: RkMethod.PAGINATE,
//     endPoint: getEndPoint(typeModel),
//     page: page,
//     limit: limit,
//     filter: filter,
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     // call back data success
//     final results = apiResponse.response!.data.toString() != '[]' ? apiResponse.response!.data['data'] as List<dynamic> : [];
//     onSuccess(results.map((e) => getModel(typeModel, data: e)).toList().cast<T>());
//   } else {
//     onError(apiResponse.error);
//   }
// }
//
// Future<void> findOne(
//   T typeModel, {
//   required String id,
//   required Function(T data) onSuccess,
//   required Function(dynamic error) onError,
// }) async {
//   final ApiResponse apiResponse = await getReponstory(
//     method: RkMethod.FIND,
//     endPoint: getEndPoint(typeModel),
//     id: id,
//   );
//   if (apiResponse.response!.statusCode! >= 200 && apiResponse.response!.statusCode! <= 300) {
//     // call back data success
//     final results = apiResponse.response!.data as dynamic;
//     onSuccess(getModel(typeModel, data: results) as T);
//   } else {
//     onError(apiResponse.error);
//   }
// }
}
