import 'package:flutter/material.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/base_widget/rk_text.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/fonts.dart';
import 'package:template/utils/images_path.dart';

class AuraAppBarWidget extends StatefulWidget {
  const AuraAppBarWidget(
      {Key? key,
      required this.title,
      this.leftWidget,
      this.actions = const [],
      this.callbackSearch,
      this.colorTitle = ColorResources.PRIMARY_CONTENT_COLOR,
      this.colorBG = Colors.transparent,
      this.colorBackIcon = ColorResources.WHITE,
      this.scrollController,
      this.isShowBack = true,
      this.child,
      this.onClickBack})
      : super(key: key);
  final String title;
  final Color? colorTitle;
  final Color? colorBackIcon;
  final Color? colorBG;
  final Widget? leftWidget;
  final List<Widget>? actions;
  final Function(String)? callbackSearch;
  final ScrollController? scrollController;
  final bool? isShowBack;
  final Function? onClickBack;
  final Widget? child;

  @override
  State<AuraAppBarWidget> createState() => _AuraAppBarWidgetState();
}

class _AuraAppBarWidgetState extends State<AuraAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: widget.colorBG,
      padding: EdgeInsets.symmetric(vertical: RkDimensions.SPACE_SIZE_2X, horizontal: RkDimensions.SPACE_SIZE_3X),
      child: Row(
        children: [
          if (widget.isShowBack == true)
            GestureDetector(
              onTap: () {
                widget.onClickBack?.call();
              },
              child: RkImage(
                ImagesPath.ic_back,
                color: widget.colorBackIcon,
              ),
            ),
          SizedBox(
            width: RkDimensions.ONE_UNIT_SIZE * 8,
          ),
          Expanded(
              child: RkText(
            widget.title,
            maxLine: 1,
            style: TextStyle(fontSize: RkDimensions.ONE_UNIT_SIZE * 30, fontWeight: FontWeight.w600, fontFamily: Barlow, color: widget.colorTitle),
          )),
          ...?widget.actions?.map((widget) => Row(
                children: [
                  SizedBox(
                    width: RkDimensions.ONE_UNIT_SIZE * 8,
                  ),
                  widget
                ],
              ))
        ],
      ),
    );
  }
}
