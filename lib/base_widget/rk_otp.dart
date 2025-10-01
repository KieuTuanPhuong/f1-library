import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:template/base_widget/rk_button.dart';
import 'package:template/base_widget/rk_text.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/fonts.dart';

import '../helper/rk_alert.dart';
import '../helper/rk_dimensions.dart';
import '../helper/rk_validate.dart';

class RkOtp extends StatefulWidget {
  const RkOtp(
      {Key? key,
      this.validate,
      this.onTap,
      this.onTapSendSMS,
      this.countDown = 90,
      this.labelSendOtp,
      this.onChanged,
      this.codeLength = 4,
      this.buttonLabel,
      this.isEnabled = false,
      this.lables = const [],
      this.colorSMS = ColorResources.highlight,
      this.colorBG,
      this.colorTextBt,
      this.hasCountDown = true,
      this.obscureText,
      this.validateOtp = false})
      : super(key: key);
  final List<Widget>? lables;
  final bool Function()? validate;
  final Function? onTap;
  final Function? onTapSendSMS;
  final Color? colorSMS;
  final Color? colorBG;
  final Color? colorTextBt;
  final Function(String?)? onChanged;
  final String? labelSendOtp;
  final int? countDown;
  final int codeLength;
  final String? buttonLabel;
  final bool? isEnabled;
  final bool? hasCountDown;
  final bool? obscureText;
  final bool? validateOtp;

  @override
  _RkOtpState createState() => _RkOtpState();
}

class _RkOtpState extends State<RkOtp> {
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = true;
  bool isCountDown = true;
  Timer? _timer;
  int count = 90;
  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    isCountDown = widget.hasCountDown!;
    errorController = StreamController<ErrorAnimationType>();
    textEditingController = TextEditingController();
    count = widget.countDown!;
    if (widget.hasCountDown!) {
      countDown();
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    errorController?.close();
    super.dispose();
  }

  bool validateOTP() {
    if (textEditingController?.text.length != widget.codeLength) {
      errorController!.add(ErrorAnimationType.shake);
      return true;
    } else {
      return false;
    }
  }

  void onTap() {
    if (!RkValidate.nullOrEmpty(widget.validate)) {
      hasError = widget.validate!();
    } else {
      hasError = validateOTP();
    }
    if (hasError == true && !Get.isSnackbarOpen) {
      return RkAlert.error(message: "Mã xác thực phải ít nhất ${widget.codeLength} số");
    }
    if (!RkValidate.nullOrEmpty(widget.onTap) && widget.isEnabled!) {
      widget.onTap!();
    }
  }

  void onTapSendOTP() {
    if (!RkValidate.nullOrEmpty(widget.onTapSendSMS) && count <= 0) {
      widget.onTapSendSMS!();
      isCountDown == true;
      count = widget.countDown!;
      if (widget.hasCountDown!) {
        countDown();
      }
    }
  }

