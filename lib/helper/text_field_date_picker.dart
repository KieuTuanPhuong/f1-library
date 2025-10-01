import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/color_resources.dart';

class TextFieldDatePicker extends StatefulWidget {
  final CupertinoDatePickerMode? mode;
  final ValueChanged<DateTime>? onDateChanged;
  final DateTime? initialDateTime;
  final DateTime? minimumDateTime;
  final DateTime? maximumDateTime;
  final DateTime? minDateTime;
  final DateTime? maxDateTime;
  final DateFormat? dateFormat;
  final FocusNode? focusNode;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? maxLine;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final String? fontLabel;
  final double? textSizeLabel;
  final Color? colorTextLabel;
  final TextStyle? styleLabelErrorText;
  final List<TextInputFormatter>? inputFormatter;
  final Color? backgroundColor;
  final bool? isEnable;
  final double? widthEnableBorder;
  final double? widthDisableBorder;
  final double? widthFocusedBorder;
  final double? borderRadius;
  final Color? colorBorderEnable;
  final Color? colorBorderDisable;
  final Color? colorBorderFocus;
  final bool? isObscured;
  final bool Function()? validator;
  final bool? isValidClick;
  final EdgeInsets? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final String? obscuringCharacter;
  final Color? colorSuffixFocus;
  final Color? colorSuffixUnFocus;
  final ValueChanged<bool>? onPressedSuffix;
  final ValueChanged<bool>? onFocused;
  final ValueChanged<bool>? onValidate;
  // final double? width;
  // final double? height;

  TextFieldDatePicker({
    Key? key,
    @required this.controller,
    this.mode,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.textInputAction,
    this.textInputType,
    this.errorText,
    this.onChanged,
    this.maxLength,
    this.maxLine,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.labelText,
    this.styleLabelErrorText,
    this.inputFormatter,
    this.isEnable,
    this.colorBorderDisable,
    this.colorBorderEnable,
    this.colorBorderFocus,
    this.widthDisableBorder,
    this.widthEnableBorder,
    this.isObscured,
    this.validator,
    this.isValidClick,
    this.colorTextLabel,
    this.textSizeLabel,
    this.fontLabel,
    this.contentPadding,
    this.obscuringCharacter = "*",
    this.textAlignVertical,
    this.textAlign,
    this.backgroundColor,
    this.widthFocusedBorder,
    this.colorSuffixFocus,
    this.colorSuffixUnFocus,
    this.onPressedSuffix,
    this.borderRadius,
    this.onValidate,
    this.onFocused,
    this.dateFormat,
    this.maxDateTime,
    this.minDateTime,
    // this.width,
    // this.height,
    @required this.maximumDateTime,
    @required this.minimumDateTime,
    @required this.initialDateTime,
    @required this.onDateChanged,
  })  : assert(initialDateTime != null),
        assert(minimumDateTime != null),
        assert(maximumDateTime != null),
        assert(!initialDateTime!.isBefore(minimumDateTime!), 'initialDateTime must be on or after minimumDateTime'),
        assert(!initialDateTime!.isAfter(maximumDateTime!), 'initialDateTime must be on or before maximumDateTime'),
        assert(!minimumDateTime!.isAfter(maximumDateTime!), 'maximumDateTime must be on or after minimumDateTime'),
        assert(onDateChanged != null, 'onDateChanged must not be null'),
        super(key: key);

  @override
  _TextFieldDatePicker createState() => _TextFieldDatePicker();
}

