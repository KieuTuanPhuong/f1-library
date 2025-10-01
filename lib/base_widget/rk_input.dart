import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:template/theme/app_theme.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/style.dart';

import '../helper/rk_date.dart';
import '../helper/rk_dimensions.dart';
import '../helper/rk_number.dart';
import '../helper/rk_other.dart';
import '../helper/rk_validate.dart';
import 'rk_text.dart';

// Text, number, tiền đều có thể hiện thị defaul = text
// PrefixIcon
// Lable bên trên có thể không (Có thể null)
// Label trên border (Có thể có or null)
// Có bắt phải nhập hay không
// Validate EditText -> Fail hiển thị error label
// Sufix label nếu nó là tiền (Nếu là tiền hiện thị thêm icon tiền)
//

enum RkInputType { TEXT, PASSWORD, NUMBER, DOUBLE, PRICE, EMAIL, PHONE, INCREMENT, WEIGHT }

enum RkPickerDate {
  MATERIAL,
  CUPERTINO,
}

class RkInput extends StatefulWidget {
  RkInput(
      {Key? key,
      this.label,
      this.placeHolder,
      this.allowEdit = true,
      this.maxLine = 1,
      required this.type,
      this.isRequired = false,
      this.width,
      this.fontSize,
      this.height,
      this.suffixIcon,
      this.paddingTop,
      this.errorText,
      this.textInputAction,
      this.onChanged,
      this.isValidate,
      this.focusNode,
      this.padding,
      this.onSubmitted,
      this.borderRadius,
      this.hintStyle,
      this.borderSide,
      this.isBorder = false,
      this.fillColor,
      this.prefixIcon,
      this.validate,
      this.isLegend = false,
      this.borderSize,
      this.disbleError = false,
      this.miniSize = false,
      this.colorDisibleBorder = ColorResources.GREY,
      this.colorBorder,
      this.min = 1,
      this.max = 10,
      this.widthIncrement,
      this.isDatePicker = false,
      this.iziPickerDate = RkPickerDate.MATERIAL,
      this.obscureText,
      this.initValue,
      this.contentPaddingIncrement,
      this.onTapIncrement,
      this.onTapReduction,
      this.cursorColor = ColorResources.BLACK,
      this.textHintColor = ColorResources.GREY,
      this.textColor = ColorResources.BLACK,
      this.style,
      this.showClearText = false,
      this.isTextCenter = false,
      this.minLine = 1,
      this.readOnly = false,
      this.suffixText})
      : super(key: key);
  final String? label;
  final String? placeHolder;
  final bool? allowEdit;
  final bool? showClearText;
  final int? maxLine;
  final RkInputType type;
  final bool? isRequired;
  final double? width;
  final double? fontSize;
  final double? height;
  final Widget? suffixIcon;
  final double? paddingTop;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged;
  final Function(bool value)? isValidate;
  bool? boldHinText;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final Function(dynamic)? onSubmitted;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final BorderSide? borderSide;
  final bool? isBorder;
  final Color? fillColor;
  final Widget? prefixIcon;
  final String? Function(String)? validate;
  final bool? isLegend;
  final double? borderSize;
  final bool disbleError;
  final bool miniSize;
  final Color? colorDisibleBorder;
  final Color? colorBorder;
  final double? min;
  final double? max;
  final double? widthIncrement;
  final bool? isDatePicker;
  final RkPickerDate? iziPickerDate;
  final bool? obscureText;
  final String? initValue;
  final EdgeInsets? contentPaddingIncrement;
  final Function? onTapIncrement;
  final Function? onTapReduction;
  final Color? cursorColor;
  final Color? textHintColor;
  final Color? textColor;
  final bool isTextCenter;
  final int? minLine;
  final bool readOnly;
  final String? suffixText;

  // _RkInputState iziState = _RkInputState();

  @override
  _RkInputState createState() => _RkInputState();
}

class _RkInputState extends State<RkInput> {
  FocusNode? focusNode;
  TextEditingController? textEditingController;
  // MoneyMaskedTextController? numberEditingController;
  // MoneyMaskedTextController? doubleEditingController;

