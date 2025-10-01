import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:template/base_widget/rk_image.dart';

import '../../helper/rk_dimensions.dart';
import '../../utils/color_resources.dart';

// class MediaRealEstateWidget extends StatefulWidget {
//   final List<MediaAsset>? img;
//   final List<MediaAsset>? img360;
//   final List<MediaAsset>? video;
//   const MediaRealEstateWidget({
//     Key? key,
//     this.img,
//     this.img360,
//     this.video,
//   }) : super(key: key);
//
//   @override
//   State<MediaRealEstateWidget> createState() => _MediaRealEstateWidgetState();
// }
//
// class _MediaRealEstateWidgetState extends State<MediaRealEstateWidget> with TickerProviderStateMixin {
//   late TabController tabController;
//   PageController pageController = PageController();
//   YoutubePlayerController? _controller;
//
//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;
//   double _volume = 100;
//   bool _muted = false;
//   bool _isPlayerReady = false;
//   int tabIndex = 0;
//   int currentPage = 0;
//
//   String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
//     if (!url.contains("http") && (url.length == 11)) return url;
//     if (trimWhitespaces) url = url.trim();
//
//     for (var exp in [
//       RegExp(r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
//       RegExp(r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
//       RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
//     ]) {
//       Match? match = exp.firstMatch(url);
//       if (match != null && match.groupCount >= 1) return match.group(1);
//     }
//
//     return null;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     widget.video != [] && widget.video!.length > 0
//         ? _controller = YoutubePlayerController(
//             initialVideoId: YoutubePlayer.convertUrlToId(widget.video![0].path!)!,
//             // convertUrlToId(widget.video![0].path!).toString(),
//             flags: const YoutubePlayerFlags(
//               mute: false,
//               autoPlay: false,
//               disableDragSeek: false,
//               loop: false,
//               isLive: false,
//               forceHD: false,
//               enableCaption: true,
//             ),
//           )
//         : null
//       // YoutubePlayerController(initialVideoId: 'h7cOOfpdEfk')
//       ?..addListener(listener);
//
//     tabController = TabController(length: 3, vsync: this, initialIndex: 0);
//     tabController.addListener(() {
//       setState(() {
//         tabIndex = tabController.index;
//       });
//     });
//   }
//
//   void listener() {
//     if (_isPlayerReady && mounted && !_controller!.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller!.value.playerState;
//         _videoMetaData = _controller!.metadata;
//       });
//     }
//   }
//
//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     if (widget.video != [] && widget.video!.length > 0) _controller!.pause();
//     super.deactivate();
//   }
//
//   @override
//   void dispose() {
//     if (widget.video != [] && widget.video!.length > 0) _controller!.dispose();
//     pageController.dispose();
//     super.dispose();
//   }
//
//   void onChangePage(int page) {
//     currentPage = page;
//     print('$currentPage');
//     //count = count +1;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorResources.WHITE,
//       appBar: PreferredSize(
//         preferredSize: RkSize.sizeIncludeTop, // here the desired height
//         child: RkAppBar(
//           title: "Media",
//           colorBG: ColorResources.BLACK,
//           colorTitle: ColorResources.WHITE,
//           actions: [SizedBox()],
//         ),
//       ),
//       body: SafeArea(
//         bottom: false,
//         child: Container(
//           color: ColorResources.BLACK,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: RkDimensions.ONE_UNIT_FONT * 10,
//               ),
//               //tabBar
//               Container(
//                 width: Get.width,
//                 height: RkDimensions.ONE_UNIT_FONT * 60,
//                 // decoration: BoxDecoration(
//                 //   color: ColorResources.WHITE,
//                 // ),
//                 child: TabBar(
//                   controller: tabController,
//                   indicator: BoxDecoration(
//                       // border: Border(
//                       //   bottom: BorderSide(
//                       //     color: ColorResources.COLOR_EE3439,
//                       //     width: 2,
//                       //   ),
//                       // ),
//                       ),
//                   isScrollable: true,
//                   labelColor: ColorResources.COLOR_EE3439,
//                   unselectedLabelColor: ColorResources.GRAY2,
//                   labelStyle: TextStyle(
//                     fontFamily: Roboto,
//                     fontWeight: FontWeight.w500,
//                     fontSize: RkDimensions.ONE_UNIT_FONT * 18,
//                     color: ColorResources.COLOR_515151,
//                   ),
//                   // labelPadding: EdgeInsets.symmetric(horizontal: RkDimensions.ONE_UNIT_FONT * 20.0),
//                   physics: BouncingScrollPhysics(),
//                   tabs: [
//                     widget.img != [] && widget.img!.length > 0
//                         ? Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: tabIndex == 0 ? ColorResources.WHITE : Colors.transparent,
//                               ),
//                             ),
//                             padding: EdgeInsets.all(RkDimensions.ONE_UNIT_FONT * 10),
//                             child: Row(
//                               children: [
//                                 RkImage(
//                                   ImagesPath.img_photo_gallery,
//                                   height: RkDimensions.ONE_UNIT_FONT * 30,
//                                   width: RkDimensions.ONE_UNIT_FONT * 30,
//                                 ),
//                                 SizedBox(
//                                   width: RkDimensions.ONE_UNIT_FONT * 10,
//                                 ),
//                                 RkText(
//                                   "Hình ảnh",
//                                   style: TextStyle(
//                                     fontFamily: Roboto,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: RkDimensions.ONE_UNIT_FONT * 14,
//                                     color: ColorResources.WHITE,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : SizedBox(),
//                     widget.video != [] && widget.video!.length > 0
//                         ? Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: tabIndex == 1 ? ColorResources.WHITE : Colors.transparent,
//                               ),
//                             ),
//                             padding: EdgeInsets.all(RkDimensions.ONE_UNIT_FONT * 10),
//                             child: Row(
//                               children: [
//                                 RkImage(
//                                   ImagesPath.img_cinema,
//                                   height: RkDimensions.ONE_UNIT_FONT * 30,
//                                   width: RkDimensions.ONE_UNIT_FONT * 30,
//                                 ),
//                                 SizedBox(
//                                   width: RkDimensions.ONE_UNIT_FONT * 10,
//                                 ),
//                                 RkText(
//                                   "Video",
//                                   style: TextStyle(
//                                     fontFamily: Roboto,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: RkDimensions.ONE_UNIT_FONT * 14,
//                                     color: ColorResources.WHITE,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : SizedBox(),
//                     widget.img360 != [] && widget.img360!.length > 0
//                         ? Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: tabIndex == 2 ? ColorResources.WHITE : Colors.transparent,
//                               ),
//                             ),
//                             padding: EdgeInsets.all(RkDimensions.ONE_UNIT_FONT * 10),
//                             child: Row(
//                               children: [
//                                 RkImage(
//                                   ImagesPath.img_360_view,
//                                   height: RkDimensions.ONE_UNIT_FONT * 30,
//                                   width: RkDimensions.ONE_UNIT_FONT * 30,
//                                 ),
//                                 SizedBox(
//                                   width: RkDimensions.ONE_UNIT_FONT * 10,
//                                 ),
//                                 RkText(
//                                   "Ảnh 360",
//                                   style: TextStyle(
//                                     fontFamily: Roboto,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: RkDimensions.ONE_UNIT_FONT * 14,
//                                     color: ColorResources.WHITE,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : SizedBox(),
//                   ],
//                 ),
//               ),
//               // tabBar view
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: RkDimensions.ONE_UNIT_SIZE * 20,
//                   ),
//                   child: TabBarView(
//                     controller: tabController,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       widget.img != [] && widget.img!.length > 0
//                           ? SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                       height: RkDimensions.screenSize.height * 0.6,
//                                       width: RkDimensions.screenSize.width,
//                                       child: PageView.builder(
//                                         dragStartBehavior: DragStartBehavior.down,
//                                         allowImplicitScrolling: false,
//                                         reverse: false,
//                                         controller: pageController,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: widget.img!.length,
//                                         onPageChanged: (i) {
//                                           onChangePage(i);
//                                         },
//                                         itemBuilder: (BuildContext context, i) {
//                                           return PhotoView(
//                                             imageProvider: CachedNetworkImageProvider(BASE_URL_IMAGE + widget.img![currentPage].path!),
//                                             // heroAttributes: PhotoViewHeroAttributes(tag: photoDate),
//                                           );
//                                         },
//                                       )),
//                                   Container(
//                                     width: RkDimensions.screenSize.width,
//                                     height: RkDimensions.ONE_UNIT_FONT * 80,
//                                     padding: EdgeInsets.symmetric(
//                                         // horizontal: RkDimensions.ONE_UNIT_FONT * 10,
//                                         ),
//                                     child: ListView.builder(
//                                       itemBuilder: (BuildContext context, int i) {
//                                         return GestureDetector(
//                                           onTap: () {
//                                             onChangePage(i);
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                   color: currentPage == i ? ColorResources.COLOR_EE3439 : Colors.transparent,
//                                                   width: 1,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 5)),
//                                             margin: EdgeInsets.only(
//                                               right: RkDimensions.ONE_UNIT_FONT * 5,
//                                             ),
//                                             child: Stack(
//                                               children: [
//                                                 RkImage(
//                                                   BASE_URL_IMAGE + widget.img![i].path!,
//                                                   width: RkDimensions.ONE_UNIT_FONT * 90,
//                                                   height: RkDimensions.ONE_UNIT_FONT * 80,
//                                                   borderRadius: RkDimensions.ONE_UNIT_FONT * 5,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       itemCount: widget.img!.length,
//                                       shrinkWrap: true,
//                                       padding: EdgeInsets.zero,
//                                       scrollDirection: Axis.horizontal,
//                                       physics: BouncingScrollPhysics(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : SizedBox(),
//                       widget.video != [] && widget.video!.length > 0
//                           ? YoutubePlayerBuilder(
//                               onExitFullScreen: () {
//                                 // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//                                 SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//                               },
//                               player: YoutubePlayer(
//                                 controller: _controller!,
//                                 showVideoProgressIndicator: true,
//                                 progressIndicatorColor: Colors.blueAccent,
//                                 topActions: <Widget>[
//                                   const SizedBox(width: 8.0),
//                                   Expanded(
//                                     child: Text(
//                                       _controller!.metadata.title,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18.0,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.settings,
//                                       color: Colors.white,
//                                       size: 25.0,
//                                     ),
//                                     onPressed: () {
//                                       print('Settings Tapped!');
//                                     },
//                                   ),
//                                 ],
//                                 onReady: () {
//                                   _isPlayerReady = true;
//                                   // _controller!.addListener(listener);
//                                 },
//                                 onEnded: (data) {},
//                               ),
//                               builder: (context, player) => Scaffold(
//                                 body: Container(
//                                   color: Colors.white,
//                                   child: ListView(
//                                     children: [
//                                       player,
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : SizedBox(),
//                       widget.img360 != [] && widget.img360!.length > 0
//                           ? SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                       height: RkDimensions.screenSize.height * 0.6,
//                                       width: RkDimensions.screenSize.width,
//                                       child: PageView.builder(
//                                         dragStartBehavior: DragStartBehavior.down,
//                                         allowImplicitScrolling: false,
//                                         reverse: false,
//                                         controller: pageController,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         itemCount: widget.img360!.length,
//                                         onPageChanged: (i) {
//                                           onChangePage(i);
//                                         },
//                                         itemBuilder: (BuildContext context, i) {
//                                           return
//                                               //   CachedNetworkImage(
//                                               //   imageUrl: BASE_URL_IMAGE + widget.img360![currentPage].path!,
//                                               //   fit: BoxFit.cover,
//                                               //   placeholder: (context, url) => Container(
//                                               //     child: Center(
//                                               //       child: CircularProgressIndicator(),
//                                               //     ),
//                                               //   ),
//                                               //   imageBuilder: (context, imageProvider) => PanoramaViewer(
//                                               //     sensorControl: SensorControl.orientation,
//                                               //     onImageLoad: () {},
//                                               //     child: Image.network(BASE_URL_IMAGE + widget.img360![currentPage].path!),
//                                               //   ),
//                                               //   errorWidget: (context, url, error) => const Icon(Icons.error),
//                                               // );
//                                               PanoramaViewer(
//                                             sensorControl: SensorControl.orientation,
//                                             onImageLoad: () {
//                                               // EasyLoading.show(status: "loading".tr);
//                                             },
//                                             child: Image.network(
//                                               BASE_URL_IMAGE + widget.img360![currentPage].path!,
//                                             ),
//                                           );
//                                           //   RkImage(
//                                           //   widget.img360![currentPage]["path"],
//                                           //   fit: BoxFit.contain,
//                                           //   // heroAttributes: PhotoViewHeroAttributes(tag: photoDate),
//                                           // );
//                                         },
//                                       )),
//                                   Container(
//                                     width: RkDimensions.screenSize.width,
//                                     height: RkDimensions.ONE_UNIT_FONT * 80,
//                                     padding: EdgeInsets.symmetric(
//                                         // horizontal: RkDimensions.ONE_UNIT_FONT * 10,
//                                         ),
//                                     child: ListView.builder(
//                                       itemBuilder: (BuildContext context, int i) {
//                                         return GestureDetector(
//                                           onTap: () {
//                                             onChangePage(i);
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                   color: currentPage == i ? ColorResources.COLOR_EE3439 : Colors.transparent,
//                                                   width: 1,
//                                                 ),
//                                                 borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 5)),
//                                             margin: EdgeInsets.only(
//                                               right: RkDimensions.ONE_UNIT_FONT * 5,
//                                             ),
//                                             child: Stack(
//                                               children: [
//                                                 RkImage(
//                                                   BASE_URL_IMAGE + widget.img360![i].path!,
//                                                   width: RkDimensions.ONE_UNIT_FONT * 90,
//                                                   height: RkDimensions.ONE_UNIT_FONT * 80,
//                                                   borderRadius: RkDimensions.ONE_UNIT_FONT * 5,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       itemCount: widget.img360!.length,
//                                       shrinkWrap: true,
//                                       padding: EdgeInsets.zero,
//                                       scrollDirection: Axis.horizontal,
//                                       physics: BouncingScrollPhysics(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//
//                           // MediaPanoramaWidget(
//                           //         img360: widget.img360,
//                           //       )
//                           : Container(
//                               // height: 300,
//                               // width: 300,
//                               // child: Center(
//                               //   child: PanoramaViewer(child: Image.asset(ImagesPath.panorama1)),
//                               // ),
//                               ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MediaPanoramaWidget extends StatefulWidget {
  const MediaPanoramaWidget({
    Key? key,
    this.img360,
  }) : super(key: key);

  final List? img360;

  @override
  State<MediaPanoramaWidget> createState() => _MediaPanoramaWidgetState();
}