  void countDown() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer timer) => setState(
        () {
          if (count < 1) {
            timer.cancel();
            isCountDown = false;
          } else {
            count = count - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: RkDimensions.screenSize.width * 2,
      //height: RkDimensions.screenSize.height ,
      child: Column(
        children: [
          if (!RkValidate.nullOrEmpty(widget.lables)) ...widget.lables!,
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                  // horizontal: RkDimensions.ONE_UNIT_SIZE * 60,
                  //vertical: RkDimensions.SPACE_SIZE_4X,
                  ),
              child: PinCodeTextField(
                appContext: context,
                length: widget.codeLength,
                obscureText: widget.obscureText ?? false,
                // obscuringCharacter: '*',
                blinkWhenObscuring: false,
                animationType: AnimationType.fade,
                autoDismissKeyboard: false,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 20),
                  fieldHeight: RkDimensions.ONE_UNIT_SIZE * (160 - (14.5 * widget.codeLength)),
                  fieldWidth: RkDimensions.ONE_UNIT_SIZE * (140 - (11.5 * widget.codeLength)),
                  activeFillColor: Colors.white,
                  selectedFillColor: ColorResources.WHITE,
                  disabledColor: ColorResources.COLOR_ABABAB,
                  selectedColor: ColorResources.COLOR_F58E16,
                  errorBorderColor: ColorResources.COLOR_ABABAB,
                  activeColor: ColorResources.COLOR_F58E16,
                  inactiveColor: ColorResources.COLOR_ABABAB,
                  inactiveFillColor: ColorResources.WHITE,
                ),
                cursorColor: ColorResources.COLOR_F58E16,
                animationDuration: const Duration(
                  milliseconds: 300,
                ),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  // controller.onBtnCompleteTap();
                  hasError = validateOTP();
                },
                onSubmitted: (value) {
                  hasError = validateOTP();
                },
                onChanged: (val) {
                  if (!RkValidate.nullOrEmpty(widget.onChanged)) {
                    widget.onChanged!(val);
                  }
                },
                beforeTextPaste: (text) {
                  return true;
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: RkDimensions.ONE_UNIT_SIZE * 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RkText(
                  "Mã xác minh hết hạn trong",
                  style: TextStyle(fontSize: RkDimensions.ONE_UNIT_SIZE * 23, color: ColorResources.BLACK),
                ),
                SizedBox(
                  width: RkDimensions.ONE_UNIT_SIZE * 10,
                ),
                Container(
                  // margin: EdgeInsets.only(
                  //   // left: RkDimensions.SPACE_SIZE_1X,
                  //   // top: RkDimensions.SPACE_SIZE_3X,
                  // ),
                  child: RkText(
                    "${(count ~/ 60) > 0 ? '${count ~/ 60}:' : ''}${count.toInt() % 60}s",
                    style: TextStyle(
                      fontSize: RkDimensions.ONE_UNIT_SIZE * 24,
                      color: widget.colorSMS ?? ColorResources.highlight,
                      fontFamily: Barlow,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Container(
          //       margin: EdgeInsets.symmetric(
          //         vertical: RkDimensions.ONE_UNIT_SIZE * 20,
          //       ),
          //       height: RkDimensions.ONE_UNIT_SIZE * 48,
          //       child: RkButton(
          //         margin: EdgeInsets.symmetric(
          //           horizontal: RkDimensions.SPACE_SIZE_5X,
          //         ),
          //         colorBG: ColorResources.BT_CONFIRM,
          //         color: ColorResources.WHITE,
          //         isEnabled: widget.hasCountDown! ?  isCountDown : true ,
          //         label: widget.buttonLabel ?? "Tiếp tục",
          //         borderRadius: RkDimensions.BORDER_RADIUS_6X * 2,
          //         // padding: EdgeInsets.symmetric(
          //         //   horizontal: RkDimensions.ONE_UNIT_SIZE * 50,
          //         //   vertical: RkDimensions.ONE_UNIT_SIZE * 20,
          //         // ),
          //         onTap: () {
          //           onTap();
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            // margin: EdgeInsets.symmetric(
            //   vertical: RkDimensions.ONE_UNIT_SIZE * 20,
            // ),
            // height: RkDimensions.ONE_UNIT_SIZE * 90,
            child: Center(
              child: RkButton(
                margin: EdgeInsets.symmetric(
                  horizontal: RkDimensions.SPACE_SIZE_5X,
                ),
                height: RkDimensions.ONE_UNIT_SIZE * 80,
                width: RkDimensions.ONE_UNIT_SIZE * 250,
                colorBG: hasError == true ? ColorResources.GREY : ColorResources.COLOR_F58E16,
                color: widget.colorTextBt ?? ColorResources.WHITE,
                isEnabled: count <= 0 ? false : true,
                label: widget.buttonLabel ?? "Tiếp tục",
                labelStyle: TextStyle(
                  fontSize: RkDimensions.ONE_UNIT_SIZE * 26,
                  color: ColorResources.WHITE,
                  fontFamily: Barlow,
                  fontWeight: FontWeight.w700,
                ),
                borderRadius: RkDimensions.BORDER_RADIUS_6X * 2,
                // padding: EdgeInsets.symmetric(
                //   horizontal: RkDimensions.ONE_UNIT_SIZE * 50,
                //   vertical: RkDimensions.ONE_UNIT_SIZE * 20,
                // ),
                onTap: () {
                  onTap();
                },
              ),
            ),
          ),
          SizedBox(
            height: RkDimensions.ONE_UNIT_SIZE * 25,
          ),
          GestureDetector(
            onTap: () {
              onTapSendOTP();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: RkDimensions.ONE_UNIT_SIZE * 25,
              ),
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(
              //       color: count <= 0 ? ColorResources.highlight : ColorResources.GREY,
              //       width: RkDimensions.ONE_UNIT_SIZE * 1.5, // Underline thickness
              //     ),
              //   ),
              // ),
              child: RkText(
                "Gửi lại code",
                style: TextStyle(
                  fontSize: RkDimensions.ONE_UNIT_SIZE * 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: Barlow,
                  fontStyle: FontStyle.italic,
                  color: count <= 0 ? ColorResources.highlight : ColorResources.GREY,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