  bool isShowedError = false;
  bool isVisible = true;
  bool isDisibleIncrement = false;
  bool isDisibleReduction = false;
  String? _errorText = "";

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController(text: widget.initValue ?? '');
    //TODO: fork lại fackage của họ, Thêm try catch
    // Khởi tạo lại NumberController set IniitValue
    // try {
    //   if (widget.type == RkInputType.INCREMENT) {
    //     numberEditingController = MoneyMaskedTextController(
    //       initialValue: RkNumber.parseDouble(widget.initValue ?? widget.min.toString()),
    //       precision: 0,
    //       decimalSeparator: '',
    //     );
    //   } else {
    //     numberEditingController = MoneyMaskedTextController(
    //       initialValue: RkNumber.parseDouble(widget.initValue ?? 0),
    //       precision: 0,
    //       decimalSeparator: '',
    //     );
    //   }
    // } on Exception catch (_) {
    //   numberEditingController = MoneyMaskedTextController(
    //     initialValue: 0.0,
    //     precision: 0,
    //     decimalSeparator: '',
    //   );
    // }
    //
    // doubleEditingController = MoneyMaskedTextController(
    //   precision: 1,
    // );
    //
    // focusNode = widget.focusNode ?? FocusNode();
    // if (widget.type == RkInputType.INCREMENT) {
    //   checkDisibleIncrement(RkNumber.parseInt(numberEditingController!.text));
    // }
    // else if (widget.type == RkInputType.NUMBER || widget.type == RkInputType.PRICE) {
    //   numberEditingController!.clear();
    //   doubleEditingController!.clear();
    // }

