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
import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      isSingleChildScrollView: true,
      isDisplayDesirePaddingTop: false,
      background: BackgroundDefault(),
      body: GetBuilder(
        init: SignUpController(),
        builder: (SignUpController controller) {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 0),
                  child: buildHeader(),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 32, vertical: RkDimensions.ONE_UNIT_FONT * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RkText(
                        "Bạn chưa có tài khoản ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 24,
                          color: ColorResources.COLOR_515151,
                          fontFamily: Roboto,
                        ),
                      ),
                      RkText(
                        "Đăng ký tại đây",
                        maxLine: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 36,
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
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
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
                          if (controller.isSentOTP == false)
                            buildInputPhone(controller)
                          else if (controller.isSentOTP == true)
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
                                    colorSMS: ColorResources.COLOR_ABABAB,
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
                                      "Nhập lại email",
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
                            )
                          else
                            SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: RkDimensions.ONE_UNIT_FONT * 100,
                ),
                controller.isSentOTP == false ? buildButtonRegister() : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInputPhone(SignUpController controller) {
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
                ImagesPath.img_mail_login,
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
                  // hintText: "Nhập số điện thoại của bạn",
                  hintText: "Nhập email của bạn",
                  backgroundColor: Colors.transparent,
                  controller: controller.emailTextEditingController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusNode: controller.nodeEmail,
                  onSubmitted: (val) {
                    controller.onCheckDuplicateEmail(val);
                  },
                  onFocused: (val) {
                    if (val == false) {
                      controller.onCheckDuplicateEmail(controller.emailTextEditingController.text);
                    }
                  },
                  suffixIcon: controller.emailTextEditingController.text != ""
                      ? GestureDetector(
                          onTap: () {
                            controller.emailTextEditingController.text = "";
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

          // Row(
          //   children: [
          //     RkImage(
          //       ImagesPath.img_phone_login,
          //       height: RkDimensions.ONE_UNIT_FONT * 30,
          //     ),
          //     Expanded(
          //       child: TextFieldCustomized(
          //         hintStyle: TextStyle(
          //           fontFamily: Roboto,
          //           fontWeight: FontWeight.w400,
          //           fontSize: RkDimensions.ONE_UNIT_FONT * 15,
          //           color: ColorResources.COLOR_929292,
          //         ),
          //         textStyle: TextStyle(
          //           fontFamily: Roboto,
          //           fontWeight: FontWeight.bold,
          //           fontSize: RkDimensions.ONE_UNIT_FONT * 18,
          //           color: ColorResources.BLACK,
          //         ),
          //         // hintText: "Nhập số điện thoại của bạn",
          //         hintText: "Nhập email của bạn",
          //         backgroundColor: Colors.transparent,
          //         controller: controller.phoneTextEditingController,
          //         textInputType: TextInputType.phone,
          //         textInputAction: TextInputAction.next,
          //         focusNode: controller.nodePhone,
          //         onSubmitted: (val) {
          //           controller.onCheckDuplicatePhone(val);
          //         },
          //         onFocused: (val) {
          //           if (val == false) {
          //             controller.onCheckDuplicatePhone(controller.phoneTextEditingController.text);
          //           }
          //         },
          //         suffixIcon: controller.phoneTextEditingController.text != ""
          //             ? GestureDetector(
          //                 onTap: () {
          //                   controller.phoneTextEditingController.text = "";
          //                   controller.update();
          //                 },
          //                 child: RkImage(
          //                   ImagesPath.ic_close,
          //                 ),
          //               )
          //             : SizedBox(),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        controller.emailError != "" && controller.emailError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.emailError!,
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
        // controller.phoneError != "" && controller.phoneError != null
        //     ? Column(
        //         children: [
        //           SizedBox(
        //             height: RkDimensions.ONE_UNIT_SIZE * 10,
        //           ),
        //           RkText(
        //             "*" + controller.phoneError!,
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

  Widget buildInputRepresentative(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Người đại diện",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
            hintText: "Người đại diện",
            backgroundColor: Colors.transparent,
            controller: controller.representativeTextEditingController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            focusNode: controller.nodeRepresentative,
            suffixIcon: controller.representativeTextEditingController.text != ""
                ? GestureDetector(
                    onTap: () {
                      controller.representativeTextEditingController.text = "";
                      controller.update();
                    },
                    child: RkImage(
                      ImagesPath.ic_close,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        controller.representativeError != "" && controller.representativeError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.representativeError!,
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
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
        RkText(
          "Chức vụ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
            hintText: "Nhập người đại diện",
            backgroundColor: Colors.transparent,
            controller: controller.positionTextEditingController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            focusNode: controller.nodePosition,
            suffixIcon: controller.positionTextEditingController.text != ""
                ? GestureDetector(
                    onTap: () {
                      controller.positionTextEditingController.text = "";
                      controller.update();
                    },
                    child: RkImage(
                      ImagesPath.ic_close,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        controller.positionError != "" && controller.positionError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.positionError!,
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
      ],
    );
  }

  Widget buildInputName(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Họ và tên",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
            hintText: "Họ và tên",
            backgroundColor: Colors.transparent,
            controller: controller.nameTextEditingController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            focusNode: controller.nodeName,
            suffixIcon: controller.nameTextEditingController.text != ""
                ? GestureDetector(
                    onTap: () {
                      controller.nameTextEditingController.text = "";
                      controller.update();
                    },
                    child: RkImage(
                      ImagesPath.ic_close,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        controller.nameError != "" && controller.nameError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.nameError!,
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
      ],
    );
  }

  Widget buildSelectTypeAccount(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Loại tài khoản",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio<TypeSignUp>(
                  value: TypeSignUp.personal,
                  groupValue: controller.type,
                  activeColor: ColorResources.COLOR_515151,
                  onChanged: (TypeSignUp? value) {
                    controller.type = value!;
                    controller.update();
                  },
                ),
                RkText(
                  "Cá nhân",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                    color: ColorResources.COLOR_515151,
                    fontFamily: Roboto,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: RkDimensions.ONE_UNIT_FONT * 45,
            ),
            Row(
              children: [
                Radio<TypeSignUp>(
                  value: TypeSignUp.company,
                  groupValue: controller.type,
                  activeColor: ColorResources.COLOR_515151,
                  onChanged: (TypeSignUp? value) {
                    controller.type = value!;
                    print("${controller.type}");
                    controller.update();
                  },
                ),
                RkText(
                  "Tổ chức",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                    color: ColorResources.COLOR_515151,
                    fontFamily: Roboto,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSignUpByPhone(SignUpController controller) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 40,
          ),
          if (controller.isSentOTP == false)
            Column(
              children: [
                buildInputPhone(controller),
                SizedBox(
                  height: RkDimensions.screenSize.height * 0.19,
                ),
                Center(
                  child: RkButton(
                    onTap: () {
                      controller.isSentOTP = true;
                      controller.update();
                    },
                    label: "NHẬN OTP",
                    labelStyle: TextStyle(
                      fontFamily: Barlow,
                      fontWeight: FontWeight.w700,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                      color: ColorResources.WHITE,
                    ),
                    colorBG: ColorResources.highlight,
                    colorDisible: ColorResources.GREY,
                    borderRadius: RkDimensions.ONE_UNIT_FONT * 60,
                    width: RkDimensions.screenSize.width * 0.52,
                    height: RkDimensions.ONE_UNIT_FONT * 58,
                  ),
                )
              ],
            )
          else
            Container(
              child: RkOtp(
                codeLength: 6,
                countDown: 300,
                hasCountDown: true,
                buttonLabel: "ĐĂNG KÝ",
                colorSMS: ColorResources.COLOR_F58E16,
                lables: [
                  Container(
                    child: RkText(
                      "Nhập mã OTP được gửi về số điện thoại của bạn để đăng nhập",
                      maxLine: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: Barlow,
                        fontWeight: FontWeight.w600,
                        fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                        color: ColorResources.BLACK,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 20,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildButtonRegister() {
    return Center(
      child: RkButton(
        onTap: () {
          controller.onCheckDuplicateEmail(controller.emailTextEditingController.text);
          // controller.onSentOtp();
        },
        label: "Tiếp tục",
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
    );
  }

  Widget buildSignUpByEmail(SignUpController controller) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 40,
          ),
          buildInputEmail(controller),
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 20,
          ),
          buildInputPassword(controller),
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 20,
          ),
          buildReInputPassword(controller),
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 35,
          ),
          buildButtonLogin(),
        ],
      ),
    );
  }

  Widget buildButtonLogin() {
    return Column(
      children: [
        // Center(
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: RkText(
        //       "Quên mật khẩu?",
        //       style: TextStyle(
        //         fontFamily: Barlow,
        //         fontWeight: FontWeight.w400,
        //         fontSize: RkDimensions.ONE_UNIT_FONT * 20,
        //         color: ColorResources.BLACK,
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 35,
        ),
        Center(
          child: RkButton(
            onTap: () {
              controller.onLogin();
            },
            label: "Đăng ký",
            labelStyle: TextStyle(
              fontFamily: Barlow,
              fontWeight: FontWeight.w700,
              fontSize: RkDimensions.ONE_UNIT_FONT * 20,
              color: ColorResources.WHITE,
            ),
            colorBG: ColorResources.highlight,
            colorDisible: ColorResources.GREY,
            borderRadius: RkDimensions.ONE_UNIT_FONT * 60,
            width: RkDimensions.screenSize.width * 0.52,
            height: RkDimensions.ONE_UNIT_FONT * 58,
          ),
        ),
      ],
    );
  }

  Widget buildInputPassword(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Mật khẩu",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
            // border: Border(
            //   bottom: BorderSide(
            //     color: controller.passwordError != null ? ColorResources.highlight : ColorResources.GRAY4,
            //   ),
            // ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
            hintText: "Nhập mật khẩu",
            backgroundColor: Colors.transparent,
            controller: controller.passWordTextEditingController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            focusNode: controller.nodePassword,
            isObscured: true,
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
      ],
    );
  }

  Widget buildReInputPassword(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Nhập lại mật khẩu",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
      ],
    );
  }

  Widget buildInputEmail(SignUpController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Email",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorResources.COLOR_D0D0D0,
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 20,
            ),
            // border: Border(
            //   bottom: BorderSide(
            //     color: controller.emailError != null ? ColorResources.highlight : ColorResources.GRAY4,
            //   ),
            // ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: RkDimensions.ONE_UNIT_SIZE * 15,
            horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
          ),
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
            hintText: "Email",
            backgroundColor: Colors.transparent,
            controller: controller.emailTextEditingController,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            focusNode: controller.nodeEmail,
            onSubmitted: (val) {
              controller.onCheckDuplicateEmail(val);
            },
            onFocused: (val) {
              if (val == false) {
                controller.onCheckDuplicateEmail(controller.emailTextEditingController.text);
              }
            },
            suffixIcon: controller.emailTextEditingController.text != ""
                ? GestureDetector(
                    onTap: () {
                      controller.emailTextEditingController.text = "";
                      controller.update();
                    },
                    child: RkImage(
                      ImagesPath.ic_close,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        controller.emailError != "" && controller.emailError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.emailError!,
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
      ],
    );
  }

  Widget buildBodyHeader() {
    return Container(
      width: Get.width,
      height: RkDimensions.ONE_UNIT_SIZE * 80,
      margin: EdgeInsets.symmetric(horizontal: RkDimensions.SPACE_SIZE_3X),
      padding: EdgeInsets.all(RkDimensions.ONE_UNIT_SIZE * 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          RkDimensions.ONE_UNIT_SIZE * 18,
        ),
        color: ColorResources.BG_TABBAR,
      ),
      child: TabBar(
          controller: controller.tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RkDimensions.ONE_UNIT_SIZE * 14,
            ),
            color: ColorResources.WHITE2,
          ),
          labelColor: ColorResources.highlight,
          unselectedLabelColor: ColorResources.GRAY2,
          labelStyle: TextStyle(
            fontFamily: Barlow,
            fontWeight: FontWeight.w600,
            fontSize: RkDimensions.ONE_UNIT_FONT * 14,
          ),
          tabs: controller.tabBarName.map((e) => Tab(text: e.toString())).toList()),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: RkDimensions.ONE_UNIT_FONT * 80,
          padding: EdgeInsets.only(left: RkDimensions.ONE_UNIT_FONT * 0, top: RkSize.size.height - RkSize.sizeIncludeBottom.height),
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
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        // Center(
        //   child: Container(
        //     width: RkDimensions.screenSize.width * 0.65,
        //     child: RkImage(
        //       ImagesPath.img_logo,
        //       fit: BoxFit.contain,
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: RkDimensions.ONE_UNIT_SIZE * 36,
        // ),
        // Center(
        //   child: RkText(
        //     "Đăng ký",
        //     style: TextStyle(
        //       fontFamily: Barlow,
        //       fontWeight: FontWeight.w700,
        //       fontSize: RkDimensions.ONE_UNIT_SIZE * 44,
        //       color: ColorResources.GREEN2,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