class _MediaPanoramaWidgetState extends State<MediaPanoramaWidget> {
  int currentPage = 0;
  PageController pageController = PageController();
  void onChangePage(int page) {
    currentPage = page;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // CachedNetworkImage(
          //   imageUrl: 'https://techvr360.com/wp-content/uploads/2021/06/chup-anh-360-do-3-1.jpg',
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => Container(
          //     child: Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   ),
          //   imageBuilder: (context, imageProvider) => PanoramaViewer(
          //     animSpeed: 1.0,
          //     sensorControl: SensorControl.orientation,
          //     child: Image.network("https://techvr360.com/wp-content/uploads/2021/06/chup-anh-360-do-3-1.jpg"),
          //   ),
          // ),

          // PanoramaViewer(child: Image.network("${ BASE_URL_IMAGE +widget.img360![currentPage]["path"])}"),
          SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: RkDimensions.screenSize.height * 0.6,
                width: RkDimensions.screenSize.width,
                child: PageView.builder(
                  dragStartBehavior: DragStartBehavior.down,
                  allowImplicitScrolling: false,
                  reverse: false,
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.img360!.length,
                  onPageChanged: (i) {
                    onChangePage(i);
                  },
                  itemBuilder: (BuildContext context, i) {
                    return CachedNetworkImage(
                      imageUrl: 'https://techvr360.com/wp-content/uploads/2021/06/chup-anh-360-do-3-1.jpg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => PanoramaViewer(
                        animSpeed: 1.0,
                        sensorControl: SensorControl.orientation,
                        child: Image.network("https://techvr360.com/wp-content/uploads/2021/06/chup-anh-360-do-3-1.jpg"),
                      ),
                    );
                    // PanoramaViewer(child: Image.network(widget.img360![currentPage]["path"]));
                    //   RkImage(
                    //   widget.img360![currentPage]["path"],
                    //   fit: BoxFit.contain,
                    //   // heroAttributes: PhotoViewHeroAttributes(tag: photoDate),
                    // );
                  },
                )),
            Container(
              width: RkDimensions.screenSize.width,
              height: RkDimensions.ONE_UNIT_FONT * 80,
              padding: EdgeInsets.symmetric(
                  // horizontal: RkDimensions.ONE_UNIT_FONT * 10,
                  ),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      onChangePage(i);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: currentPage == i ? ColorResources.COLOR_EE3439 : Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_FONT * 5)),
                      margin: EdgeInsets.only(
                        right: RkDimensions.ONE_UNIT_FONT * 5,
                      ),
                      child: Stack(
                        children: [
                          RkImage(
                            widget.img360![i]["path"],
                            width: RkDimensions.ONE_UNIT_FONT * 90,
                            height: RkDimensions.ONE_UNIT_FONT * 80,
                            borderRadius: RkDimensions.ONE_UNIT_FONT * 5,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: widget.img360!.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