class _TextFieldDatePicker extends State<TextFieldDatePicker> {
  TextEditingController? _controllerDate;
  DateFormat? _dateFormat;
  DateTime? _selectedDate;
  bool? isValid;
  bool? isFocus;
  FocusNode? focusNode;
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      focusNode = widget.focusNode;
    } else {
      focusNode = FocusNode();
    }
    focusNode!.addListener(() {
      setState(() {
        isFocus = focusNode!.hasFocus;
      });
      if (widget.onFocused != null) {
        widget.onFocused!(focusNode!.hasFocus);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        // width: widget.width ?? 40,
        // height: widget.height ?? 60,
        child: TextField(
          textAlign: widget.textAlign ?? TextAlign.left,
          maxLines: widget.isObscured != null && widget.isObscured! ? 1 : widget.maxLine ?? 1,
          // Obscured fields cannot be multiline.
          focusNode: focusNode,
          maxLength: widget.maxLength ?? null,
          obscureText: widget.isObscured ?? false,
          obscuringCharacter: widget.obscuringCharacter!,
          controller: widget.controller,
          style: widget.textStyle,
          textAlignVertical: widget.textAlignVertical,
          textInputAction: widget.textInputAction ?? null,
          onSubmitted: (_) {
            if (widget.textInputAction != null) {
              switch (widget.textInputAction) {
                case TextInputAction.none:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.unspecified:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.done:
                  // TODO: Handle this case.
                  focusNode!.unfocus();
                  break;
                case TextInputAction.go:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.search:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.send:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.next:
                  // TODO: Handle this case.
                  focusNode!.nextFocus();
                  break;
                case TextInputAction.previous:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.continueAction:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.join:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.route:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.emergencyCall:
                  // TODO: Handle this case.
                  break;
                case TextInputAction.newline:
                  // TODO: Handle this case.
                  break;
              }
            }
          },
          onChanged: (value) {
            widget.onChanged!(value);
          },
          keyboardType: widget.textInputType ?? null,
          enabled: widget.isEnable ?? true,
          inputFormatters: widget.inputFormatter ?? null,
          decoration: InputDecoration(
              filled: true,
              fillColor: widget.backgroundColor ?? Colors.white,
              labelText: widget.labelText ?? null,
              labelStyle: TextStyle(fontFamily: widget.fontLabel, fontSize: widget.textSizeLabel, color: widget.colorTextLabel),
              prefixIcon: widget.prefixIcon ?? null,
              suffixIcon: widget.suffixIcon ?? null,
              suffixIconConstraints: widget.suffixIconConstraints ??
                  BoxConstraints(
                    maxHeight: 48,
                    maxWidth: 48,
                  ),
              prefixIconConstraints: widget.prefixIconConstraints ??
                  BoxConstraints(
                    maxHeight: 48,
                    maxWidth: 48,
                  ),
              counterText: '',
              hintText: widget.hintText ?? null,
              hintStyle: widget.hintStyle,
              contentPadding: widget.contentPadding,
              isDense: true,
              errorText: (widget.validator != null && widget.validator!()) ? widget.errorText ?? 'The field is required' : null,
              errorStyle: widget.styleLabelErrorText,
              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).highlightColor, width: 1)),
              focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).highlightColor, width: 1)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.colorBorderFocus ?? ColorResources.GRAY_666666, width: 1),
              ),
              disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: widget.colorBorderDisable ?? ColorResources.GRAY_666666, width: 2)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: widget.colorBorderEnable ?? ColorResources.GRAY_666666, width: 2))),
          onTap: () {
            _showDatePicker();
          },
          readOnly: true,
        ),
      );

  @override
  void dispose() {
    // widget.controller!.dispose();
    super.dispose();
  }

  Future _showDatePicker() => showModalBottomSheet(
      context: Get.context!,
      builder: (builder) {
        return Container(
          height: Get.height / 3,
          color: Colors.white,
          child: _datePicker(),
        );
      });

  Widget _accessoryView() => Container(
        width: double.maxFinite,
        height: 35,
        decoration: BoxDecoration(color: Colors.black),
      );

  Widget _datePicker() => CupertinoDatePicker(
        mode: widget.mode!,
        onDateTimeChanged: widget.onDateChanged!,
        minimumDate: widget.minDateTime,
        maximumDate: widget.maxDateTime,
        initialDateTime: widget.initialDateTime,
        minimumYear: widget.minimumDateTime!.year,
        maximumYear: widget.maximumDateTime!.year,
      );
}
