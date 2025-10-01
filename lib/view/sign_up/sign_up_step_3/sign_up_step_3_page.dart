import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:template/base_widget/rk_file.dart';

import '../../../base_widget/background/background_gradient.dart';
import '../../../base_widget/rk_button.dart';
import '../../../base_widget/rk_image.dart';
import '../../../base_widget/rk_screen.dart';
import '../../../base_widget/rk_text.dart';
import '../../../base_widget/text_field_customize.dart';
import '../../../helper/rk_choice.dart';
import '../../../helper/rk_dimensions.dart';
import '../../../helper/text_field_date_picker.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/fonts.dart';
import '../../../utils/images_path.dart';
import 'sign_up_step_3_controller.dart';

class SignUpStep3Page extends GetView<SignUpStep3Controller> {
  @override
  Widget build(BuildContext context) {
    return RkScreen(
      background: BackgroundGradient(),
      body: GetBuilder(
        init: SignUpStep3Controller(),
        builder: (SignUpStep3Controller controller) {
          return Container(
            padding: EdgeInsets.only(
              top: RkDimensions.ONE_UNIT_SIZE * 5,
              // left: RkDimensions.ONE_UNIT_SIZE * 22,
              // right: RkDimensions.ONE_UNIT_SIZE * 22,
            ),
            // height: Get.height * 0.9,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 20),
                  child: buildHeader(),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    // height: Get.height * 0.9,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: RkDimensions.ONE_UNIT_FONT * 20,
                      vertical: RkDimensions.ONE_UNIT_FONT * 10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorResources.COLOR_D9D9D9,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(RkDimensions.ONE_UNIT_FONT * 40),
                        topLeft: Radius.circular(RkDimensions.ONE_UNIT_FONT * 40),
                      ),
                    ),
                    child: Column(
                      children: [
                        RkText(
                          "Thông tin doanh nghiệp",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: RkDimensions.ONE_UNIT_FONT * 18,
                            color: ColorResources.COLOR_515151,
                            fontFamily: Roboto,
                          ),
                        ),
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Tên tổ chức / công ty / doanh nghiệp",
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
                                hintText: "Nhập tên",
                                backgroundColor: Colors.transparent,
                                controller: controller.nameCompanyTextEditingController,
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                focusNode: controller.nodeNameCompany,
                                suffixIcon: controller.nameCompanyTextEditingController.text != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.nameCompanyTextEditingController.text = "";
                                          controller.update();
                                        },
                                        child: RkImage(
                                          ImagesPath.ic_close,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                            controller.nameCompanyError != "" && controller.nameCompanyError != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.nameCompanyError!,
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
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Mã số doanh nghiệp / mã số thuế",
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
                                hintText: "Nhập mã số thuế",
                                backgroundColor: Colors.transparent,
                                controller: controller.taxCodeTextEditingController,
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                focusNode: controller.nodeTaxCode,
                                onSubmitted: (val) {
                                  controller.onCheckDuplicateTaxRequest(val);
                                },
                                onFocused: (val) {
                                  if (val == false) {
                                    controller.onCheckDuplicateTaxRequest(controller.taxCodeTextEditingController.text);
                                  }
                                },
                                suffixIcon: controller.taxCodeTextEditingController.text != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.taxCodeTextEditingController.text = "";
                                          controller.update();
                                        },
                                        child: RkImage(
                                          ImagesPath.ic_close,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                            controller.taxCodeError != "" && controller.taxCodeError != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.taxCodeError!,
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
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Ngày cấp mã số thuế",
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
                                  controller: controller.dateRangTaxCodeTextEditingController,
                                  onDateChanged: (datetime) {
                                    controller.dateRangTaxCodeTextEditingController.text = DateFormat('yyyy-MM-dd').format(datetime);
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
                            controller.dateRangTaxCodeError != "" && controller.dateRangTaxCodeError != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.dateRangTaxCodeError!,
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
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
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
                                hintText: "Nơi cấp mã số ",
                                backgroundColor: Colors.transparent,
                                controller: controller.issuedByTextEditingController,
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                focusNode: controller.nodeIssuedBy,
                                suffixIcon: controller.issuedByTextEditingController.text != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.issuedByTextEditingController.text = "";
                                          controller.update();
                                        },
                                        child: RkImage(
                                          ImagesPath.ic_close,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
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
                        ),
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Địa chỉ tổ chức",
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
                                maxLine: 3,
                                hintText: "Địa chỉ doanh nghiệp ",
                                backgroundColor: Colors.transparent,
                                controller: controller.addressCompanyTextEditingController,
                                textInputType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                focusNode: controller.nodeAddressCompany,
                                suffixIcon: controller.addressCompanyTextEditingController.text != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          controller.addressCompanyTextEditingController.text = "";
                                          controller.update();
                                        },
                                        child: RkImage(
                                          ImagesPath.ic_close,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                            controller.addressCompanyError != "" && controller.addressCompanyError != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.addressCompanyError!,
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
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Tải lên giấy chứng nhận đăng ký kinh doanh",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                            RkText(
                              "( Đinh dạng .pdf )",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                            SizedBox(
                              height: RkDimensions.ONE_UNIT_FONT * 10,
                            ),
                            // Row(
                            //   children: [
                            //     RkImage(
                            //       ImagesPath.img_import_pdf,
                            //       height: RkDimensions.ONE_UNIT_FONT * 45,
                            //       width: RkDimensions.ONE_UNIT_FONT * 45,
                            //     ),
                            //     SizedBox(
                            //       width: RkDimensions.ONE_UNIT_FONT * 10,
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           color: ColorResources.COLOR_D0D0D0,
                            //           borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 20),
                            //         ),
                            //         height: RkDimensions.ONE_UNIT_FONT * 50,
                            //         padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 15),
                            //         alignment: Alignment.centerLeft,
                            //         child: RkText(
                            //           "2",
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.w400,
                            //             fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            //             color: ColorResources.COLOR_929292,
                            //             fontFamily: Roboto,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Container(
                              child: RkFile.file(
                                onPikerFile: (val) async {
                                  // controller.filePathTemp = '';
                                  await controller.onUploadFile(val!);
                                  controller.pathFile1 = controller.filePathTemp;
                                  controller.update();
                                  print("hihii1 ${controller.pathFile1}");
                                },
                              ),
                            ),
                            controller.pathFile1Error != "" && controller.pathFile1Error != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.pathFile1Error!,
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
                        SizedBox(
                          height: RkDimensions.ONE_UNIT_SIZE * 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RkText(
                              "Tải lên giấy tờ khác",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                            RkText(
                              "( Đinh dạng .pdf )",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                color: ColorResources.COLOR_515151,
                                fontFamily: Roboto,
                              ),
                            ),
                            SizedBox(
                              height: RkDimensions.ONE_UNIT_FONT * 10,
                            ),
                            // Row(
                            //   children: [
                            //     RkImage(
                            //       ImagesPath.img_import_pdf,
                            //       height: RkDimensions.ONE_UNIT_FONT * 45,
                            //       width: RkDimensions.ONE_UNIT_FONT * 45,
                            //     ),
                            //     SizedBox(
                            //       width: RkDimensions.ONE_UNIT_FONT * 10,
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           color: ColorResources.COLOR_D0D0D0,
                            //           borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 20),
                            //         ),
                            //         height: RkDimensions.ONE_UNIT_FONT * 50,
                            //         padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 15),
                            //         alignment: Alignment.centerLeft,
                            //         child: RkText(
                            //           "2",
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.w400,
                            //             fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                            //             color: ColorResources.COLOR_929292,
                            //             fontFamily: Roboto,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            controller.filePath != []
                                ? Container(
                                    child: ListView.builder(
                                      itemBuilder: (BuildContext context, int i) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                            bottom: RkDimensions.ONE_UNIT_FONT * 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: RkText(
                                                  controller.filePath[i].split('/').last.toString(),
                                                  maxLine: 2,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: RkDimensions.ONE_UNIT_FONT * 15,
                                                    color: ColorResources.COLOR_515151,
                                                    fontFamily: Roboto,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.filePath.remove(controller.filePath[i]);
                                                  controller.update();
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  size: RkDimensions.ONE_UNIT_FONT * 30,
                                                  color: ColorResources.COLOR_515151,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: controller.filePath.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              child: RkFile.file(
                                isShowFileName: false,
                                onPikerFile: (val) async {
                                  // controller.filePath.clear();
                                  // controller.filePathTemp = '';
                                  await controller.onUploadFile(val!);
                                  controller.pathFile2 = controller.filePathTemp;
                                  controller.filePath.add(controller.pathFile2);
                                  controller.update();
                                  print("hihii ${controller.filePath.toString()}");
                                },
                              ),
                            ),
                            controller.pathFile2Error != "" && controller.pathFile2Error != null
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: RkDimensions.ONE_UNIT_SIZE * 10,
                                      ),
                                      RkText(
                                        "*" + controller.pathFile2Error!,
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
                            // buildInputInfoBank(controller, context),
                            // SizedBox(
                            //   height: RkDimensions.ONE_UNIT_FONT * 10,
                            // ),
                            Column(
                              children: [
                                RkChoice(
                                  label: "Tôi đồng ý với những điều khoản của công ty",
                                  isSelected: controller.isSelectedRule1,
                                  labelTextStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: RkDimensions.ONE_UNIT_FONT * 14,
                                    color: ColorResources.COLOR_515151,
                                    fontFamily: Roboto,
                                  ),
                                  onChange: (value) {
                                    controller.isSelectedRule1 = value;
                                  },
                                ),
                                controller.isSelectedRule1Error != "" && controller.isSelectedRule1Error != null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: RkDimensions.ONE_UNIT_SIZE * 10,
                                          ),
                                          RkText(
                                            "*" + controller.isSelectedRule1Error!,
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
                                  height: RkDimensions.ONE_UNIT_SIZE * 10,
                                ),
                                Center(
                                  child: RkButton(
                                    onTap: () {
                                      // controller.onSignUp();
                                    },
                                    label: "Đăng ký tạo tài khoản",
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
                                SizedBox(
                                  height: RkDimensions.ONE_UNIT_SIZE * 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInputInfoBank(SignUpStep3Controller controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 15,
        ),
        Container(
          alignment: Alignment.center,
          child: RkText(
            "Thông tin cá nhân",
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
                child: controller.mBanks.isNotEmpty
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
                        items: controller.mBanks
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    child: RkText(
                                      item,
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
                        value: controller.bankName != null || controller.bankName != "" ? controller.bankName : "",
                        onChanged: (String? value) {
                          if (value != null) {
                            controller.bankName = value;
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

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back(result: true);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: RkDimensions.ONE_UNIT_FONT * 60,
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: RkDimensions.ONE_UNIT_SIZE * 48,
                    color: ColorResources.WHITE,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: RkDimensions.ONE_UNIT_FONT * 35,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: RkText(
                  "Đăng ký",
                  style: TextStyle(
                    fontFamily: Roboto,
                    fontWeight: FontWeight.w600,
                    fontSize: RkDimensions.ONE_UNIT_FONT * 20,
                    color: ColorResources.COLOR_D6B877,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: RkDimensions.ONE_UNIT_SIZE * 20,
        ),
      ],
    );
  }
}
