import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/utils/images_path.dart';

class TextFieldCustomized extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int? maxLength;
  final int? maxLine;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final String? labelText;
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
  final bool? isAutoFocus;

  TextFieldCustomized({
    @required this.controller,
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
    this.onSubmitted,
    this.isAutoFocus,
    this.onFocused,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldCustomizedState();
  }
}

class _TextFieldCustomizedState extends State<TextFieldCustomized> {
  bool? isValid;
  bool? isFocus;
  FocusNode focusNode = FocusNode();
  bool isClick = false;
  bool _obscureText = true;

  void toggleObscured() {
    if (mounted) {
      {
        setState(() {
          _obscureText = !_obscureText;
          if (focusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
          focusNode.canRequestFocus = false; // Prevents focus if tap on eye
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.focusNode != null) {
      focusNode = widget.focusNode!;
    } else {
      focusNode = FocusNode();
    }
    focusNode.addListener(() {
      if (mounted) {
        setState(() {
          isFocus = focusNode.hasFocus;
        });
      }
      if (widget.onFocused != null) {
        widget.onFocused!(focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      textAlign: widget.textAlign ?? TextAlign.left,
      maxLines: widget.maxLine ?? 1,
      autofocus: widget.isAutoFocus ?? false,
      // Obscured fields cannot be multiline.
      focusNode: widget.focusNode == null ? focusNode : widget.focusNode,
      maxLength: widget.maxLength ?? null,
      obscureText: widget.isObscured == null ? false : _obscureText,
      obscuringCharacter: widget.obscuringCharacter!,
      controller: widget.controller,
      style: widget.textStyle,

      textAlignVertical: widget.textAlignVertical,
      textInputAction: widget.textInputAction ?? null,
      onSubmitted: widget.onSubmitted,
      // onSubmitted: (_) {
      //   if (widget.textInputAction != null) {
      //     switch (widget.textInputAction) {
      //       case TextInputAction.none:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.unspecified:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.done:
      //         // TODO: Handle this case.
      //         focusNode.unfocus();
      //         break;
      //       case TextInputAction.go:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.search:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.send:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.next:
      //         // TODO: Handle this case.
      //         // focusNode.nextFocus();
      //         break;
      //       case TextInputAction.previous:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.continueAction:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.join:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.route:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.emergencyCall:
      //         // TODO: Handle this case.
      //         break;
      //       case TextInputAction.newline:
      //         // TODO: Handle this case.
      //         break;
      //     }
      //   }
      // },
      onChanged: (value) {
        widget.onChanged != null ? widget.onChanged!(value) : () {};
      },
      scrollPadding: EdgeInsets.zero,
      keyboardType: widget.textInputType ?? null,
      enabled: widget.isEnable ?? true,
      inputFormatters: widget.inputFormatter ?? null,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor ?? Colors.white,
        labelText: widget.labelText ?? null,
        labelStyle: TextStyle(
          fontFamily: widget.fontLabel,
          fontSize: widget.textSizeLabel,
          color: widget.colorTextLabel,
        ),
        prefixIcon: widget.prefixIcon ?? null,
        suffixIcon: widget.isObscured != null
            ? GestureDetector(
                onTap: () {
                  toggleObscured();
                },
                child: RkImage(
                  _obscureText == false ? ImagesPath.ic_eye : ImagesPath.ic_eye_close,
                ),
              )
            : widget.suffixIcon ?? null,
        suffixIconConstraints: widget.suffixIconConstraints ??
            BoxConstraints(
              maxHeight: 48.0,
              maxWidth: 48.0,
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
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.colorBorderFocus ?? Colors.transparent,
            width: 1,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.colorBorderDisable ?? Colors.transparent,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.colorBorderEnable ?? Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
