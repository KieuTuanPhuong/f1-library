import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:template/data/model/sign_up/sign_up_request.dart';
import 'package:template/routes/route_path/auth_routes.dart';

import '../../../base_widget/rk_button.dart';
import '../../../base_widget/rk_image.dart';
import '../../../base_widget/rk_text.dart';
import '../../../data/api_endpoint/api_endpoint.dart';
import '../../../data/model/address/list_district_by_province_response.dart';
import '../../../data/model/address/list_province_response.dart';
import '../../../data/model/address/list_ward_by_district_response.dart';
import '../../../data/model/auth/auth_request.dart';
import '../../../data/model/auth/auth_response.dart';
import '../../../data/model/auth/checkDulicateUserNameRequest.dart';
import '../../../data/model/auth/checkDuplicateIDRequest.dart';
import '../../../data/model/auth/checkDuplicatePhoneRequest.dart';
import '../../../data/model/bank/list_bank_response.dart';
import '../../../data/model/error_response/error_custom_response.dart';
import '../../../data/model/upload_file/upload_file_request.dart';
import '../../../data/model/upload_file/upload_file_response.dart';
import '../../../data/provider/provider.dart';
import '../../../di_container.dart';
import '../../../helper/rk_alert.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../helper/rk_validate.dart';
import '../../../sharedpref/shared_preference_helper.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import '../../../utils/images_path.dart';
import '../../root_view/root_view_controller.dart';
import '../sign_up_controller.dart';

class SignUpStep2Controller extends GetxController {
  final Provider provider = Provider();
  AuthRequest authRequest = AuthRequest();
  AuthResponse authResponse = AuthResponse();
  String deviceToken = sl<SharedPreferenceHelper>().firebaseNotificationToken;
  bool isStep2 = false;
  bool isSelectedRule1 = false;
  TypeSignUp type = TypeSignUp.personal;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController rePassWordTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  TextEditingController birthdayTextEditingController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController cccdController = TextEditingController();
  TextEditingController dateRangeController = TextEditingController();
  TextEditingController issuedByController = TextEditingController();
  TextEditingController numberCardController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController branchBankController = TextEditingController();
  TextEditingController referralCodeTextEditingController = TextEditingController();
  final FocusNode nodeReferralCode = FocusNode();
  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodeName = FocusNode();
  final FocusNode nodePassword = FocusNode();
  final FocusNode nodeRePassword = FocusNode();
  final FocusNode nodeAddress = FocusNode();
  final FocusNode nodePhone = FocusNode();
  final FocusNode nodeIssuedBy = FocusNode();
  final FocusNode nodeNumberCard = FocusNode();
  final FocusNode nodeAccountName = FocusNode();
  final FocusNode nodeBranchBank = FocusNode();
  final FocusNode nodeUserName = FocusNode();
  String? userNameError;
  String? emailError;
  String? nameError;
  String? passwordError;
  String? rePasswordError;
  String? addressError;
  String? cccdError;
  String? issuedByError;
  String? numberCardError;
  String? accountNameError;
  String? branchBankError;
  String? birthdayError;
  String? cityError;
  String? districtError;
  String? wardsError;
  String? phoneError;
  String? dateRangeError;
  String? imgBackSideError;
  String? imgFrontError;
  String? isSelectedRule1Error;

  String? city;
  String? district;
  String? wards;
  String? bankName;
  String? numberCard;
  String? accountName;
  String? branchBank;
  int gender = 1;
  String? memberName;
  String? repName;
  String? phone;
  String? email;
  String? password;
  ListProvinceResponse? listProvinceResponse;
  ListDistrictByProvinceResponse? listDistrictByProvinceResponse;
  ListWardByDistrictResponse? listWardByDistrictResponse;
  File? imgBackSide;
  File? imgFrontSide;
  final List<String> mCity1 = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  // final List<String> mDistrict = [
  //   'Cầu Giấy',
  //   'Long Biên',
  //   'Hoàn Kiếm',
  //   'Đống Đa',
  //   'Thanh Xuân',
  // ];
  final List<String> mWards = [
    'Lac Long Quan',
    'Tran Duy Hung',
    'Nguyen Trai',
    'Hai Ba Trung',
    'Nguy Nhu Kom Tum',
  ];
  final List<String> mBanks = [
    'VCB',
    'TECH',
    'MB',
    'TP',
    'VIB',
  ];
  ListBankResponse? listBankResponse;
  List<District>? mDistrict;
  List<Ward>? mWard;
  List<Province>? mCity;
  List<Bank>? mBank;
  Province? selectedCity;
  District? selectedDistrict;
  Ward? selectedWard;
  Bank? selectedBank;
  int? provinceId;
  int? districtId;
  int? wardId;
  int? bankId;
  UploadFileRequest uploadFileRequest = UploadFileRequest();
  UploadFileResponse? uploadFileResponse;
  CheckDuplicateIDRequest checkDuplicateIDRequest = CheckDuplicateIDRequest();
  CheckDuplicatePhoneRequest checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest();
  CheckDuplicateUserNameRequest checkDuplicateUserNameRequest = CheckDuplicateUserNameRequest();

