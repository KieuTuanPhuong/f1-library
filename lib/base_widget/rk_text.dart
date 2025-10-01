import 'package:flutter/material.dart';

import 'package:template/utils/color_resources.dart';

import '../helper/rk_dimensions.dart';

class RkText extends StatelessWidget {
  RkText(
    this.text, {
    Key? key,
    this.textAlign,
    this.style,
    this.maxLine,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final TextAlign? textAlign;
  TextStyle? style;
  final int? maxLine;
  String? text;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLine,
      overflow: textOverflow,
      style: style ?? TextStyle(fontSize: RkDimensions.FONT_SIZE_SPAN_LARGE, color: ColorResources.BLACK, fontWeight: FontWeight.normal),
    );
  }
}
