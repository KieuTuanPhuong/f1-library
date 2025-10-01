import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:template/base_widget/background/background.dart';
import 'package:template/data/model/address/list_district_by_province_response.dart';
import 'package:template/data/model/address/list_province_response.dart';
import 'package:template/data/model/address/list_ward_by_district_response.dart';
import 'package:template/helper/rk_validate.dart';

import '../../../base_widget/rk_button.dart';
import '../../../base_widget/rk_image.dart';
import '../../../base_widget/rk_screen.dart';
import '../../../base_widget/rk_text.dart';
import '../../../base_widget/text_field_customize.dart';
import '../../../data/model/bank/list_bank_response.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../helper/rk_size.dart';
import '../../../helper/text_field_date_picker.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import '../../../utils/images_path.dart';
import '../../picker_image/view/picker_image_dialog.dart';
import 'sign_up_step2_controller.dart';

class SignUpStep2Page extends GetView<SignUpStep2Controller> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      isDisplayDesirePaddingTop: false,
      isSingleChildScrollView: true,
      background: BackgroundDefault(),
      body: GetBuilder(
        init: SignUpStep2Controller(),
        builder: (SignUpStep2Controller controller) {
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
            child: SingleChildScrollView(
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
                          "Nhập thông tin của bạn",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: RkDimensions.ONE_UNIT_FONT * 24,
                            color: ColorResources.COLOR_515151,
                            fontFamily: Roboto,
                          ),
                        ),
                        RkText(
                          "Nhập đầy đủ các thông tin để hoàn thành quá trình tạo tài khoản nhé !",
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
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_FONT * 30,
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
                        child: controller.isStep2 == false
                            ? Column(
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
                                          ImagesPath.img_customer,
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
                                              controller.update();
                                            },
                                            onFocused: (val) {
                                              if (val == false) {
                                                controller.nameError = RkValidate.name(controller.nameTextEditingController.text);
                                                controller.update();
                                              }
                                            },
                                            onChanged: (val) {
                                              controller.update();
                                            },
                                            hintText: "Nhập họ và tên đầy đủ của bạn",
                                            backgroundColor: Colors.transparent,
                                            controller: controller.nameTextEditingController,
                                            textInputType: TextInputType.text,
                                            textInputAction: TextInputAction.next,
                                            focusNode: controller.nodeName,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.nameError != null
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: RkDimensions.ONE_UNIT_SIZE * 10,
                                            ),
                                            RkText(
                                              "*" + controller.nameError!,
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

                                  /// user name
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
                                          ImagesPath.img_customer,
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
                                              controller.userNameError = RkValidate.userName(controller.userNameController.text);
                                              if (controller.userNameError == null) {
                                                controller.onCheckDuplicateUserName(controller.userNameController.text);
                                              }
                                              // controller.onCheckDuplicateUserName(val);
                                              controller.update();
                                            },
                                            onFocused: (val) {
                                              if (val == false) {
                                                controller.userNameError = RkValidate.userName(controller.userNameController.text);
                                                if (controller.userNameError == null) {
                                                  controller.onCheckDuplicateUserName(controller.userNameController.text);
                                                }

                                                controller.update();
                                              }
                                            },
                                            onChanged: (val) {
                                              controller.update();
                                            },
                                            hintText: "Nhập tên đăng nhập của bạn",
                                            backgroundColor: Colors.transparent,
                                            controller: controller.userNameController,
                                            textInputType: TextInputType.text,
                                            textInputAction: TextInputAction.next,
                                            focusNode: controller.nodeUserName,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.userNameError != null
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: RkDimensions.ONE_UNIT_SIZE * 10,
                                            ),
                                            RkText(
                                              "*" + controller.userNameError!,
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
                                          ImagesPath.img_phone_login,
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
                                              controller.onCheckDuplicatePhone(val);
                                              controller.update();
                                            },
                                            onFocused: (val) {
                                              if (val == false) {
                                                controller.onCheckDuplicatePhone(controller.phoneTextEditingController.text);
                                              }
                                            },
                                            onChanged: (val) {
                                              controller.update();
                                            },
                                            hintText: "Nhập số điện thoại của bạn",
                                            backgroundColor: Colors.transparent,
                                            controller: controller.phoneTextEditingController,
                                            textInputType: TextInputType.phone,
                                            textInputAction: TextInputAction.next,
                                            focusNode: controller.nodePhone,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller.phoneError != null
                                      ? Column(
                                          children: [
                                            SizedBox(
                                              height: RkDimensions.ONE_UNIT_SIZE * 10,
                                            ),
                                            RkText(
                                              "*" + controller.phoneError!,
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
                                  //         height: RkDimensions.ONE_UNIT_FONT * 35,
                                  //       ),
                                  //       Expanded(
                                  //         child: TextFieldCustomized(
                                  //           hintStyle: TextStyle(
                                  //             fontWeight: FontWeight.w400,
                                  //             fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                  //             color: ColorResources.COLOR_929292,
                                  //             fontFamily: Roboto,
                                  //           ),
                                  //           textStyle: TextStyle(
                                  //             fontFamily: Roboto,
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                                  //             color: ColorResources.BLACK,
                                  //           ),
                                  //           onSubmitted: (val) {
                                  //             controller.update();
                                  //           },
                                  //           onChanged: (val) {
                                  //             controller.update();
                                  //           },
                                  //           hintText: "Nhập email của bạn",
                                  //           backgroundColor: Colors.transparent,
                                  //           controller: controller.emailTextEditingController,
                                  //           textInputType: TextInputType.text,
                                  //           textInputAction: TextInputAction.next,
                                  //           focusNode: controller.nodeEmail,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // controller.emailError != null
                                  //     ? Column(
                                  //         children: [
                                  //           SizedBox(
                                  //             height: RkDimensions.ONE_UNIT_SIZE * 10,
                                  //           ),
                                  //           RkText(
                                  //             "*" + controller.emailError!,
                                  //             maxLine: 2,
                                  //             style: TextStyle(
                                  //               fontFamily: Roboto,
                                  //               fontWeight: FontWeight.w400,
                                  //               fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                  //               color: ColorResources.highlight_2,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       )
                                  //     : SizedBox(),
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
                                            onSubmitted: (val) {
                                              // controller.authRequest.password = val;
                                              controller.update();
                                            },
                                            onFocused: (val) {
                                              if (val == false) {
                                                controller.passwordError = RkValidate.password(controller.passWordTextEditingController.text);
                                                controller.update();
                                              }
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
                                            hintText: "Nhập lại mật khẩu",
                                            backgroundColor: Colors.transparent,
                                            onFocused: (val) {
                                              if (val == false) {
                                                controller.rePasswordError = RkValidate.password(controller.rePassWordTextEditingController.text);
                                                controller.update();
                                              }
                                            },
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
                                    height: RkDimensions.ONE_UNIT_FONT * 20,
                                  ),

                                  /// referral code
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
                                          ImagesPath.img_future,
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
                                            onSubmitted: (val) {},
                                            onFocused: (val) {},
                                            onChanged: (val) {
                                              controller.update();
                                            },
                                            hintText: "Nhập mã giới thiệu của bạn",
                                            backgroundColor: Colors.transparent,
                                            controller: controller.referralCodeTextEditingController,
                                            textInputType: TextInputType.text,
                                            textInputAction: TextInputAction.done,
                                            focusNode: controller.nodeReferralCode,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : buildStep2(controller, context),
                      ),
                    ),
                  ),
                  buildButtonRegister(controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildStep2(SignUpStep2Controller controller, BuildContext context) {
    return Column(
      children: [
        buildInputBirthday(controller),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        buildGender(controller),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        buildInputAddress(controller, context),
      ],
    );
  }

  Widget buildGender(SignUpStep2Controller controller) {
    return Row(
      children: [
        Wrap(
          spacing: 5,
          children: [
            RkText(
              "Giới tính",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                color: ColorResources.COLOR_707070,
                fontFamily: Roboto,
              ),
            ),
            RkText(
              "(Không bắt buộc) ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                color: ColorResources.COLOR_F13A3A,
                fontFamily: Roboto,
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Radio<int>(
                value: 1,
                groupValue: controller.gender,
                activeColor: ColorResources.COLOR_515151,
                onChanged: (int? value) {
                  controller.gender = value!;
                  print("${controller.gender}");
                  controller.update();
                },
              ),
              RkText(
                "Nam",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                  color: ColorResources.COLOR_515151,
                  fontFamily: Roboto,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: RkDimensions.ONE_UNIT_FONT * 5,
        ),
        Row(
          children: [
            Radio<int>(
              value: 2,
              groupValue: controller.gender,
              activeColor: ColorResources.COLOR_515151,
              onChanged: (int? value) {
                controller.gender = value!;
                print("${controller.gender}");
                controller.update();
              },
            ),
            RkText(
              "Nữ",
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
    );
  }

  Widget buildImgCCCD(BuildContext context, SignUpStep2Controller controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Ảnh 2 mặt CMT / CCCD",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
            color: ColorResources.COLOR_515151,
            fontFamily: Roboto,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  RkText(
                    "Mặt trước",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_515151,
                      fontFamily: Roboto,
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>
                              // action
                              ImagePickerDialog(
                                nameMessage: "Tải ảnh mặt trước CMT / CCCD",
                              )).then((value) async {
                        if (value != null && value.length != 0) {
                          controller.imgFrontSide = value[0];
                          await controller.onUploadFile(value[0], id_front_face_path);
                          controller.idFrontFace = controller.filePathTemp;
                          print('1 ${controller.idFrontFace}');
                          controller.update();
                        }
                        // if (value != null && value.length != 0) controller.onGetImage(value[0]);
                      });
                    },
                    child: controller.imgFrontSide != null
                        ? DottedBorder(
                            dashPattern: [6, 6, 6, 6],
                            borderType: BorderType.RRect,
                            color: Colors.black,
                            strokeWidth: 1,
                            radius: Radius.circular(RkDimensions.ONE_UNIT_FONT * 15),
                            child: RkImage.file(
                              controller.imgFrontSide,
                              height: RkDimensions.ONE_UNIT_FONT * 120,
                              borderRadius: RkDimensions.ONE_UNIT_FONT * 15,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Container(
                            height: RkDimensions.ONE_UNIT_FONT * 100,
                            width: RkDimensions.ONE_UNIT_FONT * 140,
                            child: RkImage(
                              ImagesPath.img_cccd_1,
                              fit: BoxFit.contain,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: RkDimensions.ONE_UNIT_FONT * 10,
            ),
            Expanded(
              child: Column(
                children: [
                  RkText(
                    "Mặt sau",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_515151,
                      fontFamily: Roboto,
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) =>
                            // action
                            Container(
                          child: ImagePickerDialog(
                            nameMessage: "Tải ảnh mặt sau CMT / CCCD",
                          ),
                        ),
                      ).then((value) async {
                        if (value != null && value.length != 0) {
                          controller.imgBackSide = value[0];
                          await controller.onUploadFile(value[0], id_back_side_path);
                          controller.idBackSide = controller.filePathTemp;
                          print('2 ${controller.idBackSide}');
                          controller.update();
                        }
                      });
                    },
                    child: controller.imgBackSide != null
                        ? DottedBorder(
                            dashPattern: [6, 6, 6, 6],
                            borderType: BorderType.RRect,
                            color: Colors.black,
                            strokeWidth: 1,
                            radius: Radius.circular(RkDimensions.ONE_UNIT_FONT * 15),
                            child: RkImage.file(
                              controller.imgBackSide,
                              height: RkDimensions.ONE_UNIT_FONT * 120,
                              borderRadius: RkDimensions.ONE_UNIT_FONT * 15,
                            ),
                          )
                        : Container(
                            height: RkDimensions.ONE_UNIT_FONT * 100,
                            width: RkDimensions.ONE_UNIT_FONT * 140,
                            child: RkImage(
                              ImagesPath.img_cccd_2,
                              fit: BoxFit.contain,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        controller.imgFrontError != "" && controller.imgFrontError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.imgFrontError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_EE3439,
                      fontFamily: Roboto,
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                ],
              )
            : SizedBox(),
        controller.imgBackSideError != "" && controller.imgBackSideError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.imgBackSideError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_EE3439,
                      fontFamily: Roboto,
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildInputInfoBank(SignUpStep2Controller controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 15,
        ),
        Container(
          alignment: Alignment.center,
          child: RkText(
            "Thông tin ngân hàng",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: RkDimensions.ONE_UNIT_FONT * 18,
              color: ColorResources.COLOR_515151,
              fontFamily: Roboto,
            ),
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RkText(
              "Tên chủ tài khoản",
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
                  fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                  color: ColorResources.BLACK,
                ),
                hintText: "Nhập tên chủ tài khoản",
                backgroundColor: Colors.transparent,
                controller: controller.accountNameController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.nodeAccountName,
                suffixIcon: controller.accountNameController.text != ""
                    ? GestureDetector(
                        onTap: () {
                          controller.accountNameController.text = "";
                          controller.update();
                        },
                        child: RkImage(
                          ImagesPath.ic_close,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            controller.accountNameError != "" && controller.accountNameError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.accountNameError!,
                        maxLine: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                          color: ColorResources.COLOR_EE3439,
                          fontFamily: Roboto,
                        ),
                      ),
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RkText(
              "Ngân hàng",
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
              padding: EdgeInsets.symmetric(
                horizontal: RkDimensions.ONE_UNIT_FONT * 15,
                vertical: RkDimensions.ONE_UNIT_FONT * 5,
              ),
              decoration: BoxDecoration(
                color: ColorResources.COLOR_D0D0D0,
                borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 20),
              ),
              width: RkDimensions.screenSize.width,
              child: DropdownButtonHideUnderline(
                child: controller.listBankResponse != null
                    ? DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          'Tên ngân hàng',
                          style: TextStyle(
                            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controller.listBankResponse!.bank!
                            .map((item) => DropdownMenuItem<Bank>(
                                  value: item,
                                  child: Container(
                                    child: RkText(
                                      item.shortName! + " - " + item.name!,
                                      maxLine: 3,
                                      style: TextStyle(
                                        fontFamily: Roboto,
                                        color: ColorResources.COLOR_515151,
                                        fontWeight: FontWeight.w700,
                                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedBank,
                        onChanged: (Bank? value) {
                          if (value != null) {
                            controller.onUpdateBank(value);
                            // controller.bankName = value;
                            // controller.update();
                          }
                        },
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                          iconSize: RkDimensions.ONE_UNIT_FONT * 20,
                        ),
                        buttonStyleData: const ButtonStyleData(height: 40, width: 140),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                          ),
                        ),
                      )
                    : DropdownButton(
                        items: [
                          DropdownMenuItem<String>(
                            value: "1",
                            child: Center(
                              child: Text("NO_BANK"),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        hint: Text("Chọn ngân hàng"),
                      ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RkText(
              "Số tài khoản",
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
                  fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                  color: ColorResources.BLACK,
                ),
                hintText: "Nhập số tài khoản",
                backgroundColor: Colors.transparent,
                controller: controller.numberCardController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: controller.nodeNumberCard,
                suffixIcon: controller.numberCardController.text != ""
                    ? GestureDetector(
                        onTap: () {
                          controller.numberCardController.text = "";
                          controller.update();
                        },
                        child: RkImage(
                          ImagesPath.ic_close,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            controller.numberCardError != "" && controller.numberCardError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.numberCardError!,
                        maxLine: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                          color: ColorResources.COLOR_EE3439,
                          fontFamily: Roboto,
                        ),
                      ),
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RkText(
              "Chi nhánh",
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
                  fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                  color: ColorResources.BLACK,
                ),
                hintText: "Nhập chi nhánh ngân hàng",
                backgroundColor: Colors.transparent,
                controller: controller.branchBankController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.nodeBranchBank,
                suffixIcon: controller.branchBankController.text != ""
                    ? GestureDetector(
                        onTap: () {
                          controller.branchBankController.text = "";
                          controller.update();
                        },
                        child: RkImage(
                          ImagesPath.ic_close,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            controller.branchBankError != "" && controller.branchBankError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.branchBankError!,
                        maxLine: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                          color: ColorResources.COLOR_EE3439,
                          fontFamily: Roboto,
                        ),
                      ),
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_FONT * 10,
        ),
      ],
    );
  }

  Widget buildButtonRegister(SignUpStep2Controller controller) {
    return Column(
      children: [
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        Center(
          child: RkButton(
            onTap: () {
              // if (controller.isStep2 == false) {
              //   controller.onChangeStep2();
              // } else {
              //   controller.onSignUp();
              // }
              controller.onSignUp();
              // controller.isStep2 = !controller.isStep2;
              controller.update();
            },
            label: "Tạo tài khoản",
            labelStyle: TextStyle(
              fontFamily: Roboto,
              fontWeight: FontWeight.w700,
              fontSize: RkDimensions.ONE_UNIT_FONT * 22,
              color: ColorResources.WHITE,
            ),
            padding: EdgeInsets.zero,
            colorBG: ColorResources.COLOR_F58E16,
            colorDisible: ColorResources.GREY,
            borderRadius: RkDimensions.ONE_UNIT_FONT * 30,
            width: RkDimensions.screenSize.width * 0.9,
            height: RkDimensions.ONE_UNIT_FONT * 58,
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
      ],
    );
  }

  Widget buildInputDateRangeAndIssuedBy(SignUpStep2Controller controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RkText(
                    "Ngày cấp",
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
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
                      child: TextFieldDatePicker(
                        colorBorderFocus: Colors.transparent,
                        colorBorderDisable: Colors.transparent,
                        colorBorderEnable: Colors.transparent,
                        hintText: "dd/mm/yy",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                          color: ColorResources.COLOR_929292,
                          fontFamily: Roboto,
                        ),
                        initialDateTime: DateTime.now(),
                        maxDateTime: DateTime.now(),
                        maximumDateTime: DateTime.now(),
                        minimumDateTime: DateTime(1950, 01, 01),
                        mode: CupertinoDatePickerMode.date,
                        controller: controller.dateRangeController,
                        onDateChanged: (datetime) {
                          controller.dateRangeController.text = DateFormat('yyyy-MM-dd').format(datetime);
                          controller.update();
                        },
                        backgroundColor: Colors.transparent,
                        textStyle: TextStyle(
                          fontFamily: Roboto,
                          fontWeight: FontWeight.w500,
                          fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                          color: ColorResources.BLACK,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: RkDimensions.ONE_UNIT_SIZE * 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RkText(
                    "Nơi cấp",
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
                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                        color: ColorResources.BLACK,
                      ),
                      hintText: "Nơi cấp",
                      backgroundColor: Colors.transparent,
                      controller: controller.issuedByController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      focusNode: controller.nodeIssuedBy,
                      suffixIcon: controller.issuedByController.text != ""
                          ? GestureDetector(
                              onTap: () {
                                controller.issuedByController.text = "";
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
          ],
        ),
        controller.dateRangeError != "" && controller.dateRangeError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.dateRangeError!,
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
        controller.issuedByError != "" && controller.issuedByError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.issuedByError!,
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

  Widget buildInputCccd(SignUpStep2Controller controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RkText(
          "Số chứng minh thư / CCCD",
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
              fontSize: RkDimensions.ONE_UNIT_FONT * 15,
              color: ColorResources.BLACK,
            ),
            hintText: "Nhập số CMT / CCCD ",
            backgroundColor: Colors.transparent,
            controller: controller.cccdController,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            // focusNode: controller.nodeCccd,
            onSubmitted: (val) {
              controller.onCheckDuplicateID(val);
            },
            onFocused: (val) {
              if (val == false) {
                controller.onCheckDuplicateID(controller.cccdController.text);
              }
            },
            suffixIcon: controller.cccdController.text != ""
                ? GestureDetector(
                    onTap: () {
                      controller.cccdController.text = "";
                      controller.update();
                    },
                    child: RkImage(
                      ImagesPath.ic_close,
                    ),
                  )
                : SizedBox(),
          ),
        ),
        controller.cccdError != "" && controller.cccdError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.cccdError!,
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

  Widget buildInputAddress(SignUpStep2Controller controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 5,
          children: [
            RkText(
              "Địa chỉ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                color: ColorResources.COLOR_707070,
                fontFamily: Roboto,
              ),
            ),
            RkText(
              "(Không bắt buộc) ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                color: ColorResources.COLOR_F13A3A,
                fontFamily: Roboto,
              ),
            ),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: RkDimensions.ONE_UNIT_FONT * 15,
            vertical: RkDimensions.ONE_UNIT_FONT * 5,
          ),
          width: RkDimensions.screenSize.width,
          decoration: BoxDecoration(
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
            borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 30),
          ),
          child: DropdownButtonHideUnderline(
            child:
                // controller.mCity != null
                controller.listProvinceResponse != null
                    ? DropdownButton2(
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          'Tỉnh / thành phố',
                          style: TextStyle(
                            fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        // value: controller.selectedCity,
                        items: controller.listProvinceResponse!.province!
                            .map((value) => DropdownMenuItem<Province>(
                                  value: value,
                                  child: Container(
                                    child: RkText(
                                      value.name,
                                      maxLine: 3,
                                      style: TextStyle(
                                        fontFamily: Roboto,
                                        color: ColorResources.COLOR_515151,
                                        fontWeight: FontWeight.w700,
                                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedCity,
                        // value: controller.city != null || controller.city != "" ? controller.city : "",
                        onChanged: (Province? value) {
                          if (value != null) {
                            controller.onUpdateCity(
                              value,
                              value.code!,
                            );
                          }
                        },
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                          iconSize: RkDimensions.ONE_UNIT_FONT * 20,
                        ),
                        buttonStyleData: const ButtonStyleData(height: 40, width: 140),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                          ),
                        ),
                      )
                    : DropdownButton(
                        isExpanded: true,
                        // isDense: true,
                        items: [
                          DropdownMenuItem<String>(
                            value: "1",
                            child: Center(
                              child: Text("NO_CITY"),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        hint: Text("Chọn tỉnh - thành phố"),
                      ),
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: RkDimensions.ONE_UNIT_FONT * 15,
            vertical: RkDimensions.ONE_UNIT_FONT * 5,
          ),
          width: RkDimensions.screenSize.width,
          decoration: BoxDecoration(
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
            borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 30),
          ),
          child: DropdownButtonHideUnderline(
            child: controller.listDistrictByProvinceResponse != null
                ? DropdownButton2(
                    isExpanded: true,
                    isDense: true,
                    hint: Text(
                      'Quận / huyện',
                      style: TextStyle(
                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.listDistrictByProvinceResponse!.district!
                        .map((item) => DropdownMenuItem<District>(
                              value: item,
                              child: Container(
                                child: RkText(
                                  item.name,
                                  style: TextStyle(
                                    fontFamily: Roboto,
                                    color: ColorResources.COLOR_515151,
                                    fontWeight: FontWeight.w700,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedDistrict,
                    onChanged: (District? value) {
                      if (value != null) {
                        controller.onUpdateDistrict(value, value.code!);
                        // controller.district = value;
                        controller.update();
                      }
                    },
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black45,
                      ),
                      iconSize: RkDimensions.ONE_UNIT_FONT * 20,
                    ),
                    buttonStyleData: const ButtonStyleData(height: 40, width: 140),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                      ),
                    ),
                  )
                : DropdownButton(
                    items: [
                      DropdownMenuItem<String>(
                        value: "1",
                        child: Center(
                          child: Text(""),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: Text("Quận / huyện"),
                  ),
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        Container(
          width: RkDimensions.screenSize.width,
          padding: EdgeInsets.symmetric(
            horizontal: RkDimensions.ONE_UNIT_FONT * 15,
            vertical: RkDimensions.ONE_UNIT_FONT * 5,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ColorResources.COLOR_DBDBDB),
            borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 30),
          ),
          child: DropdownButtonHideUnderline(
            child: controller.listWardByDistrictResponse != null
                ? DropdownButton2(
                    isExpanded: true,
                    isDense: true,
                    hint: Text(
                      'Phường / xã',
                      style: TextStyle(
                        fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.listWardByDistrictResponse!.ward!
                        .map((item) => DropdownMenuItem<Ward>(
                              value: item,
                              child: Container(
                                child: RkText(
                                  item.name,
                                  style: TextStyle(
                                    fontFamily: Roboto,
                                    color: ColorResources.COLOR_515151,
                                    fontWeight: FontWeight.w700,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedWard,
                    onChanged: (Ward? value) {
                      if (value != null) {
                        controller.onUpdateWard(value);
                      }
                    },
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black45,
                      ),
                      iconSize: RkDimensions.ONE_UNIT_FONT * 20,
                    ),
                    buttonStyleData: const ButtonStyleData(height: 40, width: 140),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                      ),
                    ),
                  )
                : DropdownButton(
                    items: [
                      DropdownMenuItem<String>(
                        value: "1",
                        child: Center(
                          child: Text(""),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: Text("Phường / xã"),
                  ),
          ),
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorResources.COLOR_DBDBDB),
                borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 30),
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
                  fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                  color: ColorResources.BLACK,
                ),
                hintText: "Địa chỉ chi tiết",
                backgroundColor: Colors.transparent,
                controller: controller.addressController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.nodeAddress,
                maxLine: 4,
                suffixIcon: controller.addressController.text != ""
                    ? GestureDetector(
                        onTap: () {
                          controller.addressController.text = "";
                          controller.update();
                        },
                        child: RkImage(
                          ImagesPath.ic_close,
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            controller.cityError != "" && controller.cityError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.cityError!,
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
            controller.districtError != "" && controller.districtError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.districtError!,
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
            controller.wardsError != "" && controller.wardsError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.wardsError!,
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
            controller.addressError != "" && controller.addressError != null
                ? Column(
                    children: [
                      SizedBox(
                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                      ),
                      RkText(
                        "*" + controller.addressError!,
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
        ),
      ],
    );
  }

  Widget buildInputBirthday(SignUpStep2Controller controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 5,
          children: [
            RkText(
              "Ngày sinh",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                color: ColorResources.COLOR_707070,
                fontFamily: Roboto,
              ),
            ),
            RkText(
              "(Không bắt buộc) ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                color: ColorResources.COLOR_F13A3A,
                fontFamily: Roboto,
              ),
            ),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorResources.COLOR_DBDBDB),
              borderRadius: BorderRadius.circular(
                RkDimensions.ONE_UNIT_FONT * 30,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: RkDimensions.ONE_UNIT_SIZE * 15,
              horizontal: RkDimensions.ONE_UNIT_SIZE * 5,
            ),
            child: TextFieldDatePicker(
              colorBorderFocus: Colors.transparent,
              colorBorderDisable: Colors.transparent,
              colorBorderEnable: Colors.transparent,
              hintText: "Ngày tháng năm sinh",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                color: ColorResources.COLOR_929292,
                fontFamily: Roboto,
              ),
              initialDateTime: DateTime.now(),
              maxDateTime: DateTime.now(),
              maximumDateTime: DateTime.now(),
              minimumDateTime: DateTime(1950, 01, 01),
              mode: CupertinoDatePickerMode.date,
              controller: controller.birthdayTextEditingController,
              onDateChanged: (datetime) {
                controller.birthdayTextEditingController.text = DateFormat('yyyy-MM-d').format(datetime);
                controller.update();
              },
              backgroundColor: Colors.transparent,
              textStyle: TextStyle(
                fontFamily: Roboto,
                fontWeight: FontWeight.w500,
                fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                color: ColorResources.BLACK,
              ),
            ),
          ),
        ),
        controller.birthdayError != "" && controller.birthdayError != null
            ? Column(
                children: [
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                  RkText(
                    "*" + controller.birthdayError!,
                    maxLine: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                      color: ColorResources.COLOR_EE3439,
                      fontFamily: Roboto,
                    ),
                  ),
                  SizedBox(
                    height: RkDimensions.ONE_UNIT_SIZE * 10,
                  ),
                ],
              )
            : SizedBox(),
      ],
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
