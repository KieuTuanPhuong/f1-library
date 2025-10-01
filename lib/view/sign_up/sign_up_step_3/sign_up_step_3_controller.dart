import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:path_provider/path_provider.dart';
import 'package:template/utils/app_constants.dart';

import '../../../base_widget/rk_button.dart';
import '../../../base_widget/rk_image.dart';
import '../../../base_widget/rk_text.dart';
import '../../../data/api_endpoint/api_endpoint.dart';
import '../../../data/model/auth/checkDuplicateTaxRequest.dart';
import '../../../data/model/error_response/error_custom_response.dart';
import '../../../data/model/sign_up/sign_up_request.dart';
import '../../../data/model/upload_file/upload_file_request.dart';
import '../../../data/model/upload_file/upload_file_response.dart';
import '../../../data/provider/provider.dart';
import '../../../helper/rk_alert.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../helper/rk_validate.dart';
import '../../../routes/route_path/auth_routes.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import '../../../utils/images_path.dart';
import '../../login/login_controller.dart';
import '../sign_up_controller.dart';
import 'package:pointycastle/asymmetric/api.dart';

class SignUpStep3Controller extends GetxController {
  final Provider provider = Provider();
  TextEditingController nameCompanyTextEditingController = TextEditingController();
  TextEditingController taxCodeTextEditingController = TextEditingController();
  TextEditingController dateRangTaxCodeTextEditingController = TextEditingController();
  TextEditingController issuedByTextEditingController = TextEditingController();
  TextEditingController addressCompanyTextEditingController = TextEditingController();
  TextEditingController numberCardController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController branchBankController = TextEditingController();
  final FocusNode nodeNameCompany = FocusNode();
  final FocusNode nodeIssuedBy = FocusNode();
  final FocusNode nodeTaxCode = FocusNode();
  final FocusNode nodeAddressCompany = FocusNode();
  final FocusNode nodeNumberCard = FocusNode();
  final FocusNode nodeAccountName = FocusNode();
  final FocusNode nodeBranchBank = FocusNode();
  String? nameCompanyError;
  String? taxCodeError;
  String? issuedByError;
  String? addressCompanyError;
  String? numberCardError;
  String? accountNameError;
  String? branchBankError;
  String? dateRangTaxCodeError;
  String? isSelectedRule1Error;
  String? pathFile1Error;
  String? pathFile2Error;
  TypeSignUp type = TypeSignUp.personal;
  bool isSelectedRule1 = false;
  File? filePicker;
  UploadFileRequest uploadFileRequest = UploadFileRequest();
  UploadFileResponse? uploadFileResponse;
  Dio? dio;
  String filePathTemp = '';
  String pathFile1 = '';
  String pathFile2 = '';
  String? bankName;
  String? bankNumberCard;
  String? bankAccountName;
  String? branchBank;
  int? gender;
  String? memberName;
  String? repName;
  String? phone;
  String? email;
  String? password;
  String? idFrontFace;
  String? idBackSide;
  int? provinceId;
  int? districtId;
  int? wardId;
  String? memberAddress;
  String? birthday;
  String? idNumber;
  String? idDate;
  String? idPlace;
  String? bankId;
  String? position;
  CheckDuplicateTaxRequest checkDuplicateTaxRequest = CheckDuplicateTaxRequest();
  SignUpRequest signUpRequest = SignUpRequest();
  final List<String> mBanks = [
    'VCB',
    'TECH',
    'MB',
    'TP',
    'VIB',
  ];
  List<String> filePath = [];
  Encrypter? encrypter;
  Encrypted? encrypted;
  String? decrypted;
  RSAPublicKey? publicKey;
  RSAPrivateKey? privateKey;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments["type"] != null) {
        type = Get.arguments["type"] as TypeSignUp;
      }
      if (Get.arguments["member_name"] != null) {
        memberName = Get.arguments["member_name"] as String;
      }
      if (Get.arguments["position"] != null) {
        position = Get.arguments["position"] as String;
      }
      if (Get.arguments["rep_name"] != null) {
        repName = Get.arguments["rep_name"] as String;
      }
      if (Get.arguments["phone"] != null) {
        phone = Get.arguments["phone"] as String;
      }
      if (Get.arguments["email"] != null) {
        email = Get.arguments["email"] as String;
      }
      if (Get.arguments["password"] != null) {
        password = Get.arguments["password"] as String;
      }
      if (Get.arguments["gender"] != null) {
        gender = Get.arguments["gender"] as int;
      }
      if (Get.arguments["birthday"] != null) {
        birthday = Get.arguments["birthday"] as String;
      }
      if (Get.arguments["province_id"] != null) {
        provinceId = Get.arguments["province_id"] as int;
      }
      if (Get.arguments["district_id"] != null) {
        districtId = Get.arguments["district_id"] as int;
      }
      if (Get.arguments["ward_id"] != null) {
        wardId = Get.arguments["ward_id"] as int;
      }
      if (Get.arguments["member_address"] != null) {
        memberAddress = Get.arguments["member_address"] as String;
      }
      if (Get.arguments["id_number"] != null) {
        idNumber = Get.arguments["id_number"] as String;
      }
      if (Get.arguments["id_date"] != null) {
        idDate = Get.arguments["id_date"] as String;
      }
      if (Get.arguments["id_place"] != null) {
        idPlace = Get.arguments["id_place"] as String;
      }
      if (Get.arguments["id_front_face"] != null) {
        idFrontFace = Get.arguments["id_front_face"] as String;
      }
      if (Get.arguments["id_back_side"] != null) {
        idBackSide = Get.arguments["id_back_side"] as String;
      }
      if (Get.arguments["bank_account_name"] != null) {
        bankAccountName = Get.arguments["bank_account_name"] as String;
      }
      if (Get.arguments["bank_id"] != null) {
        bankId = Get.arguments["bank_id"] as String;
      }
      if (Get.arguments["bank_account_number"] != null) {
        bankNumberCard = Get.arguments["bank_account_number"] as String;
      }
      if (Get.arguments["branch"] != null) {
        branchBank = Get.arguments["branch"] as String;
      }
    }
    generateSignature();
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

  void onValidateInfo() {
    if (RkValidate.nullOrEmpty(nameCompanyTextEditingController.text)) {
      nameCompanyError = "Tên tổ chức không được để trống";
    } else {
      nameCompanyError = null;
    }
    if (RkValidate.nullOrEmpty(taxCodeTextEditingController.text)) {
      taxCodeError = "Mã số thuế/Mã số doanh nghiệp không được để trống";
    } else {
      taxCodeError = null;
    }
    if (RkValidate.nullOrEmpty(dateRangTaxCodeTextEditingController.text)) {
      dateRangTaxCodeError = "Ngày cấp Mã số thuế/Mã số doanh nghiệp không được để trống";
    } else {
      dateRangTaxCodeError = null;
    }
    if (RkValidate.nullOrEmpty(issuedByTextEditingController.text)) {
      issuedByError = "Nơi cấp không được để trống";
    } else {
      issuedByError = null;
    }
    if (RkValidate.nullOrEmpty(addressCompanyTextEditingController.text)) {
      addressCompanyError = "Địa chỉ tổ chức không được để trống";
    } else {
      addressCompanyError = null;
    }
    if (RkValidate.nullOrEmpty(pathFile1)) {
      pathFile1Error = "Giấy chứng nhận đăng ký kinh doanh không được để trống";
    } else {
      pathFile1Error = null;
    }
    if (RkValidate.nullOrEmpty(isSelectedRule1)) {
      isSelectedRule1Error = "Chấp nhận điều khoản không được để trống";
    } else {
      isSelectedRule1Error = null;
    }

    update();
  }

  void onCheckDuplicateTaxRequest(String tax) {
    checkDuplicateTaxRequest = CheckDuplicateTaxRequest(
      taxCode: tax,
    );
    provider.post(
      endPoint: APIEndPoint.checkDuplicateTax,
      data: checkDuplicateTaxRequest.toJson(),
      onSuccess: (data) {
        taxCodeError = null;
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
            taxCodeError = errorCustomResponse.error!;
          }
        } catch (e) {}

        update();
      },
    );
  }

  // void onSignUp() {
  //   onValidateInfo();
  //   if (nameCompanyError == null &&
  //       taxCodeError == null &&
  //       dateRangTaxCodeError == null &&
  //       issuedByError == null &&
  //       addressCompanyError == null &&
  //       pathFile1Error == null &&
  //       isSelectedRule1Error == null) {
  //     encrypted = encrypter!.encrypt(password!);
  //     signUpRequest = SignUpRequest(
  //       birthday: birthday,
  //       type: 2,
  //       memberName: nameCompanyTextEditingController.text,
  //       phone: phone,
  //       password: encrypted!.base64,
  //       email: email,
  //       provinceId: provinceId,
  //       districtId: districtId,
  //       wardId: wardId,
  //       memberAddress: memberAddress,
  //       idNumber: idNumber,
  //       idDate: idDate,
  //       idPlace: idPlace,
  //       gender: gender.toString(),
  //       idFrontFace: idFrontFace,
  //       idBackSide: idBackSide,
  //       bankAccountName: bankAccountName,
  //       bankId: bankId,
  //       bankAccountNumber: bankNumberCard,
  //       branch: branchBank,
  //       repName: repName,
  //       repAddress: addressCompanyTextEditingController.text,
  //       taxCode: taxCodeTextEditingController.text,
  //       taxDate: dateRangTaxCodeTextEditingController.text,
  //       taxPlace: issuedByTextEditingController.text,
  //       businessRegistration: pathFile1,
  //       filePath: filePath,
  //       position: position,
  //     );
  //     EasyLoading.show(status: "loading".tr);
  //     provider.post(
  //       endPoint: APIEndPoint.SignUp,
  //       data: signUpRequest.toJson(),
  //       onSuccess: (data) {
  //         EasyLoading.dismiss();
  //         // if (!Get.isSnackbarOpen) {
  //         //   RkAlert.success(message: data['message']);
  //         // }
  //         Get.dialog(
  //           onDialogSignUpSuccess(),
  //           // barrierDismissible: false,
  //         );
  //         update();
  //       },
  //       onError: (onError) {
  //         try {
  //           Map<String, dynamic> convertedData = convertDynamicToMap(onError.toString());
  //           final errorCustomResponse = ErrorCustomResponse.fromJson(convertedData);
  //           if (!RkValidate.nullOrEmpty(errorCustomResponse.error!)) {
  //             if (!Get.isSnackbarOpen) {
  //               RkAlert.error(message: errorCustomResponse.error!);
  //             }
  //           }
  //         } catch (e) {
  //           if (!Get.isSnackbarOpen) {
  //             RkAlert.error(message: "Lỗi hệ thống ");
  //           }
  //         }
  //         EasyLoading.dismiss();
  //       },
  //     );
  //   }
  //   update();
  // }

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
                  // Get.offAndToNamed(AuthRoutes.LOGIN);
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

  Future<dynamic> onUploadFile(File file) async {
    // uploadFileRequest = UploadFileRequest(
    //   file: await MultipartFile.fromFile(file),
    //   path: 'member/file/',
    // );
    FormData formData = new FormData.fromMap({
      "path": 'member/file/',
      "file": await MultipartFile.fromFile(file.path),
    });
    EasyLoading.show(status: "loading".tr);

    // var response = await Dio().post(
    //   BASE_URL + "/" + APIEndPoint.UploadFile,
    //   options: Options(contentType: 'multipart/form-data'),
    //   data: formData,
    // );
    //
    // if (response!.statusCode! >= 200 && response!.statusCode! <= 300) {
    //   EasyLoading.dismiss();
    //   RkAlert.success(message: 'Tải lên thành công');
    //   uploadFileResponse = UploadFileResponse.fromJson(response.data);
    //   print("file ${uploadFileResponse!.listResult![0].path}");
    //   print(response);
    // } else {
    //   EasyLoading.dismiss();
    //   RkAlert.error(message: 'error');
    // }
    // return response;
    await provider.uploadFile(
      endPoint: APIEndPoint.UploadFile,
      data: formData,
      onSuccess: (data) {
        EasyLoading.dismiss();
        RkAlert.success(message: 'Tải lên thành công');
        uploadFileResponse = UploadFileResponse.fromJson(data);
        filePathTemp = uploadFileResponse!.listResult![0].path!;
        print("file ${uploadFileResponse!.listResult![0].pathTemp}");
        update();
      },
      onError: (onError) {
        EasyLoading.dismiss();
        RkAlert.error(message: 'error'.tr);
        print(" error: $onError");
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
