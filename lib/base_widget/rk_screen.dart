import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/base_widget/background/background.dart';
import 'package:template/base_widget/background/background_gradient.dart';
import 'package:template/base_widget/rk_app_bar.dart';

import 'dart:io' show Platform;

import '../helper/rk_dimensions.dart';
import '../helper/rk_size.dart';

class RkScreen extends StatefulWidget {
  RkScreen(
      {Key? key,
      required this.body,
      this.background,
      this.appBar,
      this.tabBar,
      this.widgetBottomSheet,
      this.drawer,
      this.scrollController,
      this.isSingleChildScrollView = true,
      this.floatingActionButton,
      this.resizeToAvoidBottomSheet = true,
      this.isDisplayDesirePaddingTop = true})
      : super(key: key);
  final Widget body;
  final Widget? background;
  final RkAppBar? appBar;
  final Widget? tabBar;
  final Widget? widgetBottomSheet;
  final Widget? drawer;
  final ScrollController? scrollController;
  final bool isSingleChildScrollView;
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomSheet;
  final bool isDisplayDesirePaddingTop;

  @override
  State<RkScreen> createState() => _RkScreenState();
}

class _RkScreenState extends State<RkScreen> {
  ValueNotifier<double> opacityScrollAppbar = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    if (widget.scrollController != null) {
      widget.scrollController?.addListener(_listenerScrollController);
    }
    if (widget.appBar == null) {
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

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        // top: Platform.isIOS ? false : true,
        bottom: false,
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            RkSize.updateMaxSizeIncludeTopBottom(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            );
            return Stack(
              children: [
                _updateMaxSize(),
                _updateMaxSizeIncludeTop(),
                _updateMaxSizeIncludeBottom(),
                widget.background ?? const BackgroundDefault(),
                SafeArea(
                  // top: (scrollController == null) ? true : false,
                  top: false,
                  bottom: false,
                  child: LayoutBuilder(
                    builder: (
                      BuildContext context,
                      BoxConstraints constraints,
                    ) {
                      // RkSize.update(
                      //   width: constraints.maxWidth,
                      //   height: constraints.maxHeight,
                      // );
                      return OrientationBuilder(builder: (context, orientation) {
                        // RkSize.update(
                        //   width: constraints.maxWidth,
                        //   height: constraints.maxHeight,
                        // );
                        if (orientation == Orientation.portrait) {
                          RkSize.update(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            currentOrientation: orientation,
                          );
                          // setState(() {});
                          // print("object");
                        } else {
                          RkSize.update(
                            width: constraints.maxHeight,
                            height: constraints.maxWidth,
                            currentOrientation: orientation,
                          );
                          // setState(() {});
                          // print("object aaaaaaaa");
                        }
                        return Scaffold(
                          backgroundColor: Colors.transparent,
                          resizeToAvoidBottomInset: widget.resizeToAvoidBottomSheet,
                          body: Column(
                            children: [
                              if (widget.scrollController == null)
                                widget.appBar ??
                                    Container(
                                      height: widget.isDisplayDesirePaddingTop ? (RkSize.size.height - RkSize.sizeIncludeBottom.height) : 0,
                                    ),
                              if (widget.scrollController != null || widget.isSingleChildScrollView == true)
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    controller: widget.scrollController,
                                    child: widget.body,
                                  ),
                                )
                              else
                                Expanded(
                                  child: widget.body,
                                ),
                            ],
                          ),
                          endDrawer: widget.drawer,
                          floatingActionButton: widget.floatingActionButton,
                          bottomSheet: widget.widgetBottomSheet ?? const SizedBox(),
                        );
                      });
                    },
                  ),
                ),
                if (widget.scrollController != null && widget.appBar != null)
                  ValueListenableBuilder<double>(
                    builder: (BuildContext context, double value, Widget? child) {
                      return RkAppBar(
                        title: widget.appBar?.title ?? '',
                        callbackSearch: widget.appBar?.callbackSearch,
                        actions: widget.appBar?.actions,
                        colorBG: widget.appBar?.colorBG?.withOpacity(value),
                        colorTitle: widget.appBar?.colorTitle?.withOpacity(value),
                        leftWidget: widget.appBar?.leftWidget,
                        scrollController: widget.scrollController,
                      );
                    },
                    valueListenable: opacityScrollAppbar,
                  )
              ],
            );
          },
        ),
      ),
    );
  }

  void _listenerScrollController() {
    opacityScrollAppbar.value = (widget.scrollController?.offset ?? 0.0) / (RkDimensions.ONE_UNIT_SIZE * 250);
    if (opacityScrollAppbar.value < 0.01) opacityScrollAppbar.value = 0.0;
    if (opacityScrollAppbar.value > 0.99) opacityScrollAppbar.value = 1.0;
  }

  SafeArea _updateMaxSize() {
    return SafeArea(
      child: LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          // RkSize.update(
          //   width: constraints.maxWidth,
          //   height: constraints.maxHeight,
          // );
          return OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              RkSize.update(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                currentOrientation: orientation,
              );
            } else {
              RkSize.update(
                width: constraints.maxHeight,
                height: constraints.maxWidth,
                currentOrientation: orientation,
              );
            }
            return const SizedBox();
          });
        },
      ),
    );
  }

  SafeArea _updateMaxSizeIncludeBottom() {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          RkSize.updateMaxSizeIncludeBottom(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          );
          return const SizedBox();
        },
      ),
    );
  }

  SafeArea _updateMaxSizeIncludeTop() {
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          RkSize.updateMaxSizeIncludeTop(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          );
          return const SizedBox();
        },
      ),
    );
  }
}
