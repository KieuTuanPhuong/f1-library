import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:template/routes/route_path/home_routes.dart';

import '../../data/api_endpoint/api_endpoint.dart';
import '../../data/model/auth/auth_request.dart';
import '../../data/model/auth/auth_response.dart';
import '../../data/model/error_response/error_custom_response.dart';
import '../../data/provider/provider.dart';
import '../../di_container.dart';
import '../../helper/rk_alert.dart';
import '../../helper/rk_validate.dart';
import '../../sharedpref/shared_preference_helper.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  final Provider provider = Provider();
  AuthRequest authRequest = AuthRequest();
  AuthResponse authResponse = AuthResponse();

  TabController? tabController;
  String deviceToken = sl<SharedPreferenceHelper>().firebaseNotificationToken;
  List tabBarName = ["Đăng nhập bằng Email", "Đăng nhập bằng SĐT"];
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passWordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  final FocusNode nodeEmail = FocusNode();
  final FocusNode nodePassword = FocusNode();
  final FocusNode nodePhone = FocusNode();
  String? emailError;
  String? passwordError;
  String? phoneError;
  bool isObscureText = true;
  bool? isSentOTP;
  Encrypter? encrypter;
  Encrypted? encrypted;
  String? decrypted;
  RSAPublicKey? publicKey;
  RSAPrivateKey? privateKey;
  String? password;
  String deviceName = '';
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  bool requestLogin = false;
  bool isRememberLogin = true;
  List<AuthRequest> mAccountSaveList = [];

  @override
  void onInit() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
      print('Running on ${androidInfo.model}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.name!;
      print('Running on ${iosInfo.name}');
    }
    if (Get.arguments != null) {
      if (Get.arguments['requestLogin'] != null) {
        requestLogin = Get.arguments['requestLogin'] as bool;
      } else {
        requestLogin = false;
      }
      update();
    }
    onInitData();
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    isSentOTP = false;
    authRequest.deviceToken = deviceToken;
  }

  void onInitData() {
    mAccountSaveList = sl<SharedPreferenceHelper>().getAccountSaveList ?? [];
    if (mAccountSaveList.isNotEmpty) {
      emailTextEditingController.text = mAccountSaveList[mAccountSaveList.length - 1].email!;
      passWordTextEditingController.text = mAccountSaveList[mAccountSaveList.length - 1].password!;
    }
    update();
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

    // final signer = Signer(RSASigner(RSASignDigest.SHA256, publicKey: publicKey, privateKey: privateKey));
    // print(signer.sign('1').base64);
  }

  void onValidate() {
    if (RkValidate.nullOrEmpty(emailTextEditingController.text)) {
      emailError = "Tên đăng nhập/Số điện thoại không được để trống";
    } else {
      emailError = null;
    }
    // emailError = RkValidate.email(emailTextEditingController.text);
    passwordError = RkValidate.password(passWordTextEditingController.text);
    update();
  }

  void onLogin() async {
    // if (onValidate()) {
    onValidate();
    if (emailError == null && passwordError == null) {
      // encrypted = encrypter!.encrypt(passWordTextEditingController.text);
      // decrypted = encrypter!.decrypt(encrypted!);
      // print("alo000 ${encrypted!.base64}");
      // print("alo000 ${decrypted}");
      authRequest = AuthRequest(
        email: emailTextEditingController.text,
        password: passWordTextEditingController.text,
        deviceToken: deviceToken,
        deviceName: !RkValidate.nullOrEmpty(deviceName) ? deviceName : "Điện thoại di động",
      );
      EasyLoading.show(status: "loading".tr);
      provider.post(
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
            if (isRememberLogin == true) {
              sl<SharedPreferenceHelper>().saveAccount(authRequest);
            }
            print("accessToken ${authResponse.accessToken}");

            if (requestLogin) {
              Get.back(result: true);
            } else {
              Get.offAllNamed(RootViewRoutes.ROOT_VIEW);
            }
            if (!Get.isSnackbarOpen) {
              RkAlert.success(message: 'success_login'.tr);
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
    }

    // }
  }

  Map<String, dynamic> convertDynamicToMap(dynamic data) {
    Map<String, dynamic> convertedMap = json.decode(data);
    return convertedMap;
  }

  // void onLogin() {
  //   sl<SharedPreferenceHelper>().setLogin(status: true);
  //   Get.offAllNamed(RootViewRoutes.ROOT_VIEW);
  //   // Get.back(result: true);
  //   update();
  // }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }
}
