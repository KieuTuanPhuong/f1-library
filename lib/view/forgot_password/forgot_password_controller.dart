import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:template/data/model/auth/check_otp_request.dart';
import 'package:template/data/model/auth/sent_otp_request.dart';

import '../../data/api_endpoint/api_endpoint.dart';
import '../../data/model/auth/checkDuplicatePhoneRequest.dart';
import '../../data/model/auth/forgot_password_request.dart';
import '../../data/model/error_response/error_custom_response.dart';
import '../../data/provider/provider.dart';
import '../../helper/rk_alert.dart';
import '../../helper/rk_validate.dart';

class ForgotPasswordController extends GetxController with GetSingleTickerProviderStateMixin {
  final Provider provider = Provider();
  SentOtpRequest sentOtpRequest = SentOtpRequest();
  CheckOtpRequest checkOtpRequest = CheckOtpRequest();
  ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  TextEditingController rePassWordTextEditingController = TextEditingController();
  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodePhone = FocusNode();
  final FocusNode nodePassword = FocusNode();
  final FocusNode nodeRePassword = FocusNode();
  String? emailError;
  String? phoneError;
  String? passwordError;
  String? rePasswordError;
  bool isObscureText = true;
  bool? isSentOTP;
  bool isConfirmPassword = false;
  String? otp;
  Encrypter? encrypter;
  Encrypted? encrypted;
  String? decrypted;
  RSAPublicKey? publicKey;
  RSAPrivateKey? privateKey;
  CheckDuplicatePhoneRequest checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest();

  @override
  void onInit() {
    super.onInit();

    isSentOTP = false;
    generateSignature();
  }

  void onCheckDuplicatePhone(String phoneText) {
    phoneError = RkValidate.phone(phoneTextEditingController.text);
    // if(!RkValidate.nullOrEmpty(phoneError)){
    //
    // }
    if (phoneError == null) {
      checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest(
        phone: phoneTextEditingController.text,
      );
      provider.post(
        endPoint: APIEndPoint.checkDuplicatePhone,
        data: checkDuplicatePhoneRequest.toJson(),
        onSuccess: (data) {
          if (data["status"] == "0") {
            phoneError = null;
          } else {
            phoneError = "Số điện thoại chưa được đăng ký tài khoản";
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
              phoneError = null;
            }
          } catch (e) {}

          update();
        },
      );
    }
  }

  Future writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  generateSignature() async {
    var pubKey = await rootBundle.load("assets/public.pem");
    var priKey = await rootBundle.load("assets/private.pem");
    String dir = (await getApplicationDocumentsDirectory()).path;

    writeToFile(pubKey, '$dir/publickey.pem');
    writeToFile(priKey, '$dir/privatekey.pem');
    publicKey = await parseKeyFromFile<RSAPublicKey>(File('$dir/publickey.pem').path);
    privateKey = await parseKeyFromFile<RSAPrivateKey>(File('$dir/privatekey.pem').path);
    encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
  }

  void onValidate() {
    phoneError = RkValidate.phone(phoneTextEditingController.text);
  }

  void onValidateForgotPassword() {
    passwordError = RkValidate.password(passWordTextEditingController.text);
    if (passWordTextEditingController.text != rePassWordTextEditingController.text) {
      rePasswordError = "Mật khẩu nhập lại không khớp";
    } else {
      rePasswordError = RkValidate.password(rePassWordTextEditingController.text);
    }
    update();
  }

  void onForgotPassword() {
    onValidateForgotPassword();
    if (passwordError == null && rePasswordError == null) {
      // encrypted = encrypter!.encrypt(passWordTextEditingController.text);
      forgotPasswordRequest = ForgotPasswordRequest(
        email: phoneTextEditingController.text,
        newpassword: passWordTextEditingController.text,
      );
      EasyLoading.show(status: "loading".tr);
      provider.put(
        endPoint: APIEndPoint.Forget_Password,
        data: forgotPasswordRequest.toJson(),
        onSuccess: (data) {
          EasyLoading.dismiss();
          Get.back();
          // Get.back();
          if (!Get.isSnackbarOpen) {
            RkAlert.success(message: data['message']);
          }
          update();

          // Navigator.popUntil(Get.context!, ModalRoute.withName('/login'));
          // Get.offAllNamed(AuthRoutes.LOGIN);
          // Get.create(() => LoginController());
          // // Get.offAllNamed(AuthRoutes.LOGIN);
          // Get.lazyPut<LoginController>(() => LoginController());
        },
        onError: (onError) {
          RkAlert.error(message: "Lỗi hệ thống ");
          print(" error: $onError");
        },
      );
    }
  }

  void onCheckOtp() {
    checkOtpRequest = CheckOtpRequest(
      email: phoneTextEditingController.text,
      otp: otp,
    );
    EasyLoading.show(status: "loading".tr);
    provider.post(
      endPoint: APIEndPoint.Check_Otp,
      data: checkOtpRequest.toJson(),
      onSuccess: (data) {
        EasyLoading.dismiss();
        isSentOTP = false;
        isConfirmPassword = true;

        if (!Get.isSnackbarOpen) {
          RkAlert.success(message: data['message']);
        }
        update();
      },
      onError: (onError) {
        try {
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
    // isConfirmPassword = true;
    update();
  }

  Map<String, dynamic> convertDynamicToMap(dynamic data) {
    Map<String, dynamic> convertedMap = json.decode(data);
    return convertedMap;
  }

  void onSentOtp() {
    onValidate();
    if (phoneError == null) {
      sentOtpRequest.phone = phoneTextEditingController.text;
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

  @override
  void dispose() {
    super.dispose();
  }
}
