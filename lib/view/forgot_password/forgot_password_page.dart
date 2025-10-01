import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_widget/background/background.dart';
import '../../base_widget/rk_button.dart';
import '../../base_widget/rk_image.dart';
import '../../base_widget/rk_otp.dart';
import '../../base_widget/rk_screen.dart';
import '../../base_widget/rk_text.dart';
import '../../base_widget/text_field_customize.dart';
import '../../helper/rk_dimensions.dart';
import '../../helper/rk_size.dart';
import '../../utils/color_resources.dart';
import '../../utils/fonts.dart';
import '../../utils/images_path.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      isSingleChildScrollView: true,
      isDisplayDesirePaddingTop: false,
      background: BackgroundDefault(),
      body: GetBuilder(
        init: ForgotPasswordController(),
        builder: (ForgotPasswordController controller) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  ImagesPath.img_bg_login,
                ),
              ),
            ),
            height: RkDimensions.screenSize.height,
            width: RkDimensions.screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: RkDimensions.ONE_UNIT_FONT * 80,
                  padding: EdgeInsets.only(
                    left: RkDimensions.ONE_UNIT_FONT * 0,
                    top: RkSize.size.height - RkSize.sizeIncludeBottom.height,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorResources.COLOR_686868,
                      size: RkDimensions.ONE_UNIT_FONT * 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 50,
                ),
                controller.isSentOTP == false && controller.isConfirmPassword == false
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 32, vertical: RkDimensions.ONE_UNIT_FONT * 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Quên mật khẩu",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 36,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                            RkText(
                              "Nhập số điện thoại đăng ký tài khoản của bạn",
                              // "Nhập email đăng ký tài khoản của bạn",
                              maxLine: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                          ],
                        ),
                      )
                    : controller.isSentOTP == false && controller.isConfirmPassword == true
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 32, vertical: RkDimensions.ONE_UNIT_FONT * 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RkText(
                                  "Đặt mật khẩu mới",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 24,
                                    color: ColorResources.COLOR_515151,
                                    fontFamily: Roboto,
                                  ),
                                ),
                                SizedBox(
                                  height: RkDimensions.ONE_UNIT_FONT * 10,
                                ),
                                RkText(
                                  "Nhập lại chính xác mật khẩu mà bạn đã đặt mới",
                                  maxLine: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                    color: ColorResources.COLOR_515151,
                                    fontFamily: Roboto,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 32, vertical: RkDimensions.ONE_UNIT_FONT * 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RkText(
                                  "Nhập mã xác minh",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 24,
                                    color: ColorResources.COLOR_515151,
                                    fontFamily: Roboto,
                                  ),
                                ),
                                SizedBox(
                                  height: RkDimensions.ONE_UNIT_FONT * 10,
                                ),
                                RkText(
                                  "Chúng tôi đã gửi mã xác minh gồm 6 chữ số tới số điện thoại " + controller.phoneTextEditingController.text,
                                  // "Chúng tôi đã gửi mã xác minh gồm 6 chữ số tới email " + controller.emailTextEditingController.text,
                                  maxLine: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 16,
                                    color: ColorResources.COLOR_515151,
                                    fontFamily: Roboto,
                                  ),
                                ),
                              ],
                            ),
                          ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 50,
                ),
                // SingleChildScrollView(
                //   physics: NeverScrollableScrollPhysics(),
                //   child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 16),
                  child: Container(
                    width: RkDimensions.screenSize.width,
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          RkDimensions.ONE_UNIT_FONT * 40,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: RkDimensions.ONE_UNIT_FONT * 20,
                      vertical: RkDimensions.ONE_UNIT_FONT * 20,
                    ),
                    child: Column(
                      children: [
                        buildLoginByPhone(controller),
                        controller.isConfirmPassword == true ? buildInputPassword(controller) : SizedBox(),
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_FONT * 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 115,
                ),
                controller.isSentOTP == false && controller.isConfirmPassword == false
                    ? Center(
                        child: RkButton(
                          onTap: () {
                            controller.onSentOtp();
                          },
                          label: "Tiếp tục",
                          labelStyle: TextStyle(
                            fontFamily: Roboto,
                            fontWeight: FontWeight.w600,
                            fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                            color: ColorResources.WHITE,
                          ),
                          padding: EdgeInsets.zero,
                          colorBG: ColorResources.COLOR_F58E16,
                          colorDisible: ColorResources.GREY,
                          borderRadius: RkDimensions.ONE_UNIT_FONT * 30,
                          width: RkDimensions.screenSize.width * 0.9,
                          height: RkDimensions.ONE_UNIT_FONT * 58,
                        ),
                      )
                    : SizedBox(),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildLoginByPhone(ForgotPasswordController controller) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.isSentOTP == false && controller.isConfirmPassword == false)
            Column(
              children: [
                buildInputEmail(controller),
                // SizedBox(
                //   height: RkDimensions.ONE_UNIT_FONT * 20,
                // ),

                // Center(
                //   child: RkButton(
                //     onTap: () {
                //       controller.isSentOTP = true;
                //       controller.update();
                //     },
                //     label: "NHẬN OTP",
                //     labelStyle: TextStyle(
                //       fontFamily: Barlow,
                //       fontWeight: FontWeight.w700,
                //       fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                //       color: ColorResources.WHITE,
                //     ),
                //     colorBG: ColorResources.highlight,
                //     colorDisible: ColorResources.GREY,
                //     borderRadius: RkDimensions.ONE_UNIT_FONT * 60,
                //     width: RkDimensions.screenSize.width * 0.52,
                //     height: RkDimensions.ONE_UNIT_FONT * 58,
                //   ),
                // )
              ],
            )
          else if (controller.isSentOTP == true && controller.isConfirmPassword == false)
            Container(
              child: Column(
                children: [
                  RkOtp(
                    codeLength: 6,
                    countDown: 300,
                    hasCountDown: true,
                    buttonLabel: "Xác nhận",
                    onTapSendSMS: () {
                      controller.onSentOtp();
                    },
                    onTap: () {
                      controller.onCheckOtp();
                    },
                    colorSMS: ColorResources.COLOR_F58E16,
                    onChanged: (val) {
                      controller.otp = val;
                      controller.update();
                    },
                    isEnabled: true,
                    lables: [],
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isSentOTP = false;
                      controller.otp = '';
                      controller.update();
                    },
                    child: RkText(
                      "Nhập lại Số điện thoại",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                        color: ColorResources.highlight,
                        fontFamily: Barlow,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                      maxLine: 4,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Widget buildInputPhone(LoginController controller) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       RkText(
  //         "Số điện thoại",
  //         style: TextStyle(
  //           fontFamily: Barlow,
  //           fontWeight: FontWeight.w400,
  //           fontSize: RkDimensions.ONE_UNIT_FONT * 18,
  //         ),
  //       ),
  //       SizedBox(
  //         height: RkDimensions.ONE_UNIT_SIZE * 10,
  //       ),
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border(
  //             bottom: BorderSide(
  //               color: controller.phoneError != null ? ColorResources.highlight : ColorResources.GRAY4,
  //             ),
  //           ),
  //         ),
  //         padding: EdgeInsets.only(
  //           bottom: RkDimensions.ONE_UNIT_SIZE * 10,
  //         ),
  //         child: TextFieldCustomized(
  //           hintStyle: TextStyle(
  //             fontFamily: Barlow,
  //             fontWeight: FontWeight.w400,
  //             fontSize: RkDimensions.ONE_UNIT_FONT * 18,
  //             color: ColorResources.GRAY2,
  //           ),
  //           textStyle: TextStyle(
  //             fontFamily: Barlow,
  //             fontWeight: FontWeight.bold,
  //             fontSize: RkDimensions.ONE_UNIT_FONT * 20,
  //             color: ColorResources.BLACK,
  //           ),
  //           hintText: "Nhập số điện thoại",
  //           backgroundColor: Colors.transparent,
  //           controller: controller.phoneTextEditingController,
  //           textInputType: TextInputType.number,
  //           textInputAction: TextInputAction.done,
  //           focusNode: controller.nodePhone,
  //           suffixIcon: controller.phoneTextEditingController.text != ""
  //               ? GestureDetector(
  //                   onTap: () {
  //                     controller.phoneTextEditingController.text = "";
  //                     controller.update();
  //                   },
  //                   child: RkImage(
  //                     ImagesPath.ic_close,
  //                   ),
  //                 )
  //               : Container(),
  //         ),
  //       ),
  //       controller.phoneError != "" && controller.phoneError != null
  //           ? Column(
  //               children: [
  //                 SizedBox(
  //                   height: RkDimensions.ONE_UNIT_SIZE * 10,
  //                 ),
  //                 RkText(
  //                   "*" + controller.phoneError!,
  //                   maxLine: 1,
  //                   style: TextStyle(
  //                     fontFamily: Barlow,
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: RkDimensions.ONE_UNIT_FONT * 16,
  //                     color: ColorResources.highlight_2,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           : SizedBox(),
  //     ],
  //   );
  // }

  // Widget buildButtomResgiter() {
  //   return Center(
  //     child: GestureDetector(
  //         onTap: () {
  //           Get.toNamed(AuthRoutes.SIGN_UP);
  //         },
  //         child: RichText(
  //           text: TextSpan(
  //             children: <TextSpan>[
  //               TextSpan(
  //                 text: "Bạn không có tài khoản ? ",
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w400,
  //                   fontSize: RkDimensions.ONE_UNIT_FONT * 15,
  //                   color: ColorResources.COLOR_515151,
  //                   fontFamily: Roboto,
  //                 ),
  //               ),
  //               TextSpan(
  //                 text: "Đăng ký",
  //                 style: TextStyle(
  //                   fontFamily: Roboto,
  //                   fontWeight: FontWeight.w700,
  //                   fontSize: RkDimensions.ONE_UNIT_FONT * 15,
  //                   color: ColorResources.COLOR_EE3439,
  //                   fontStyle: FontStyle.italic,
  //                   decoration: TextDecoration.underline,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //         // RkText(
  //         //   "Đăng ký",
  //         //   style: TextStyle(
  //         //     fontFamily: Roboto,
  //         //     fontWeight: FontWeight.w700,
  //         //     fontSize: RkDimensions.ONE_UNIT_FONT * 15,
  //         //     color: ColorResources.COLOR_EE3439,
  //         //     fontStyle: FontStyle.italic,
  //         //     decoration: TextDecoration.underline,
  //         //   ),
  //         // ),
  //         ),
  //   );
  // }

  // Widget buildLoginByEmail(LoginController controller) {
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           height: RkDimensions.ONE_UNIT_SIZE * 40,
  //         ),
  //         buildInputEmail(controller),
  //         SizedBox(
  //           height: RkDimensions.ONE_UNIT_SIZE * 20,
  //         ),
  //         buildInputPassword(controller),
  //         SizedBox(
  //           height: RkDimensions.ONE_UNIT_SIZE * 35,
  //         ),
  //         buildButtonLogin(),
  //       ],
  //     ),
  //   );
  // }

  Widget buildButtonLogin() {
    return Column(
      children: [
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 25,
        ),
        Center(
          child: RkButton(
            onTap: () {
              // controller.onLogin();
            },
            label: "Xác Nhận",
            labelStyle: TextStyle(
              fontFamily: LibreBodoni,
              fontWeight: FontWeight.w700,
              fontSize: RkDimensions.ONE_UNIT_FONT * 22,
              color: ColorResources.COLOR_333333,
            ),
            padding: EdgeInsets.zero,
            colorBG: ColorResources.COLOR_D6B877,
            colorDisible: ColorResources.GREY,
            borderRadius: RkDimensions.ONE_UNIT_FONT * 20,
            width: RkDimensions.screenSize.width * 0.9,
            height: RkDimensions.ONE_UNIT_FONT * 58,
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword(ForgotPasswordController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 40,
            ),
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
          ),
          child: Row(
            children: [
              RkImage(
                ImagesPath.img_password,
                height: RkDimensions.ONE_UNIT_FONT * 35,
              ),
              Expanded(
                child: TextFieldCustomized(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                    color: ColorResources.COLOR_929292,
                    fontFamily: Roboto,
                  ),
                  textStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.bold,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                    color: ColorResources.BLACK,
                  ),
                  onSubmitted: (val) {
                    // controller.authRequest.password = val;
                    controller.update();
                  },
                  onChanged: (val) {
                    // controller.authRequest.password = val;
                    controller.update();
                  },
                  hintText: "Nhập mật khẩu",
                  backgroundColor: Colors.transparent,
                  controller: controller.passWordTextEditingController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: controller.nodePassword,
                  isObscured: true,
                ),
              ),
            ],
          ),
        ),
        controller.passwordError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.passwordError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontFamily: Roboto,
                      fontWeight: FontWeight.w400,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.highlight_2,
                    ),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 40,
            ),
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
          ),
          child: Row(
            children: [
              RkImage(
                ImagesPath.img_password,
                height: RkDimensions.ONE_UNIT_FONT * 35,
              ),
              Expanded(
                child: TextFieldCustomized(
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                    color: ColorResources.COLOR_929292,
                    fontFamily: Roboto,
                  ),
                  textStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.bold,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                    color: ColorResources.BLACK,
                  ),
                  hintText: "Nhập mật khẩu của bạn",
                  backgroundColor: Colors.transparent,
                  controller: controller.rePassWordTextEditingController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: controller.nodeRePassword,
                  isObscured: true,
                ),
              ),
            ],
          ),
        ),
        controller.rePasswordError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.rePasswordError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontFamily: Roboto,
                      fontWeight: FontWeight.w400,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.highlight_2,
                    ),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 25,
        ),
        Center(
          child: RkButton(
            onTap: () {
              controller.onForgotPassword();
            },
            label: "Đổi mật khẩu",
            labelStyle: TextStyle(
              fontFamily: Roboto,
              fontWeight: FontWeight.w700,
              fontSize: RkDimensions.ONE_UNIT_FONT * 22,
              color: ColorResources.WHITE,
            ),
            padding: EdgeInsets.zero,
            colorBG: ColorResources.COLOR_F58E16,
            colorDisible: ColorResources.GREY,
            borderRadius: RkDimensions.ONE_UNIT_FONT * 20,
            width: RkDimensions.screenSize.width * 0.9,
            height: RkDimensions.ONE_UNIT_FONT * 58,
          ),
        ),
      ],
    );
  }

  Widget buildInputEmail(ForgotPasswordController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 40,
            ),
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
          ),
          child: Row(
            children: [
              RkImage(
                ImagesPath.img_phone_login,
                height: RkDimensions.ONE_UNIT_FONT * 30,
              ),
              Expanded(
                child: TextFieldCustomized(
                  hintStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.w400,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                    color: ColorResources.COLOR_929292,
                  ),
                  textStyle: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.bold,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                    color: ColorResources.BLACK,
                  ),
                  hintText: "Số điện thoại của bạn",
                  backgroundColor: Colors.transparent,
                  controller: controller.phoneTextEditingController,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  focusNode: controller.nodePhone,
                  onChanged: (val) {
                    controller.onCheckDuplicatePhone(controller.phoneTextEditingController.text);
                    // controller.sentOtpRequest.email = val;
                    controller.update();
                  },
                  onFocused: (val) {
                    if (val == false) {
                      controller.onCheckDuplicatePhone(controller.phoneTextEditingController.text);
                    }
                  },
                  suffixIcon: controller.phoneTextEditingController.text != ""
                      ? GestureDetector(
                          onTap: () {
                            controller.phoneTextEditingController.text = "";
                            controller.update();
                          },
                          child: RkImage(
                            ImagesPath.ic_close,
                          ),
                        )
                      : SizedBox(),
                ),
              ),
            ],
          ),
        ),
        controller.phoneError != "" && controller.phoneError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.phoneError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_EE3439,
                      fontFamily: Roboto,
                    ),
                  ),
                ],
              )
            : SizedBox(),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(
        //       RkDimensions.ONE_UNIT_SIZE * 40,
        //     ),
        //     border: Border.all(color: ColorResources.COLOR_DBDBDB),
        //   ),
        //   padding: EdgeInsets.symmetric(
        //     vertical: RkDimensions.ONE_UNIT_SIZE * 15,
        //     horizontal: RkDimensions.ONE_UNIT_SIZE * 15,
        //   ),
        //   child: Row(
        //     children: [
        //       RkImage(
        //         ImagesPath.img_mail_login,
        //         height: RkDimensions.ONE_UNIT_FONT * 30,
        //       ),
        //       Expanded(
        //         child: TextFieldCustomized(
        //           hintStyle: TextStyle(
        //             fontFamily: Roboto,
        //             fontWeight: FontWeight.w400,
        //             fontSize: RkDimensions.ONE_UNIT_FONT * 15,
        //             color: ColorResources.COLOR_929292,
        //           ),
        //           textStyle: TextStyle(
        //             fontFamily: Roboto,
        //             fontWeight: FontWeight.bold,
        //             fontSize: RkDimensions.ONE_UNIT_FONT * 18,
        //             color: ColorResources.BLACK,
        //           ),
        //           // hintText: "Nhập số điện thoại của bạn",
        //           hintText: "Nhập email của bạn",
        //           backgroundColor: Colors.transparent,
        //           controller: controller.emailTextEditingController,
        //           textInputType: TextInputType.text,
        //           textInputAction: TextInputAction.next,
        //           focusNode: controller.nodeEmail,
        //           onSubmitted: (val) {},
        //           onFocused: (val) {
        //             if (val == false) {}
        //           },
        //           suffixIcon: controller.emailTextEditingController.text != ""
        //               ? GestureDetector(
        //                   onTap: () {
        //                     controller.emailTextEditingController.text = "";
        //                     controller.update();
        //                   },
        //                   child: RkImage(
        //                     ImagesPath.ic_close,
        //                   ),
        //                 )
        //               : SizedBox(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // controller.emailError != "" && controller.emailError != null
        //     ? Column(
        //         children: [
        //           SizedBox(
        //             height: RkDimensions.ONE_UNIT_SIZE * 10,
        //           ),
        //           RkText(
        //             "*" + controller.emailError!,
        //             maxLine: 2,
        //             style: TextStyle(
        //               fontWeight: FontWeight.w500,
        //               fontSize: RkDimensions.ONE_UNIT_FONT * 15,
        //               color: ColorResources.COLOR_EE3439,
        //               fontFamily: Roboto,
        //             ),
        //           ),
        //         ],
        //       )
        //     : SizedBox(),
      ],
    );
  }

  // Widget buildBodyHeader() {
  //   return Container(
  //     width: Get.width,
  //     height: RkDimensions.ONE_UNIT_SIZE * 80,
  //     margin: EdgeInsets.symmetric(horizontal: RkDimensions.SPACE_SIZE_3X),
  //     padding: EdgeInsets.all(RkDimensions.ONE_UNIT_SIZE * 8),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(
  //         RkDimensions.ONE_UNIT_SIZE * 18,
  //       ),
  //       color: ColorResources.BG_TABBAR,
  //     ),
  //     child: TabBar(
  //         controller: controller.tabController,
  //         indicator: BoxDecoration(
  //           borderRadius: BorderRadius.circular(
  //             RkDimensions.ONE_UNIT_SIZE * 14,
  //           ),
  //           color: ColorResources.WHITE2,
  //         ),
  //         labelColor: ColorResources.highlight,
  //         unselectedLabelColor: ColorResources.GRAY2,
  //         labelStyle: TextStyle(
  //           fontFamily: Barlow,
  //           fontWeight: FontWeight.w600,
  //           fontSize: RkDimensions.ONE_UNIT_FONT * 14,
  //         ),
  //         tabs: controller.tabBarName.map((e) => Tab(text: e.toString())).toList()),
  //   );
  // }

  // Widget buildHeader() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       GestureDetector(
  //         onTap: () {
  //           Get.back();
  //         },
  //         child: Icon(
  //           Icons.arrow_back_outlined,
  //           size: RkDimensions.ONE_UNIT_SIZE * 48,
  //           color: ColorResources.BLACK,
  //         ),
  //       ),
  //       SizedBox(
  //         height: RkDimensions.ONE_UNIT_SIZE * 20,
  //       ),
  //       Center(
  //         child: Container(
  //           width: RkDimensions.screenSize.width * 0.65,
  //           child: RkImage(
  //             ImagesPath.img_logo,
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         height: RkDimensions.ONE_UNIT_SIZE * 36,
  //       ),
  //       Center(
  //         child: RkText(
  //           "Đăng Nhập",
  //           style: TextStyle(
  //             fontFamily: Barlow,
  //             fontWeight: FontWeight.w700,
  //             fontSize: RkDimensions.ONE_UNIT_SIZE * 44,
  //             color: ColorResources.BLACK,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
