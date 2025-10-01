import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_text.dart';

import 'package:template/utils/color_resources.dart';
import 'package:template/utils/fonts.dart';

import '../helper/rk_dimensions.dart';
import '../helper/rk_size.dart';
import '../helper/rk_validate.dart';

class RkAppBar extends StatefulWidget {
  const RkAppBar(
      {Key? key,
      required this.title,
      this.textStyle,
      this.leftWidget,
      this.actions = const [],
      this.callbackSearch,
      this.colorTitle = ColorResources.PRIMARY_CONTENT_COLOR,
      this.colorBG = ColorResources.PRIMARY_BG_COLOR_RED_DARK,
      this.scrollController,
      this.isShowBack = true,
      this.isExpandSearchInput = false,
      this.searchPlaceHolder = 'Tìm kiếm',
      this.child,
      this.onClickBack})
      : super(key: key);
  final String title;
  final Color? colorTitle;
  final Color? colorBG;
  final Widget? leftWidget;
  final List<Widget>? actions;
  final Function(String)? callbackSearch;
  final ScrollController? scrollController;
  final bool? isShowBack;
  final bool? isExpandSearchInput;
  final String? searchPlaceHolder;
  final Function? onClickBack;
  final Widget? child;
  final TextStyle? textStyle;

  @override
  State<RkAppBar> createState() => _RkAppBarState();
}

class _RkAppBarState extends State<RkAppBar> {
  bool? isExpandSearchInput = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      isExpandSearchInput = widget.isExpandSearchInput;
      // print('initState isExpandSearchInput $isExpandSearchInput widget.isExpandSearchInput ${widget.isExpandSearchInput}');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ThemeData.estimateBrightnessForColor(widget.colorBG!) != Brightness.light) {
      if (Platform.isIOS) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ));
      } else {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ));
      }
    } else {
      if (Platform.isIOS) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ));
      } else {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ));
      }
    }

