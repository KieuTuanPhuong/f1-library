import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../data/api_endpoint/api_endpoint.dart';
import '../../data/model/auth/checkDuplicateEmailRequest.dart';
import '../../data/model/auth/checkDuplicatePhoneRequest.dart';
import '../../data/model/auth/check_otp_request.dart';
import '../../data/model/auth/sent_otp_request.dart';
import '../../data/model/error_response/error_custom_response.dart';
import '../../data/provider/provider.dart';
import '../../helper/rk_alert.dart';
import '../../helper/rk_validate.dart';
import '../../routes/route_path/auth_routes.dart';
import '../login/login_page.dart';

enum TypeSignUp { personal, company }

class SignUpController extends GetxController with GetTickerProviderStateMixin {
  final Provider provider = Provider();
  TabController? tabController;
  List tabBarName = ["Đăng nhập bằng Email", "Đăng nhập bằng SĐT"];
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController representativeTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController rePassWordTextEditingController = TextEditingController();
  TextEditingController positionTextEditingController = TextEditingController();
  final FocusNode nodePosition = FocusNode();
  String? positionError;
  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodeRepresentative = FocusNode();
  final FocusNode nodeName = FocusNode();
  final FocusNode nodePassword = FocusNode();
  final FocusNode nodeRePassword = FocusNode();
  final FocusNode nodePhone = FocusNode();
  String? emailError;
  String? representativeError;
  String? nameError;
  String? passwordError;
  String? rePasswordError;
  String? phoneError;
  bool isObscureText = true;
  bool? isSentOTP = false;
  bool isValidatePhone = false;
  String? otp;
  int? gender = 0;
  String? name;
  String? repName;
  bool isValidateInfo = false;
  CheckDuplicatePhoneRequest checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest();
  CheckDuplicateEmailRequest checkDuplicateEmailRequest = CheckDuplicateEmailRequest();
  SentOtpRequest sentOtpRequest = SentOtpRequest();
  CheckOtpRequest checkOtpRequest = CheckOtpRequest();
  TypeSignUp? type = TypeSignUp.personal;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    isSentOTP = false;
  }

  void onCheckDuplicateEmail(String emailText) {
    checkDuplicateEmailRequest = CheckDuplicateEmailRequest(
      email: emailText,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicateEmail,
      data: checkDuplicateEmailRequest.toJson(),
      onSuccess: (data) {
        if (data["status"] != "0") {
          emailError = null;
          // onSentOtp();
        } else {
          emailError = data["message"];
        }

        update();
      },
      onError: (onError) {
        try {
          Map<String, dynamic> convertDynamicToMap(dynamic data) {
            Map<String, dynamic> convertedMap = json.decode(data);
            return convertedMap;
          }

          Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
          final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
          if (!RkValidate.nullOrEmpty(errorCustomResponse.message!)) {
            emailError = errorCustomResponse.message!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  void onValidate() {
    // phoneError = RkValidate.phone(phoneTextEditingController.text);
    emailError = RkValidate.email(emailTextEditingController.text);
  }

  void onCheckOtp() {
    checkOtpRequest = CheckOtpRequest(
      email: emailTextEditingController.text,
      otp: otp,
    );
    EasyLoading.show(status: "loading".tr);
    provider.post(
      endPoint: APIEndPoint.Check_Otp,
      data: checkOtpRequest.toJson(),
      onSuccess: (data) {
        EasyLoading.dismiss();
        isSentOTP = false;
        Get.toNamed(
          AuthRoutes.SIGN_UP_STEP_2,
          arguments: {'email': emailTextEditingController.text},
        );
        // isConfirmPassword = true;

        // if (!Get.isSnackbarOpen) {
        //   RkAlert.success(message: data['message']);
        // }
        update();
      },
      onError: (onError) {
        try {
          Map<String, dynamic> convertDynamicToMap(dynamic data) {
            Map<String, dynamic> convertedMap = json.decode(data);
            return convertedMap;
          }

          Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
          final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
          if (!RkValidate.nullOrEmpty(errorCustomResponse.error!)) {
            RkAlert.error(message: errorCustomResponse.error!);
          }
        } catch (e) {
          RkAlert.error(message: "Lỗi hệ thống ");
        }
      },
    );
    // isSentOTP = false;
    // Get.toNamed(
    //   AuthRoutes.SIGN_UP_STEP_2,
    // );
    update();
  }

  void onSentOtp() {
    onValidate();
    if (emailError == null) {
      sentOtpRequest = SentOtpRequest(
        phone: phoneTextEditingController.text,
      );
      EasyLoading.show(status: "loading".tr);
      provider.post(
        endPoint: APIEndPoint.Sent_Otp,
        data: sentOtpRequest.toJson(),
        onSuccess: (data) {
          EasyLoading.dismiss();
          isSentOTP = true;

          if (!Get.isSnackbarOpen) {
            RkAlert.success(message: data['message']);
          }
          update();
        },
        onError: (onError) {
          try {
            Map<String, dynamic> convertDynamicToMap(dynamic data) {
              Map<String, dynamic> convertedMap = json.decode(data);
              return convertedMap;
            }

            Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
            final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
            if (!RkValidate.nullOrEmpty(errorCustomResponse.error!)) {
              RkAlert.error(message: errorCustomResponse.error!);
            }
          } catch (e) {
            RkAlert.error(message: "Lỗi hệ thống ");
          }
        },
      );
      // isSentOTP = true;
    }
    update();
  }

  void onCheckDuplicatePhone(String phoneText) {
    checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest(
      phone: phoneText,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicatePhone,
      data: checkDuplicatePhoneRequest.toJson(),
      onSuccess: (data) {
        phoneError = null;
        update();
      },
      onError: (onError) {
        try {
          Map<String, dynamic> convertDynamicToMap(dynamic data) {
            Map<String, dynamic> convertedMap = json.decode(data);
            return convertedMap;
          }

          Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
          final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
          if (!RkValidate.nullOrEmpty(errorCustomResponse.error!)) {
            phoneError = errorCustomResponse.error!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  void onLogin() {
    // sl<SharedPreferenceHelper>().setLogin(status: true);
    Get.to(LoginPage());
    update();
  }

  void onValidateInfo() {
    emailError = RkValidate.email(emailTextEditingController.text);
    passwordError = RkValidate.password(passWordTextEditingController.text);
    if (passWordTextEditingController.text != rePassWordTextEditingController.text) {
      rePasswordError = "Mật khẩu nhập lại không khớp";
    } else {
      rePasswordError = RkValidate.password(rePassWordTextEditingController.text);
    }
    phoneError = RkValidate.phone(phoneTextEditingController.text);
    if (RkValidate.nullOrEmpty(nameTextEditingController.text)) {
      nameError = "Họ và tên không được để trống";
    } else {
      nameError = null;
    }

    if (RkValidate.nullOrEmpty(representativeTextEditingController.text)) {
      representativeError = "Người đại diện không được để trống";
    } else {
      representativeError = null;
    }
    if (RkValidate.nullOrEmpty(positionTextEditingController.text)) {
      positionError = "Chức vụ không được để trống";
    } else {
      positionError = null;
    }
    // if(){
    //   isValidateInfo = true;
    // }
  }

  void onSignUpStep1() {
    onValidateInfo();
    if (type == TypeSignUp.personal) {
      if (emailError == null && passwordError == null && rePasswordError == null && phoneError == null && !RkValidate.nullOrEmpty(nameTextEditingController.text)) {
        Get.toNamed(
          AuthRoutes.SIGN_UP_STEP_2,
          arguments: {
            "type": type,
            "gender": gender,
            "member_name": nameTextEditingController.text,
            "rep_name": '',
            "phone": phoneTextEditingController.text,
            "email": emailTextEditingController.text,
            "password": passWordTextEditingController.text,
          },
        );
      }
    } else {
      if (emailError == null && passwordError == null && rePasswordError == null && phoneError == null && !RkValidate.nullOrEmpty(representativeTextEditingController.text) && positionError == null) {
        Get.toNamed(
          AuthRoutes.SIGN_UP_STEP_2,
          arguments: {
            "type": type,
            "gender": gender,
            "member_name": representativeTextEditingController.text,
            "rep_name": representativeTextEditingController.text,
            "phone": phoneTextEditingController.text,
            "email": emailTextEditingController.text,
            "password": passWordTextEditingController.text,
            "position": positionTextEditingController.text,
          },
        );
      }
    }

    update();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }
}