    // onSetValue();
  }

  @override
  void dispose() {
    focusNode?.dispose();
    textEditingController?.dispose();
    // numberEditingController?.dispose();
    // doubleEditingController?.dispose();
    super.dispose();
  }

  void setValue(dynamic newValue) {
    if (!RkValidate.nullOrEmpty(newValue) && widget.type == RkInputType.NUMBER ||
        !RkValidate.nullOrEmpty(newValue) && widget.type == RkInputType.PRICE ||
        !RkValidate.nullOrEmpty(newValue) && widget.type == RkInputType.DOUBLE) {
      // numberEditingController = MoneyMaskedTextController(
      //   initialValue: RkNumber.parseDouble(newValue.toString()),
      //   precision: 0,
      //   decimalSeparator: '',
      // );
      // doubleEditingController = MoneyMaskedTextController(
      //   initialValue: RkNumber.parseDouble(newValue.toString()),
      //   precision: 1,
      //);
    } else {
      textEditingController!.text = newValue.toString();
    }
    setState(() {});
  }

  TextInputType getType(RkInputType type) {
    if (type == RkInputType.NUMBER) {
      return TextInputType.number;
    } else if (type == RkInputType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (type == RkInputType.PRICE) {
      return TextInputType.number;
    } else if (type == RkInputType.TEXT) {
      return TextInputType.text;
    } else if (type == RkInputType.EMAIL) {
      return TextInputType.emailAddress;
    } else if (type == RkInputType.PHONE) {
      return TextInputType.phone;
    } else if (type == RkInputType.DOUBLE) {
      return TextInputType.numberWithOptions();
    } else if (type == RkInputType.INCREMENT) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  TextEditingController getController(RkInputType type) {
    if (type == RkInputType.NUMBER) {
      // return numberEditingController!;
    } else if (type == RkInputType.PASSWORD) {
      return textEditingController!;
    } else if (type == RkInputType.PRICE) {
      // return numberEditingController!;
    } else if (type == RkInputType.TEXT) {
      return textEditingController!;
    } else if (type == RkInputType.EMAIL) {
      return textEditingController!;
    } else if (type == RkInputType.PHONE) {
      return textEditingController!;
    } else if (type == RkInputType.DOUBLE) {
      // return doubleEditingController!;
    } else if (type == RkInputType.INCREMENT) {
      // return numberEditingController!;
    }
    return textEditingController!;
  }

  String? Function(String)? checkValidate(
    RkInputType type,
  ) {
    if (widget.validate != null) {
      return widget.validate;
    }
    if (type == RkInputType.NUMBER) {
      return null;
    } else if (type == RkInputType.PASSWORD) {
      return RkValidate.password;
    } else if (type == RkInputType.PRICE) {
      return null;
    } else if (type == RkInputType.TEXT) {
      return null;
    } else if (type == RkInputType.EMAIL) {
      return RkValidate.email;
    } else if (type == RkInputType.PHONE) {
      return RkValidate.phone;
    } else if (type == RkInputType.INCREMENT) {
      return RkValidate.increment;
    }
    return null;
  }

  String getAllowCharacter() {
    if (widget.isTextCenter || widget.type == RkInputType.NUMBER || widget.type == RkInputType.PHONE) {
      // Need to check again
      return "[0-9]";
    } else if (widget.type == RkInputType.WEIGHT) {
      return r'^\d+\.?\d*';
    }
    return '';
  }

  bool isFilterCharacter() {
    return widget.isTextCenter || widget.type == RkInputType.NUMBER || widget.type == RkInputType.PHONE || widget.type == RkInputType.WEIGHT;
  }

  void onIncrement(RkInputType type, {required bool increment}) {
    if (type == RkInputType.INCREMENT) {
      final controller = getController(widget.type);
      if (RkValidate.nullOrEmpty(controller.text)) {
        controller.text = '1';
      }
      int value = int.parse(controller.text);
      if (increment) {
        value++;
        controller.text = value.toString();
        checkDisibleIncrement(value);
      } else {
        validator(widget.type, value.toString());
        if (value > 0) {
          value--;
          controller.text = value.toString();
        }
        checkDisibleIncrement(value);
      }
      if (widget.onChanged != null) {
        widget.onChanged!(value.toString());
        validator(widget.type, value.toString());
      }
    }
  }

  void checkDisibleIncrement(int value) {
    if (value <= widget.min! && !isDisibleReduction) {
      setState(() {
        isDisibleReduction = true;
      });
      return;
    }
    if (value > widget.min! && isDisibleReduction) {
      setState(() {
        isDisibleReduction = false;
      });
      return;
    }
    if (value >= widget.max! && !isDisibleIncrement) {
      setState(() {
        isDisibleIncrement = true;
      });
      return;
    }
    if (value < widget.max! && isDisibleIncrement) {
      setState(() {
        isDisibleIncrement = false;
      });
      return;
    }
  }

  void validator(RkInputType type, String val) {
    if (checkValidate(widget.type) != null && isShowedError) {
      setState(() {
        _errorText = checkValidate(widget.type)!(val.toString());
      });
      if (widget.isValidate != null) {
        widget.isValidate!(!RkValidate.nullOrEmpty(_errorText));
      }
    }
  }

  void datePicker(RkPickerDate pickerType) {
    print("Onlick");
    if (pickerType == RkPickerDate.CUPERTINO) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: ColorResources.WHITE,
          ),
          height: RkDimensions.ONE_UNIT_SIZE * 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
                height: RkDimensions.ONE_UNIT_SIZE * 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (value) {
                      getController(widget.type).text = RkDate.formatDate(value);
                      if (!RkValidate.nullOrEmpty(widget.onChanged)) {
                        widget.onChanged!(RkDate.formatDate(value, format: 'yyyy-MM-dd'));
                      }
                    }),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: RkDimensions.SPACE_SIZE_3X,
                  ),
                  child: Text(
                    "Xác nhận",
                    style: TextStyle(
                      fontSize: RkDimensions.FONT_SIZE_H6,
                      color: ColorResources.CIRCLE_COLOR_BG3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: AppTheme.light.copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorResources.GREEN,
              ),
            ),
            child: child!,
          );
        },
      ).then(
        (value) {
          if (!RkValidate.nullOrEmpty(value)) {
            getController(widget.type).text = RkDate.formatDate(value!);
            if (!RkValidate.nullOrEmpty(widget.onChanged)) {
              widget.onChanged!(RkDate.formatDate(value, format: 'yyyy-MM-dd'));
            }
          }
        },
      );
    }
  }

  Widget? getSuffixIcon() {
    if (widget.isDatePicker! && RkValidate.nullOrEmpty(widget.suffixIcon)) {
      return const Icon(
        Icons.calendar_today,
        color: ColorResources.BLACK,
      );
    }
    if (widget.type == RkInputType.PRICE) {
      return SizedBox.shrink(
        child: Padding(
          padding: EdgeInsets.only(
            right: RkDimensions.SPACE_SIZE_1X,
          ),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text("VNĐ"),
          ),
        ),
      );
    } else if (widget.type == RkInputType.PASSWORD) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Icon(
          isVisible ? Icons.visibility_off : Icons.visibility,
          color: ColorResources.GREY,
        ),
      );
    }
    if (widget.showClearText == true) {
      return GestureDetector(
        onTap: () {
          setValue('');
        },
        child: Icon(
          Icons.cancel_outlined,
          size: RkDimensions.ONE_UNIT_SIZE * 35,
          color: ColorResources.PRIMARY_CONTENT_COLOR,
        ),
      );
    }
    if (!RkValidate.nullOrEmpty(widget.suffixIcon)) {
      return widget.suffixIcon!;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (!focusNode!.hasListeners) {
      focusNode!.addListener(() {
        setState(() {});
      });
    }
    if (!RkValidate.nullOrEmpty(widget.errorText) && RkValidate.nullOrEmpty(_errorText)) {
      _errorText = widget.errorText.toString();
    }
    return Container(
      width: widget.width ?? RkDimensions.screenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.isLegend == false && widget.label != null)
            Container(
              padding: EdgeInsets.only(
                bottom: RkDimensions.SPACE_SIZE_1X,
              ),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: widget.label,
                  children: [
                    if (widget.isRequired!)
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: RkDimensions.FONT_SIZE_SPAN_LARGE,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      )
                    else
                      const TextSpan(),
                  ],
                ),
              ),
            ),
          Row(
            children: [
              if (RkInputType.INCREMENT == widget.type)
                GestureDetector(
                  onTap: () {
                    if (!isDisibleReduction) {
                      onIncrement(widget.type, increment: false);
                      if (!RkValidate.nullOrEmpty(widget.onTapReduction)) {
                        widget.onTapReduction!();
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                      RkDimensions.ONE_UNIT_SIZE * 10,
                    ),
                    height: widget.height ?? RkDimensions.ONE_UNIT_SIZE * 80,
                    constraints: BoxConstraints(
                      maxHeight: RkDimensions.ONE_UNIT_SIZE * 80,
                    ),
                    width: widget.widthIncrement ?? RkDimensions.ONE_UNIT_SIZE * 80,
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      boxShadow: widget.isBorder == false ? RkOther().boxShadow : null,
                      border: widget.isBorder!
                          ? isDisibleReduction
                              ? Border.all(
                                  color: widget.colorDisibleBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                              : Border.all(
                                  color: widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                          : isDisibleReduction
                              ? Border.all(
                                  color: widget.colorDisibleBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                              : Border.all(
                                  color: widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                ),
                      borderRadius: BorderRadius.circular(
                        RkDimensions.BLUR_RADIUS_2X,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: isDisibleReduction ? widget.colorDisibleBorder ?? ColorResources.GREY : widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                    ),
                  ),
                ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    if (widget.isDatePicker! && widget.allowEdit!) {
                      datePicker(widget.iziPickerDate!);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      //boxShadow: widget.isBorder == false ? RkOther().boxShadow : null,
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? RkDimensions.BLUR_RADIUS_1X,
                      ),
                    ),
                    width: RkInputType.INCREMENT == widget.type ? widget.width ?? RkDimensions.ONE_UNIT_SIZE * 90 : null,
                    //height: widget.miniSize ? 45 : null,
                    child: TextFormField(
                      textAlign: (RkInputType.INCREMENT == widget.type || widget.isTextCenter) ? TextAlign.center : TextAlign.start,
                      readOnly: widget.readOnly,
                      onFieldSubmitted: (val) {
                        if (!RkValidate.nullOrEmpty(widget.onSubmitted)) {
                          widget.onSubmitted!(val);
                        }
                        if (!RkValidate.nullOrEmpty(val) && widget.type == RkInputType.INCREMENT) {
                          if (RkNumber.parseInt(val) < widget.min!) {
                            getController(widget.type).text = RkNumber.parseInt(widget.min.toString()).toString();
                          }
                        }
                      },
                      onChanged: (val) {
                        isShowedError = true;
                        if (widget.type == RkInputType.NUMBER || widget.type == RkInputType.DOUBLE) {
                          if (RkValidate.nullOrEmpty(val)) {
                            // getController(widget.type).text = '0';
                            // val = '0';
                          }
                        }
                        if (widget.onChanged != null) {
                          widget.onChanged!(val);
                          // onIncrement(widget.type, increment: true);
                        }
                        validator(widget.type, val.toString());
                      },
                      style: widget.style,
                      inputFormatters: isFilterCharacter()
                          ? [
                              FilteringTextInputFormatter.allow(RegExp(getAllowCharacter())),
                              TextInputFormatter.withFunction((oldValue, newValue) {
                                try {
                                  final text = newValue.text;
                                  if (text.isNotEmpty) double.parse(text);
                                  return newValue;
                                } catch (e) {}
                                return oldValue;
                              }),
                            ]
                          : null,
                      textInputAction: widget.textInputAction,
                      keyboardType: getType(widget.type),
                      maxLines: widget.maxLine,
                      minLines: widget.minLine,
                      enabled: widget.isDatePicker! ? false : widget.allowEdit,
                      controller: getController(widget.type),
                      obscureText: widget.obscureText ?? widget.type == RkInputType.PASSWORD && isVisible,
                      focusNode: focusNode,
                      cursorColor: widget.cursorColor,
                      decoration: InputDecoration(
                        contentPadding: widget.miniSize ? EdgeInsets.all(RkDimensions.SPACE_SIZE_2X5) : widget.contentPaddingIncrement,
                        isDense: true,
                        labelText: widget.isLegend == true ? widget.label : null,
                        labelStyle: TextStyle(
                          fontSize: focusNode!.hasFocus ? RkDimensions.FONT_SIZE_H5 : RkDimensions.FONT_SIZE_H6,
                          fontWeight: focusNode!.hasFocus ? FontWeight.w600 : FontWeight.normal,
                          color: ColorResources.BLACK,
                        ),
                        prefixIcon: widget.prefixIcon,
                        border: OutlineInputBorder(
                          borderSide: widget.isBorder! || widget.isLegend!
                              ? widget.borderSide ??
                                  BorderSide(
                                    width: widget.borderSize ?? 1,
                                    color: (widget.allowEdit == false) ? ColorResources.LIGHT_GREY : (widget.colorBorder ?? ColorResources.LIGHT_GREY),
                                  )
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius ?? RkDimensions.BLUR_RADIUS_1X,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: widget.isBorder! || widget.isLegend!
                              ? widget.borderSide ??
                                  BorderSide(
                                    width: widget.borderSize ?? 1,
                                    color: (widget.allowEdit == false) ? ColorResources.LIGHT_GREY : (widget.colorBorder ?? ColorResources.LIGHT_GREY),
                                  )
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius ?? RkDimensions.BLUR_RADIUS_1X,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: widget.isBorder! || widget.isLegend!
                              ? widget.borderSide ??
                                  BorderSide(
                                    width: widget.borderSize ?? 1,
                                    color: (widget.allowEdit == false) ? ColorResources.LIGHT_GREY : (widget.colorBorder ?? ColorResources.LIGHT_GREY),
                                  )
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius ?? RkDimensions.BLUR_RADIUS_1X,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: widget.isBorder! || widget.isLegend!
                              ? widget.borderSide ??
                                  BorderSide(
                                    width: widget.borderSize ?? 1,
                                    color: (widget.allowEdit == false) ? ColorResources.LIGHT_GREY : (widget.colorBorder ?? ColorResources.LIGHT_GREY),
                                  )
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius ?? RkDimensions.BLUR_RADIUS_1X,
                          ),
                        ),
                        filled: true,
                        hintText: widget.placeHolder,
                        hintStyle: widget.hintStyle ??
                            TextStyle(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              fontSize: RkDimensions.FONT_SIZE_H6,
                            ),
                        fillColor: (widget.allowEdit == false) ? widget.fillColor ?? ColorResources.LIGHT_GREY : widget.fillColor ?? ColorResources.WHITE,
                        suffixIcon: widget.suffixText != null
                            ? Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, children: [
                                Container(margin: EdgeInsets.only(right: RkDimensions.SPACE_SIZE_1X), alignment: Alignment.centerRight, child: RkText(widget.suffixText)),
                              ])
                            : getSuffixIcon(),
                      ),
                    ),
                  ),
                ),
              ),
              if (RkInputType.INCREMENT == widget.type)
                GestureDetector(
                  onTap: () {
                    if (!isDisibleIncrement) {
                      onIncrement(widget.type, increment: true);
                      if (!RkValidate.nullOrEmpty(widget.onTapIncrement)) {
                        widget.onTapIncrement!();
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                      RkDimensions.ONE_UNIT_SIZE * 10,
                    ),
                    constraints: BoxConstraints(maxHeight: RkDimensions.ONE_UNIT_SIZE * 80),
                    height: widget.height ?? RkDimensions.ONE_UNIT_SIZE * 80,
                    width: widget.widthIncrement ?? RkDimensions.ONE_UNIT_SIZE * 80,
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      boxShadow: widget.isBorder == false ? RkOther().boxShadow : null,
                      border: widget.isBorder!
                          ? isDisibleIncrement
                              ? Border.all(
                                  color: widget.colorDisibleBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                              : Border.all(
                                  color: widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                          : isDisibleIncrement
                              ? Border.all(
                                  color: widget.colorDisibleBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                )
                              : Border.all(
                                  color: widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                                ),
                      borderRadius: BorderRadius.circular(
                        RkDimensions.BLUR_RADIUS_2X,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: isDisibleIncrement ? widget.colorDisibleBorder ?? ColorResources.GREY : widget.colorBorder ?? ColorResources.CIRCLE_COLOR_BG3,
                    ),
                  ),
                ),
            ],
          ),
          if (!widget.disbleError)
            Container(
              margin: EdgeInsets.only(top: RkDimensions.SPACE_SIZE_1X * 0.5),
              alignment: Alignment.topLeft,
              child: RkText(
                RkValidate.nullOrEmpty(_errorText.toString()) ? "" : _errorText.toString(),
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