//     double heightPaddingTop = RkDimensions.ONE_UNIT_SIZE * 40;
//     if (heightPaddingTop < 0) heightPaddingTop = 0;
//
//     return Container(
//       key: UniqueKey(),
//       padding: EdgeInsets.only(
//         top: heightPaddingTop,
//       ),
//       color: widget.colorBG,
//       // color: Colors.green,
//       child: widget.child ??
//           Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                   left: RkDimensions.screenSize.width * 0.125,
//                   right: RkDimensions.screenSize.width * 0.1,
//                   // top: 8.sp,
//                 ),
//                 // height: 0.14.sh,
//                 // width: 1.sw,
//                 child: getStatusSearchInput(),
//               ),
//               Row(
//                 children: [
//                   getLeftWidget(),
//                   // widget.isShowBack == true ? getLeftWidget() : SizedBox(),
//                   const Flexible(
//                     fit: FlexFit.tight,
//                     child: SizedBox(),
//                   ),
//                   if ((isExpandSearchInput == false) && (RkValidate.nullOrEmpty(widget.callbackSearch) == false))
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isExpandSearchInput = !isExpandSearchInput!;
//                         });
//                       },
//                       child: Container(
//                         // color: Colors.red,
//                         height: kToolbarHeight,
//                         // height: 50.sp,
//                         padding: EdgeInsets.only(
//                           right: RkDimensions.ONE_UNIT_SIZE * 20,
//                           // top: 50.sp,
//                         ),
//                         alignment: Alignment.centerRight,
//                         width: RkDimensions.screenSize.width * 0.125,
//                         child: Icon(
//                           Icons.search,
//                           color: ColorResources.WHITE,
//                           size: RkDimensions.ONE_UNIT_SIZE * 30,
//                         ),
//                       ),
//                     ),
//                   if (RkValidate.nullOrEmpty(widget.actions) == false)
//                     Container(
//                       // color: Colors.blue,
//                       color: Colors.transparent,
//                       height: kToolbarHeight,
//                       padding: EdgeInsets.only(
//                         right: RkDimensions.ONE_UNIT_SIZE * 20,
//                         // top: 50.sp,
//                       ),
//                       alignment: Alignment.centerRight,
//                       // width: (0.5.sw) * widget.actions.length,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: widget.actions!,
//                       ),
//                     ),
//                 ],
//               ),
//             ],
//           ),
//     );
//   }
//
//   Widget getLeftWidget() {
//     if (isExpandSearchInput == true) {
//       return InkWell(
//         onTap: () {
//           Navigator.of(context).pop();
//           // isExpandSearchInput = !isExpandSearchInput;
//           setState(() {});
//         },
//         child: Container(
//           // color: Colors.transparent,
//           height: kToolbarHeight,
//           // color: Colors.black,
//           padding: EdgeInsets.only(
//             left: RkDimensions.ONE_UNIT_SIZE * 10,
//           ),
//           alignment: Alignment.centerLeft,
//           width: RkDimensions.screenSize.width * 0.125,
//           child: Icon(
//             Icons.arrow_back_outlined,
//             size: RkDimensions.ONE_UNIT_SIZE * 28,
//             color: widget.colorTitle?.withOpacity(1),
//           ),
//         ),
//       );
//     }
//     return widget.isShowBack != false
//         ? widget.leftWidget ??
//             GestureDetector(
//               onTap: () {
//                 print('Recevive click back');
//                 Navigator.of(context).pop();
//               },
//               child: Container(
//                 // color: Colors.green,
//                 color: Colors.transparent,
//                 height: kToolbarHeight,
//                 padding: EdgeInsets.only(
//                   left: RkDimensions.ONE_UNIT_SIZE * 15,
//                 ),
//                 alignment: Alignment.centerLeft,
//                 width: RkDimensions.screenSize.width * 0.125,
//                 child: Icon(
//                   Icons.arrow_back_outlined,
//                   size: RkDimensions.ONE_UNIT_SIZE * 25,
//                   color: widget.colorTitle?.withOpacity(1),
//                 ),
//               ),
//             )
//         : const SizedBox();
//   }
//
//   Widget getStatusSearchInput() {
//     if (!RkValidate.nullOrEmpty(widget.callbackSearch)) {
//       if (isExpandSearchInput == true) {
//         return search();
//       }
//     }
//     return Container(
//       padding: EdgeInsets.only(
//         // top: 10.sp,
//         left: RkDimensions.ONE_UNIT_SIZE * 10,
//       ),
//       height: kToolbarHeight,
//       alignment: Alignment.centerLeft,
//       child: RkText(
//         widget.title,
//         style: widget.textStyle ??
//             TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: RkDimensions.ONE_UNIT_SIZE * 20,
//               color: widget.colorTitle,
//             ),
//         maxLine: 1,
//       ),
//     );
//   }
//
//   Widget search() {
//     double widthSearch = RkDimensions.screenSize.width * 1;
//     widthSearch -= RkDimensions.screenSize.width * 0.1;
//     widthSearch -= RkDimensions.screenSize.width * 0.1 * (widget.actions!.length * 1.5);
//     widthSearch -= RkDimensions.ONE_UNIT_SIZE * 15;
//     return Container(
//       // color: Colors.black,
//       margin: EdgeInsets.only(
//         top: RkDimensions.ONE_UNIT_SIZE * 4,
//       ),
//       padding: EdgeInsets.only(
//         // left: 0.1.sw,
//         right: RkDimensions.ONE_UNIT_SIZE * 10,
//         top: RkDimensions.ONE_UNIT_SIZE * 2,
//         bottom: RkDimensions.ONE_UNIT_SIZE * 2,
//       ),
//       // height: 30.sp,
//       // decoration: BoxDecoration(
//       //   border: Border.all(
//       //     color: ColorResources.WHITE,
//       //   ),
//       //   // color: ColorResources.WHITE,
//       //   borderRadius: BorderRadius.circular(16.sp),
//       // ),
//
//       width: widthSearch,
//       child: GestureDetector(
//         onTap: () {
//           // Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
//         },
//         child: Container(
//           height: RkDimensions.ONE_UNIT_SIZE * 34,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: ColorResources.WHITE,
//             ),
//             borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_SIZE * 20),
//           ),
//           // padding: EdgeInsets.symmetric(horizontal: 10.sp),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_SIZE * 10),
//                 child: RkText(
//                   "Tìm kiếm sản phẩm ",
//                   style: TextStyle(
//                     fontFamily: Roboto,
//                     color: ColorResources.WHITE.withOpacity(0.5),
//                     fontWeight: FontWeight.w600,
//                     fontSize: RkDimensions.ONE_UNIT_SIZE * 14,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: RkDimensions.ONE_UNIT_SIZE * 60,
//                 decoration: BoxDecoration(
//                   color: ColorResources.WHITE,
//                   borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_SIZE * 20),
//                 ),
//                 child: Center(
//                   child: Icon(
//                     Icons.search,
//                     color: ColorResources.COLOR_EE3439,
//                     size: RkDimensions.ONE_UNIT_SIZE * 30,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       // Center(
//       //   child: TextFieldCustomized(
//       //     hintText: widget.searchPlaceHolder,
//       //     colorTextLabel: Colors.white,
//       //     focusNode: FocusNode(),
//       //     controller: TextEditingController(),
//       //     onChanged: widget.callbackSearch,
//       //     onSubmitted: widget.submitCallbackSearch,
//       //     backgroundColor: Colors.transparent,
//       //     suffixIcon: Icon(
//       //       Icons.search,
//       //       size: 20.sp,
//       //       color: Colors.white,
//       //     ),
//       //     textStyle: TextStyle(
//       //       color: ColorResources.WHITE,
//       //     ),
//       //     hintStyle: TextStyle(
//       //       color: ColorResources.WHITE,
//       //     ),
//       //   ),
//       // ),
//       // TekupInput(
//       //   width: widthSearch,
//       //   type: TekupInputType.TEXT,
//       //   disbleError: true,
//       //   showClearText: true,
//       //   miniSize: true,
//       //   fillColor: ColorResources.RED3,
//       //   // textHintColor: ColorResources.GREY,
//       //   textColor: ColorResources.WHITE,
//       //   prefixIcon: Icon(
//       //     Icons.search,
//       //     size: TekupDimensions.ONE_UNIT_SIZE * 45,
//       //     color: ColorResources.PRIMARY_CONTENT_COLOR,
//       //   ),
//       //   suffixIcon: Icon(
//       //     Icons.cancel_outlined,
//       //     size: TekupDimensions.ONE_UNIT_SIZE * 45,
//       //     color: ColorResources.PRIMARY_CONTENT_COLOR,
//       //   ),
//       //   placeHolder: widget.searchPlaceHolder,
//       //   hintStyle: TextStyle(
//       //     fontSize: TekupDimensions.FONT_SIZE_H6,
//       //     color: ColorResources.WHITE.withOpacity(0.45),
//       //   ),
//       //   style: TextStyle(
//       //     fontSize: TekupDimensions.FONT_SIZE_H6,
//       //     color: ColorResources.WHITE,
//       //   ),
//       //   cursorColor: ColorResources.WHITE,
//       //   onChanged: widget.callbackSearch,
//       //   onSubmitted: widget.submitCallbackSearch,
//       //   borderRadius: TekupDimensions.ONE_UNIT_SIZE * 45,
//       //   isBorder: true,
//       //   colorBorder: Colors.transparent,
//       //   colorDisibleBorder: Colors.transparent,
//       //
//       // ),
//     );
//   }
// }

    return GestureDetector(
      onTap: () {
        print('click ne');
      },
      child: Container(
        // height: RkDimensions.ONE_UNIT_SIZE * 160,
        padding: EdgeInsets.only(
          top: RkSize.sizeIncludeTopBottom.height - RkSize.sizeIncludeBottom.height + RkDimensions.ONE_UNIT_SIZE * 10,
        ),
        color: widget.colorBG,
        // color: Colors.green,
        child: widget.child ??
            Stack(
              children: [
                // Container(
                //   height: kToolbarHeight,
                //   width: RkDimensions.screenSize.width,
                //   child: getStatusSearchInput(),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // getLeftWidget(),
                    widget.isShowBack == true ? getLeftWidget() : SizedBox(width: RkDimensions.screenSize.width * 0.125),
                    // const Flexible(
                    //   fit: FlexFit.tight,
                    //   child: SizedBox(),
                    // ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        // height: kToolbarHeight,
                        height: RkDimensions.ONE_UNIT_SIZE * 80,
                        width: RkDimensions.screenSize.width,
                        child: getStatusSearchInput(),
                      ),
                    ),
                    if (RkValidate.nullOrEmpty(widget.actions) == false)
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.blue,
                          color: Colors.transparent,
                          height: kToolbarHeight,
                          padding: EdgeInsets.only(
                            right: RkDimensions.SPACE_SIZE_3X,
                          ),
                          alignment: Alignment.centerRight,
                          width: (RkDimensions.screenSize.width * 0.5) * widget.actions!.length,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: widget.actions!,
                          ),
                        ),
                      ),
                    if ((isExpandSearchInput == false) && (RkValidate.nullOrEmpty(widget.callbackSearch) == false))
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isExpandSearchInput = !isExpandSearchInput!;
                            setState(() {});
                          },
                          child: Container(
                            // color: Colors.red,
                            height: kToolbarHeight,
                            padding: EdgeInsets.only(
                              right: RkDimensions.SPACE_SIZE_3X,
                            ),
                            alignment: Alignment.centerRight,
                            width: RkDimensions.screenSize.width * 0.125,
                            child: Icon(
                              Icons.search,
                              color: ColorResources.WHITE,
                              size: RkDimensions.ONE_UNIT_SIZE * 50,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
      ),
    );
  }

  Widget getLeftWidget() {
    if (isExpandSearchInput == true) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isExpandSearchInput = !isExpandSearchInput!;
          });
        },
        child: Container(
          // color: Colors.transparent,
          height: kToolbarHeight,
          padding: EdgeInsets.only(
            left: RkDimensions.SPACE_SIZE_3X,
          ),
          alignment: Alignment.centerLeft,
          width: RkDimensions.screenSize.width * 0.125,
          child: Icon(
            Icons.arrow_back_ios,
            color: widget.colorTitle!.withOpacity(1),
          ),
        ),
      );
    }
    return widget.isShowBack != false
        ? widget.leftWidget ??
            GestureDetector(
              onTap: () {
                print('Recevive click back');
                if (widget.onClickBack != null) {
                  widget.onClickBack!();
                } else {
                  Get.back(result: true);
                }
              },
              child: Container(
                // color: Colors.green,
                color: Colors.transparent,
                height: kToolbarHeight,
                padding: EdgeInsets.only(
                  left: RkDimensions.SPACE_SIZE_3X5,
                ),
                alignment: Alignment.centerLeft,
                width: RkDimensions.screenSize.width * 0.125,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: widget.colorTitle!.withOpacity(1),
                ),
              ),
            )
        : const SizedBox();
  }

  Widget getStatusSearchInput() {
    if (!RkValidate.nullOrEmpty(widget.callbackSearch)) {
      if (isExpandSearchInput == true) {
        return search();
      }
    }
    return RkText(
      widget.title,
      style: widget.textStyle ??
          TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: RkDimensions.FONT_SIZE_SPAN_LARGE_X,
            color: widget.colorTitle,
          ),
      maxLine: 1,
    );
  }

  Widget search() {
    double widthSearch = RkDimensions.screenSize.width;
    widthSearch -= RkDimensions.screenSize.width * 0.125;
    widthSearch -= RkDimensions.screenSize.width * 0.125 * (widget.actions!.length * 2);
    widthSearch -= RkDimensions.ONE_UNIT_SIZE * 15;
    return Container();
    // return Container(
    //   // color: Colors.yellow,
    //   padding: EdgeInsets.only(left: RkDimensions.screenSize.width * 0.125, right: RkDimensions.ONE_UNIT_SIZE * 15),
    //   width: widthSearch,
    //   child: RkInput(
    //     width: widthSearch,
    //     type: RkInputType.TEXT,
    //     disbleError: true,
    //     showClearText: true,
    //     miniSize: true,
    //     fillColor: ColorResources.RED3,
    //     // textHintColor: ColorResources.GREY,
    //     textColor: ColorResources.WHITE,
    //     prefixIcon: Icon(
    //       Icons.search,
    //       size: RkDimensions.ONE_UNIT_SIZE * 45,
    //       color: ColorResources.PRIMARY_CONTENT_COLOR,
    //     ),
    //     suffixIcon: Icon(
    //       Icons.cancel_outlined,
    //       size: RkDimensions.ONE_UNIT_SIZE * 45,
    //       color: ColorResources.PRIMARY_CONTENT_COLOR,
    //     ),
    //     placeHolder: widget.searchPlaceHolder,
    //     hintStyle: TextStyle(
    //       fontSize: RkDimensions.FONT_SIZE_H6,
    //       color: ColorResources.WHITE.withOpacity(0.45),
    //     ),
    //     style: TextStyle(
    //       fontSize: RkDimensions.FONT_SIZE_H6,
    //       color: ColorResources.WHITE,
    //     ),
    //     cursorColor: ColorResources.WHITE,
    //     onChanged: widget.callbackSearch,
    //     borderRadius: RkDimensions.ONE_UNIT_SIZE * 45,
    //     isBorder: true,
    //     colorBorder: Colors.transparent,
    //     colorDisibleBorder: Colors.transparent,
    //
    //   ),
    // );
  }
}