  Dio? dio;
  String filePathTemp = '';
  String? idFrontFace;
  String? idBackSide;
  String? position;
  SignUpRequest signUpRequest = SignUpRequest();
  Encrypter? encrypter;
  Encrypted? encrypted;
  String? decrypted;
  RSAPublicKey? publicKey;
  RSAPrivateKey? privateKey;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      if (Get.arguments["email"] != null) {
        email = Get.arguments["email"] as String;
      }
      // if (Get.arguments["member_name"] != null) {
      //   memberName = Get.arguments["member_name"] as String;
      // }
      // if (Get.arguments["rep_name"] != null) {
      //   repName = Get.arguments["rep_name"] as String;
      // }
      // if (Get.arguments["position"] != null) {
      //   position = Get.arguments["position"] as String;
      // }
      // if (Get.arguments["phone"] != null) {
      //   phone = Get.arguments["phone"] as String;
      // }
      // if (Get.arguments["email"] != null) {
      //   email = Get.arguments["email"] as String;
      // }
      // if (Get.arguments["password"] != null) {
      //   password = Get.arguments["password"] as String;
      // }
      // if (Get.arguments["gender"] != null) {
      //   gender = Get.arguments["gender"] as int;
      // }
    }
    onGetListProvince();
    // onGetListBank();
    // generateSignature();
  }

  void onCheckDuplicateUserName(String userName) {
    checkDuplicateUserNameRequest = CheckDuplicateUserNameRequest(
      userName: userName,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicateUserName,
      data: checkDuplicateUserNameRequest.toJson(),
      onSuccess: (data) {
        if (data["status"] != "0") {
          userNameError = null;
        } else {
          userNameError = data["message"];
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
            userNameError = errorCustomResponse.message!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  void onCheckDuplicatePhone(String phoneText) {
    checkDuplicatePhoneRequest = CheckDuplicatePhoneRequest(
      phone: phoneText,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicatePhone,
      data: checkDuplicatePhoneRequest.toJson(),
      onSuccess: (data) {
        if (data["status"] != "0") {
          phoneError = null;
        } else {
          phoneError = data["message"];
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
            phoneError = errorCustomResponse.message!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  void onLogin(String? mess) async {
    authRequest = AuthRequest(
      email: userNameController.text,
      password: passWordTextEditingController.text,
      deviceToken: deviceToken,
    );
    EasyLoading.show(status: "loading".tr);
    await provider.post(
      endPoint: APIEndPoint.LOGIN,
      data: authRequest.toJson(),
      onSuccess: (data) async {
        EasyLoading.dismiss();
        authResponse = AuthResponse.fromJson(data as Map<String, dynamic>);
        await FirebaseAnalytics.instance.logLogin();
        if (!RkValidate.nullOrEmpty(authResponse.accessToken)) {
          // sl<SharedPreferenceHelper>().setJwtToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJpc19tZW1iZXIiOiIxIiwiaWF0IjoxNjg0NTY5NzkwfQ.y9ZWyXZIpExNBGXacarS5qm5N9DIpHr_1Vx00fl9T-0");
          sl<SharedPreferenceHelper>().setJwtToken(authResponse.accessToken!);
          sl<SharedPreferenceHelper>().setMemberCode(authResponse.member_code!);
          sl<SharedPreferenceHelper>().setMemberId(authResponse.id!);
          sl<SharedPreferenceHelper>().saveAccount(authRequest);
          print("accessToken ${authResponse.accessToken}");
          // Get.back(result: true);
          Get.back(result: true);
          Get.back(result: true);
          Get.find<RootViewController>().onLogOutSuccess();
          // Get.offAllNamed(RootViewRoutes.ROOT_VIEW);

          if (!Get.isSnackbarOpen) {
            RkAlert.success(message: mess!);
          }
        }
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
        // RkAlert.error(message: onError);
        // print("onLogin error: $onError");
      },
    );

    // }
  }

  void onChangeStep2() {
    // if (RkValidate.nullOrEmpty(nameTextEditingController.text)) {
    //   nameError = "Họ và tên không được để trống";
    // } else {
    //   nameError = null;
    // }
    nameError = RkValidate.name(nameTextEditingController.text, rangeTo: 40);
    // emailError = RkValidate.email(emailTextEditingController.text);
    phoneError = RkValidate.phone(phoneTextEditingController.text);
    passwordError = RkValidate.password(passWordTextEditingController.text);
    if (passWordTextEditingController.text != rePassWordTextEditingController.text) {
      rePasswordError = "Mật khẩu nhập lại không khớp";
    } else {
      rePasswordError = RkValidate.password(rePassWordTextEditingController.text);
    }
    if (rePasswordError == null && phoneError == null && nameError == null && passwordError == null) {
      isStep2 = true;
    }
    update();
  }

  void onValidateInfo() {
    // if (RkValidate.nullOrEmpty(birthdayTextEditingController.text)) {
    //   birthdayError = "Ngày tháng năm sinh không được để trống";
    // } else {
    //   birthdayError = null;
    // }
    // if (RkValidate.nullOrEmpty(provinceId)) {
    //   cityError = "Tỉnh/Thành phố không được để trống";
    // } else {
    //   cityError = null;
    // }
    // if (RkValidate.nullOrEmpty(districtId)) {
    //   districtError = "Quận/Huyện không được để trống";
    // } else {
    //   districtError = null;
    // }
    // if (RkValidate.nullOrEmpty(wardId)) {
    //   wardsError = "Phường/Xã không được để trống";
    // } else {
    //   wardsError = null;
    // }
    // if (RkValidate.nullOrEmpty(addressController.text)) {
    //   addressError = "Địa chỉ không được để trống";
    // } else {
    //   addressError = null;
    // }
    passwordError = RkValidate.password(passWordTextEditingController.text);
    if (passWordTextEditingController.text != rePassWordTextEditingController.text) {
      rePasswordError = "Mật khẩu nhập lại không khớp";
    } else {
      rePasswordError = RkValidate.password(rePassWordTextEditingController.text);
    }
    phoneError = RkValidate.phone(phoneTextEditingController.text);
    nameError = RkValidate.name(nameTextEditingController.text);
    userNameError = RkValidate.userName(userNameController.text);
    if (RkValidate.nullOrEmpty(cccdController.text)) {
      cccdError = "Số chứng minh thư/CCCD không được để trống";
    } else {
      cccdError = null;
    }
    if (RkValidate.nullOrEmpty(dateRangeController.text)) {
      dateRangeError = "Ngày cấp không được để trống";
    } else {
      dateRangeError = null;
    }
    if (RkValidate.nullOrEmpty(issuedByController.text)) {
      issuedByError = "Nơi cấp không được để trống";
    } else {
      issuedByError = null;
    }
    if (RkValidate.nullOrEmpty(idFrontFace)) {
      imgFrontError = "Ảnh mặt trước không được để trống";
    } else {
      imgFrontError = null;
    }
    if (RkValidate.nullOrEmpty(idBackSide)) {
      imgBackSideError = "Ảnh mặt sau không được để trống";
    } else {
      imgBackSideError = null;
    }
    if (RkValidate.nullOrEmpty(accountNameController.text)) {
      accountNameError = "Tên chủ tài khoản không được để trống";
    } else {
      accountNameError = null;
    }

    if (RkValidate.nullOrEmpty(numberCardController.text)) {
      numberCardError = "Số tài khoản không được để trống";
    } else {
      numberCardError = null;
    }
    if (RkValidate.nullOrEmpty(branchBankController.text)) {
      branchBankError = "Chi nhánh ngân hàng không được để trống";
    } else {
      branchBankError = null;
    }
    if (RkValidate.nullOrEmpty(isSelectedRule1)) {
      isSelectedRule1Error = "Điều khoản không được để trống";
    } else {
      isSelectedRule1Error = null;
    }
    update();
  }

  void onSignUp() {
    onValidateInfo();
    if (
        // birthdayError == null && cityError == null && districtError == null && wardsError == null && addressError == null&&
        rePasswordError == null && phoneError == null && userNameError == null && nameError == null && passwordError == null) {
      signUpRequest = SignUpRequest(
        userName: userNameController.text,
        birthday: birthdayTextEditingController.text,
        address: addressController.text,
        fullName: nameTextEditingController.text,
        phone: phoneTextEditingController.text,
        password: passWordTextEditingController.text,
        email: email,
        provinceId: provinceId,
        districtId: districtId,
        wardId: wardId,
        gender: gender,
        referralCode: referralCodeTextEditingController.text,
      );

      EasyLoading.show(status: "loading".tr);
      provider.post(
        endPoint: APIEndPoint.SignUp,
        data: signUpRequest.toJson(),
        onSuccess: (data) async {
          EasyLoading.dismiss();
          await FirebaseAnalytics.instance.logSignUp(signUpMethod: "signUpApp");
          // Get.back();
          // Get.back();

          onLogin(data['message']);
          // if (!Get.isSnackbarOpen) {
          //   RkAlert.success(message: data['message']);
          // }
          // Get.dialog(
          //   onDialogSignUpSuccess(),
          //   // barrierDismissible: false,
          // );
          update();
        },
        onError: (onError) {
          try {
            Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
            final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
            if (!RkValidate.nullOrEmpty(errorCustomResponse.error!)) {
              if (!Get.isSnackbarOpen) {
                RkAlert.error(message: errorCustomResponse.error!);
              }
            }
          } catch (e) {
            if (!Get.isSnackbarOpen) {
              RkAlert.error(message: "Lỗi hệ thống ");
            }
          }
          EasyLoading.dismiss();
        },
      );
    }
    update();
  }

  Map<String, dynamic> convertDynamicToMap(dynamic data) {
    Map<String, dynamic> convertedMap = json.decode(data);
    return convertedMap;
  }

  Widget onDialogSignUpSuccess() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        // height: RkDimensions.screenSize.height * 0.42,
        width: RkDimensions.screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 15),
          color: ColorResources.WHITE,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: RkDimensions.ONE_UNIT_FONT * 15,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: RkDimensions.ONE_UNIT_FONT * 15,
              ),
              RkImage(
                ImagesPath.img_success_green,
                height: RkDimensions.ONE_UNIT_FONT * 50,
                width: RkDimensions.ONE_UNIT_FONT * 50,
              ),
              SizedBox(
                height: RkDimensions.ONE_UNIT_FONT * 15,
              ),
              RkText(
                "Bạn đã đăng ký tạo tài khoản",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                  color: ColorResources.COLOR_444444,
                  fontFamily: Roboto,
                ),
                maxLine: 5,
              ),
              SizedBox(
                height: RkDimensions.ONE_UNIT_FONT * 10,
              ),
              RkText(
                "Hãy đợi quản trị viên duyệt hồ sơ của bạn.Quản trị viên sẽ gửi phản hồi qua email của bạn",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: RkDimensions.ONE_UNIT_FONT * 16,
                  color: ColorResources.COLOR_444444,
                  fontFamily: Roboto,
                ),
                textAlign: TextAlign.center,
                maxLine: 5,
              ),
              SizedBox(
                height: RkDimensions.ONE_UNIT_FONT * 20,
              ),
              RkButton(
                onTap: () {
                  Navigator.popUntil(Get.context!, ModalRoute.withName('/login'));
                  // Get.put(LoginController());
                  // Get.create(() => LoginController());
                  // Get.offAllNamed(AuthRoutes.LOGIN);
                },
                label: "OK",
                labelStyle: TextStyle(
                  fontFamily: Barlow,
                  fontWeight: FontWeight.w700,
                  fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                  color: ColorResources.WHITE,
                ),
                padding: EdgeInsets.zero,
                colorBG: ColorResources.COLOR_EE3439,
                colorDisible: ColorResources.GREY,
                borderRadius: RkDimensions.ONE_UNIT_FONT * 10,
                height: RkDimensions.ONE_UNIT_FONT * 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCheckDuplicateID(String numberId) {
    checkDuplicateIDRequest = CheckDuplicateIDRequest(
      idNumber: numberId,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicateID,
      data: checkDuplicateIDRequest.toJson(),
      onSuccess: (data) {
        cccdError = null;
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
            cccdError = errorCustomResponse.error!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  void onSignUpStep3() {
    onValidateInfo();

    if (birthdayError == null &&
        cityError == null &&
        districtError == null &&
        wardsError == null &&
        addressError == null &&
        cccdError == null &&
        dateRangeError == null &&
        issuedByError == null &&
        imgFrontError == null &&
        imgBackSideError == null &&
        accountNameError == null &&
        // bankNameError == null &&
        numberCardError == null &&
        branchBankError == null) {
      Get.toNamed(
        AuthRoutes.SIGN_UP_STEP_3,
        arguments: {
          "type": type,
          "gender": gender,
          "member_name": memberName,
          "rep_name": repName,
          "phone": phone,
          "email": email,
          "password": password,
          "birthday": birthdayTextEditingController.text,
          "province_id": selectedCity!.code,
          "district_id": selectedDistrict!.code,
          "ward_id": selectedWard!.code,
          "member_address": addressController.text,
          "id_number": cccdController.text,
          "id_date": dateRangeController.text,
          "id_place": issuedByController.text,
          "id_front_face": idFrontFace,
          "id_back_side": idBackSide,
          "bank_account_name": accountNameController.text,
          "bank_id": bankId.toString(),
          "bank_account_number": numberCardController.text,
          "branch": branchBankController.text,
          "position": position,
        },
      );
    }
  }

  Future<dynamic> onUploadFile(File file, String pathUpload) async {
    FormData formData = new FormData.fromMap({
      "path": pathUpload,
      "file": await MultipartFile.fromFile(file.path),
    });
    EasyLoading.show(status: "loading".tr, dismissOnTap: false);

    await provider.uploadFile(
      endPoint: APIEndPoint.UploadFile,
      data: formData,
      onSuccess: (data) {
        EasyLoading.dismiss();
        if (!Get.isSnackbarOpen) {
          RkAlert.success(message: 'Tải lên thành công');
        }
        uploadFileResponse = UploadFileResponse.fromJson(data);
        filePathTemp = uploadFileResponse!.listResult![0].path!;
        print("file ${uploadFileResponse!.listResult![0].pathTemp}");
        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        RkAlert.error(message: 'error');
        print(" error: $onError");
      },
    );
  }

  void onGetListProvince() async {
    EasyLoading.show(status: "loading".tr);
    await provider.get(
      endPoint: APIEndPoint.Province,
      onSuccess: (data) {
        EasyLoading.dismiss();
        // mCity!.clear();
        if (data != null) {
          listProvinceResponse = ListProvinceResponse.fromJson(data as Map<String, dynamic>);
          // mCity!.addAll(listProvinceResponse.province!);
          // mCity!.addAll((data['province'] as List).map((e) => Province.fromJson(e as Map<String, dynamic>)).toList());
        }

        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        RkAlert.error(message: 'api_error'.tr);
      },
    );
  }

  void onGetListWard(int districtId) {
    EasyLoading.show(status: "loading".tr);
    provider.get(
      endPoint: APIEndPoint.Ward(district_id: districtId.toString()),
      onSuccess: (data) {
        EasyLoading.dismiss();
        if (data != null) {
          listWardByDistrictResponse = ListWardByDistrictResponse.fromJson(data as Map<String, dynamic>);
        }

        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        RkAlert.error(message: 'api_error'.tr);
      },
    );
  }

  void onGetListDistrict(int provinceId) {
    EasyLoading.show(status: "loading".tr);
    provider.get(
      endPoint: APIEndPoint.District(province_id: provinceId.toString()),
      onSuccess: (data) {
        EasyLoading.dismiss();
        // mDistrict!.clear();
        if (data != null) {
          listDistrictByProvinceResponse = ListDistrictByProvinceResponse.fromJson(data as Map<String, dynamic>);
          // mDistrict!.addAll((data['district'] as List).map((e) => District.fromJson(e as Map<String, dynamic>)).toList());
        }

        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        RkAlert.error(message: 'api_error'.tr);
      },
    );
  }

  Future<void> onPickUpFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print("hihihi $file");
    } else {
      // User canceled the picker
    }
  }

  void onUpdateCity(Province val, int idProvince) {
    selectedCity = val;
    provinceId = idProvince;
    onGetListDistrict(provinceId!);
    update();
  }

  void onUpdateBank(Bank val) {
    selectedBank = val;
    bankId = val.id;
    update();
  }

  void onUpdateWard(Ward val) {
    selectedWard = val;
    wardId = val.code;
    update();
  }

  void onUpdateDistrict(District val, int idDistrict) {
    selectedDistrict = val;
    districtId = idDistrict;
    onGetListWard(districtId!);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
