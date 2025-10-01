import 'package:flutter/material.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/utils/color_resources.dart';

import '../helper/rk_dimensions.dart';
import '../helper/rk_validate.dart';

enum RkButtonType {
  DEFAULT,
  OUTLINE,
}

class RkButton extends StatelessWidget {
  const RkButton({
    Key? key,
    required this.onTap,
    this.label,
    this.height,
    this.maxLine,
    this.type = RkButtonType.DEFAULT,
    this.isEnabled = true,
    this.padding,
    this.margin,
    this.borderRadius,
    this.icon,
    this.color = ColorResources.WHITE,
    this.colorBGDisabled = ColorResources.GREY,
    this.colorDisible = ColorResources.BLACK,
    this.colorBG = ColorResources.CIRCLE_COLOR_BG3,
    this.colorBorder = ColorResources.GREY,
    this.colorIcon,
    this.colorText,
    this.imageUrlIcon,
    this.withBorder,
    this.width,
    this.fontSizedLabel,
    this.labelStyle,
    this.sizeIcon,
  }) : super(key: key);

  // OnTap
  // Title defaul căn giữ , maxLine defaul 1 dòng , có thể truyền thêm số dòng, nếu quá dòng là overflow
  // clickble (có thể có or không defaul true) Nếu true click vào thì mới thực hiện onTap esle thì không
  final String? label;
  final Color? color;
  final Color? colorDisible;
  final Color? colorBGDisabled;
  final Color? colorBG;
  final Function onTap;
  final double? height;
  final int? maxLine;
  final RkButtonType? type;
  final Color? colorIcon;
  final Color? colorText;
  final Color? colorBorder;
  final bool? isEnabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final IconData? icon;
  final String? imageUrlIcon;
  final double? withBorder;
  final double? width;
  final double? fontSizedLabel;
  final TextStyle? labelStyle;
  final double? sizeIcon;

  Color getColorBG(RkButtonType type) {
    if (type == RkButtonType.DEFAULT) {
      if (isEnabled!) {
        return colorBG!;
      }
      return colorBGDisabled!;
    } else if (type == RkButtonType.OUTLINE) {
      if (isEnabled!) {
        return colorBG!;
      }
      return colorBGDisabled!;
    }
    return colorBG!;
  }

  Color getColor(RkButtonType type) {
    if (type == RkButtonType.DEFAULT) {
      if (isEnabled!) {
        return color!;
      }
      return colorDisible!;
    } else if (type == RkButtonType.OUTLINE) {
      if (isEnabled!) {
        return colorBG!;
      }
      return ColorResources.GREY;
    }
    return color!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled!
          ? () {
              onTap();
            }
          : null,
      child: Container(
        width: width ?? RkDimensions.screenSize.width,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: RkDimensions.SPACE_SIZE_4X,
              horizontal: RkDimensions.SPACE_SIZE_4X,
            ),
        margin: margin ??
            EdgeInsets.symmetric(
              vertical: RkDimensions.SPACE_SIZE_2X,
            ),
        decoration: BoxDecoration(
          color: getColorBG(type!),
          border: type == RkButtonType.DEFAULT
              ? null
              : Border.all(
                  color: isEnabled! ? colorBorder! : colorBG!,
                  width: withBorder ?? RkDimensions.ONE_UNIT_SIZE * 5,
                ),
          borderRadius: BorderRadius.circular(
            borderRadius ?? RkDimensions.ONE_UNIT_SIZE * 20,
          ),
        ),
        height: height ?? RkDimensions.ONE_UNIT_SIZE * 20,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (label != null)
              Flexible(
                child: Text(
                  " $label",
                  style: labelStyle ??
                      TextStyle(
                        fontSize: RkDimensions.ONE_UNIT_SIZE * 20,
                        color: colorText ?? getColor(type!),
                        fontWeight: FontWeight.w700,
                      ),
                  maxLines: maxLine ?? 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (!RkValidate.nullOrEmpty(imageUrlIcon))
              RkImage(
                imageUrlIcon.toString(),
                color: colorIcon ?? getColor(type!),
              ),
            if (icon != null)
              Icon(
                icon,
                color: colorIcon ?? getColor(type!),
                size: sizeIcon ?? RkDimensions.ONE_UNIT_SIZE * 20,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
