import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:get/get.dart' hide ScreenType;
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sizer/sizer.dart';
import 'package:template/base_widget/background/background_gradient.dart';
import 'package:template/helper/rk_size.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../base_widget/rk_image.dart';
import '../../base_widget/rk_screen.dart';
import '../../helper/rk_dimensions.dart';
import '../../utils/images_path.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // appBar: AppBar(),
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: controller.clearDrawings, // Add a button to clear drawings
        //     child: Icon(Icons.clear),
        //   ),
        //   body: FutureBuilder(
        //     future: Permission.location.request().isGranted,
        //     builder: (context, snapshot) {
        //       // if (!snapshot.hasData) {
        //       //   return Container();
        //       // } else {
        //       return FutureBuilder<LocationData>(
        //         future: controller.requestCurrentLocation(),
        //         builder: (context, AsyncSnapshot<LocationData> snapshot) {
        //           if (!snapshot.hasData) {
        //             print("------NoData");
        //           } else {
        //             print("------hasData");
        //             LocationData location = snapshot.data!;
        //             controller.location = LatLng(
        //               location.latitude!,
        //               location.longitude!,
        //             );
        //             controller.addMaker(controller.location!);
        //             // if (!controller.isHaveLocation) {
        //             //   controller.isHaveLocation = true;
        //             //   if(!controller.isSelectedAddress){
        //             //     controller.onGetAddressFromLocation(controller.location);
        //             //   }
        //             // }
        //           }
        //
        //           return GestureDetector(
        //             onPanUpdate: (details) {
        //               RenderBox renderBox = context.findRenderObject() as RenderBox;
        //               controller.point.add(renderBox.globalToLocal(details.globalPosition));
        //               controller.update();
        //             },
        //             onPanEnd: (details) {
        //               controller.segments.add(List.from(controller.point));
        //               controller.point.clear();
        //               controller.update();
        //             },
        //             // onLongPress: () {
        //             //   addPoint(LatLng(20.981971, 105.864323));
        //             //   print("object");
        //             //   controller.update();
        //             // }, // Capture long presses for adding points
        //             child: GoogleMap(
        //               myLocationEnabled: true,
        //               mapType: MapType.normal,
        //               initialCameraPosition: controller.location != null
        //                   ? CameraPosition(
        //                       target: controller.location!,
        //                       zoom: 14.4746,
        //                     )
        //                   : CameraPosition(
        //                       target: LatLng(20.981971, 105.864323),
        //                       zoom: 5,
        //                     ),
        //               onMapCreated: (GoogleMapController controller) {
        //                 Completer<GoogleMapController>();
        //               },
        //               onTap: (LatLng point) {
        //                 controller.addPoint(point);
        //               },
        //               polylines: controller.polylines,
        //               polygons: controller.polygons,
        //               circles: controller.circles,
        //             ),
        //           );
        //
        //           //   GoogleMap(
        //           //   myLocationEnabled: true,
        //           //   mapType: MapType.normal,
        //           //   markers: controller.markers,
        //           //   // [
        //           //   //   Marker(
        //           //   //     markerId: MarkerId('1'),
        //           //   //     icon: BitmapDescriptor.defaultMarker ,
        //           //   //     position: controller.location ?? LatLng(20.981971, 105.864323),
        //           //   //   )
        //           //   // ].toSet(),
        //           //   initialCameraPosition: controller.location != null
        //           //       ? CameraPosition(
        //           //           target: controller.location!,
        //           //           zoom: 14.4746,
        //           //         )
        //           //       : CameraPosition(
        //           //           target: LatLng(20.981971, 105.864323),
        //           //           zoom: 5,
        //           //         ),
        //           //   onMapCreated: (GoogleMapController controller) {
        //           //     Completer<GoogleMapController>();
        //           //   },
        //           //   circles: Set.from(
        //           //     [
        //           //       Circle(
        //           //         circleId: CircleId('currentCircle'),
        //           //         center: controller.location ?? LatLng(20.981971, 105.864323),
        //           //         radius: 1500,
        //           //         fillColor: Colors.blue.shade100.withOpacity(0.5),
        //           //         strokeColor: Colors.red.withOpacity(0.5),
        //           //         strokeWidth: 1,
        //           //       ),
        //           //     ],
        //           //   ),
        //           // );
        //         },
        //       );
        //       // }
        //     },
        //   )
        //
        //   // GoogleMap(
        //   //   mapType: MapType.normal,
        //   //   initialCameraPosition: CameraPosition(
        //   //     target: LatLng(37.42796133580664, -122.085749655962),
        //   //     zoom: 14.4746,
        //   //   ),
        //   //   onMapCreated: (GoogleMapController controller) {
        //   //     Completer<GoogleMapController>();
        //   //   },
        //   // ),
        //   // floatingActionButton: FloatingActionButton.extended(
        //   //   onPressed: () async {
        //   //     final GoogleMapController controller = await Completer<GoogleMapController>().future;
        //   //     await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //   //       target: LatLng(37.42796133580664, -122.085749655962),
        //   //       zoom: 14.4746,
        //   //     )));
        //   //   },
        //   //   label: const Text('To the lake!'),
        //   //   icon: const Icon(Icons.directions_boat),
        //   // ),
        //
        //   body: Center(
        //     child: PanoramaViewer(child: Image.asset(ImagesPath.panorama1)),
        //   ),
        // );
        RkScreen(
      isSingleChildScrollView: false,
      isDisplayDesirePaddingTop: false,
      background: BackgroundGradient(),
      body: OrientationBuilder(builder: (context, orientation) {
        return GetBuilder(
          init: SplashController(),
          builder: (SplashController controller) {
            return RkSize.device == RkDevice.IPHONE
                ?
                // Device.deviceType == ScreenType.mobile
                //   ?
                Container(
                    height: RkDimensions.screenSize.height,
                    width: RkDimensions.screenSize.width,
                    // child: Center(
                    // child: Stack(
                    //   children: [
                    child: RkImage(
                      ImagesPath.img_splash,
                      fit: BoxFit.cover,
                    ),
                    // Positioned(
                    //   left: RkDimensions.ONE_UNIT_FONT * 20,
                    //   bottom: RkDimensions.screenSize.height * 0.33,
                    //   child: RkImage(
                    //     ImagesPath.img_logo_rakhoiweb,
                    //     width: RkDimensions.screenSize.width * 0.85,
                    //   ),
                    // ),
                    // ],
                    // ),
                    // ),
                  )
                : orientation == Orientation.portrait
                    ? Container(
                        // height: RkDimensions.screenSize.height,
                        // width: RkDimensions.screenSize.width,
                        child: Center(
                          child: Stack(
                            children: [
                              // orientation == Orientation.portrait
                              //     ?
                              RkImage(
                                ImagesPath.img_splash_tablet,
                                fit: BoxFit.contain,
                              ),
                              // : RkImage(
                              //     ImagesPath.img_splash_landscape,
                              //     fit: BoxFit.contain,
                              //   ),
                              Positioned(
                                left: RkDimensions.ONE_UNIT_FONT * 20,
                                bottom: RkDimensions.screenSize.height * 0.28,
                                child: RkImage(
                                  ImagesPath.img_logo_rakhoiweb,
                                  width: RkDimensions.screenSize.width * 0.85,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        // height: RkDimensions.screenSize.height,
                        // width: RkDimensions.screenSize.width,
                        child: Center(
                          child: Stack(
                            children: [
                              // orientation == Orientation.portrait
                              //     ? RkImage(
                              //   ImagesPath.img_splash_tablet,
                              //   fit: BoxFit.contain,
                              // )
                              //     :
                              RkImage(
                                ImagesPath.img_splash_landscape,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                left: RkDimensions.ONE_UNIT_FONT * 20,
                                bottom: RkDimensions.screenSize.height * 0.15,
                                child: RkImage(
                                  ImagesPath.img_logo_rakhoiweb,
                                  width: RkDimensions.screenSize.width * 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
          },
        );
      }),
    );
  }
}

// class MapWithCircleDrawing extends StatefulWidget {
//   @override
//   _MapWithCircleDrawingState createState() => _MapWithCircleDrawingState();
// }
//
// class _MapWithCircleDrawingState extends State<MapWithCircleDrawing> {
//   GoogleMapController? _controller;
//   LatLng? _center;
//   double _radius = 1000.0; // Initial radius in meters
//   Set<Circle> _circles = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Interactive Circle Drawing on Google Map'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(20.981971, 105.864323),
//           zoom: 14.0,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           setState(() {
//             _controller = controller;
//             _center = LatLng(20.981971, 105.864323);
//           });
//         },
//         circles: _circles,
//         onTap: _onMapTap,
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: _increaseRadius,
//             child: Icon(Icons.add),
//           ),
//           SizedBox(height: 16.0),
//           FloatingActionButton(
//             onPressed: _decreaseRadius,
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onMapTap(LatLng point) {
//     setState(() {
//       _center = point;
//       _circles.clear();
//       _drawCircle(point, _radius);
//     });
//   }
//
//   void _drawCircle(LatLng center, double radius) {
//     _circles.add(
//       Circle(
//         circleId: CircleId('circle'),
//         center: center,
//         radius: radius,
//         fillColor: Colors.blue.withOpacity(0.3),
//         strokeColor: Colors.blue,
//         strokeWidth: 2,
//       ),
//     );
//   }
//
//   void _increaseRadius() {
//     setState(() {
//       if (_center != null) {
//         _radius += 100.0; // Increase the radius
//         _circles.clear();
//         _drawCircle(_center!, _radius);
//       }
//     });
//   }
//
//   void _decreaseRadius() {
//     setState(() {
//       if (_center != null && _radius > 100.0) {
//         _radius -= 100.0; // Decrease the radius, but keep it positive
//         _circles.clear();
//         _drawCircle(_center!, _radius);
//       }
//     });
//   }
// }

class GridWithScrollControllerExample extends StatefulWidget {
  const GridWithScrollControllerExample({Key? key}) : super(key: key);

  @override
  GridWithScrollControllerExampleState createState() => GridWithScrollControllerExampleState();
}

class GridWithScrollControllerExampleState extends State<GridWithScrollControllerExample> {
  final List<DraggableGridItem> _listOfDraggableGridItem = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    _generateImageData();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("widget.title"),
      ),
      body: SafeArea(
        child: DraggableGridViewBuilder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3),
          ),
          children: _listOfDraggableGridItem,
          dragCompletion: onDragAccept,
          isOnlyLongPress: false,
          dragFeedback: feedback,
          dragPlaceHolder: placeHolder,
        ),
      ),
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return SizedBox(
      width: 200,
      height: 150,
      child: list[index].child,
    );
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    print('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: RkImage(ImagesPath.img_splash),
          isDraggable: true,
          dragCallback: (context, isDragging) {},
        ),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
        DraggableGridItem(child: RkImage(ImagesPath.img_splash), isDraggable: true),
      ],
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({
    Key? key,
  }) : super(key: key);

  // final String title;

  @override
  State<MyHomePage1> createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  int _indexOfDroppedItem = 0;
  bool _isDragging = false;

  void _acceptDraggedItem(int index) {
    setState(() {
      _indexOfDroppedItem = index;
    });
  }

  void _setIsDragging() {
    setState(() {
      _isDragging = true;
    });
  }

  void _resetIsDragging() {
    setState(() {
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.all(44.0),
              child: index == _indexOfDroppedItem
                  ? Draggable<int>(
                      data: index,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                      ),
                      childWhenDragging: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))),
                      ),
                      onDragStarted: () {
                        _setIsDragging();
                      },
                      onDraggableCanceled: (_, __) {
                        _resetIsDragging();
                      },
                      onDragCompleted: () {
                        _resetIsDragging();
                      },
                      feedback: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    )
                  : DragTarget<int>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                            decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.all(_isDragging ? const Radius.circular(20) : const Radius.circular(10)),
                        ));
                      },
                      onAccept: (int data) {
                        _acceptDraggedItem(index);
                      },
                    ),
            );
          }),
        ),
      ),
    );
  }
}

class YoutubePlayerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

/// Homepage
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              print('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              'assets/ypf.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.video_library),
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => VideoList(),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  _text('Title', _videoMetaData.title),
                  _space,
                  _text('Channel', _videoMetaData.author),
                  _space,
                  _text('Video Id', _videoMetaData.videoId),
                  _space,
                  Row(
                    children: [
                      _text(
                        'Playback Quality',
                        _controller.value.playbackQuality ?? '',
                      ),
                      const Spacer(),
                      _text(
                        'Playback Rate',
                        '${_controller.value.playbackRate}x  ',
                      ),
                    ],
                  ),
                  _space,
                  TextField(
                    enabled: _isPlayerReady,
                    controller: _idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueAccent.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _idController.clear(),
                      ),
                    ),
                  ),
                  _space,
                  Row(
                    children: [
                      _loadCueButton('LOAD'),
                      const SizedBox(width: 10.0),
                      _loadCueButton('CUE'),
                    ],
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length]) : null,
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: _isPlayerReady
                            ? () {
                                _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                setState(() {});
                              }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                        onPressed: _isPlayerReady
                            ? () {
                                _muted ? _controller.unMute() : _controller.mute();
                                setState(() {
                                  _muted = !_muted;
                                });
                              }
                            : null,
                      ),
                      FullScreenButton(
                        controller: _controller,
                        color: Colors.blueAccent,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length]) : null,
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: <Widget>[
                      const Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: _isPlayerReady
                              ? (value) {
                                  setState(() {
                                    _volume = value;
                                  });
                                  _controller.setVolume(_volume.round());
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  _space,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = [
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List Demo'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: const EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(isExpanded: true),
              const SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class SliversExample extends StatefulWidget {
  @override
  _SliversExampleState createState() => _SliversExampleState();
}

class _SliversExampleState extends State<SliversExample> with TickerProviderStateMixin {
  final greenKey = new GlobalKey();
  final blueKey = new GlobalKey();
  final orangeKey = new GlobalKey();
  final yellowKey = new GlobalKey();
  final sliverListtKey = new GlobalKey();
  RenderBox? overRender;
  RenderBox? revRender;
  RenderBox? menuRender;
  RenderBox? contactRender;
  RenderBox? sliverRender;
  ScrollController? scrollController;
  TabController? tabController;
  TabController? _topTabController;
  double? greenHeight;
  double? blueHeight;
  double? orangeHeight;
  double? yellowHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    tabController = new TabController(length: 4, vsync: this);
    // _topTabController = new TabController(length: 4, vsync: this);
    addScrollControllerListener();
  }

  void addScrollControllerListener() {
    scrollController!.addListener(() {
      if (greenKey.currentContext != null) {
        greenHeight = greenKey.currentContext!.size!.height;
      }
      if (blueKey.currentContext != null) {
        blueHeight = blueKey.currentContext!.size!.height;
      }
      if (orangeKey.currentContext != null) {
        orangeHeight = orangeKey.currentContext!.size!.height;
      }
      if (yellowKey.currentContext != null) {
        yellowHeight = yellowKey.currentContext!.size!.height;
      }
      if (scrollController!.offset > greenHeight! + 200 && scrollController!.offset < blueHeight! + greenHeight! + 200) {
      } else {}
      if (scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
        if (scrollController!.offset > 0 && scrollController!.offset < greenHeight! + 200) {
          tabController!.animateTo(0);
        } else if (scrollController!.offset > greenHeight! + 200 && scrollController!.offset < blueHeight! + greenHeight! + 200) {
          tabController!.animateTo(1);
        } else if (scrollController!.offset > blueHeight! + greenHeight! + 200 && scrollController!.offset < blueHeight! + greenHeight! + orangeHeight! + 200) {
          tabController!.animateTo(2);
        } else if (scrollController!.offset > blueHeight! + greenHeight! + orangeHeight! + 200 && scrollController!.offset <= blueHeight! + greenHeight! + orangeHeight! + yellowHeight! + 200) {
          tabController!.animateTo(3);
        } else {}
      } else if (scrollController!.position.userScrollDirection == ScrollDirection.forward) {
        if (scrollController!.offset < greenHeight!) {
          tabController!.animateTo(0);
        } else if (scrollController!.offset > greenHeight! && scrollController!.offset < blueHeight! + greenHeight!) {
          tabController!.animateTo(1);
        } else if (scrollController!.offset > blueHeight! + greenHeight! && scrollController!.offset < blueHeight! + greenHeight! + orangeHeight!) {
          tabController!.animateTo(2);
        } else if (scrollController!.offset > blueHeight! + greenHeight! + orangeHeight! && scrollController!.offset < blueHeight! + greenHeight! + orangeHeight! + yellowHeight!) {
          tabController!.animateTo(3);
        } else {}
      }
    });
  }

  void tabBarOnTap(val) {
    switch (val) {
      case 0:
        {
          if (greenKey.currentContext == null) {
            scrollController!.position!
                .ensureVisible(
              orangeKey.currentContext!.findRenderObject() as RenderBox,
              alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 200),
            )
                .then((value) {
              scrollController!.position!
                  .ensureVisible(
                orangeKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position!
                    .ensureVisible(
                  blueKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position!.ensureVisible(
                    greenKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            });
          } else {
            scrollController!.position.ensureVisible(
              greenKey.currentContext!.findRenderObject() as RenderBox,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
      case 1:
        {
          if (blueKey.currentContext == null) {
            if (tabController!.previousIndex == 0) {
              scrollController!.position
                  .ensureVisible(
                greenKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position
                    .ensureVisible(
                  greenKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position!.ensureVisible(
                    blueKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            } else {
              scrollController!.position
                  .ensureVisible(
                orangeKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position
                    .ensureVisible(
                  orangeKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.0,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position
                      .ensureVisible(
                    blueKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.5,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController!.position.ensureVisible(
                      blueKey.currentContext!.findRenderObject() as RenderBox,
                      alignment: 0.0,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    );
                  });
                });
              });
            }
          } else {
            scrollController!.position!.ensureVisible(
              blueKey.currentContext!.findRenderObject() as RenderBox,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 400),
            );
          }
        }
        break;
      case 2:
        {
          if (orangeKey.currentContext == null) {
            if (tabController!.previousIndex == 0) {
              scrollController!.position
                  .ensureVisible(
                greenKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position
                    .ensureVisible(
                  greenKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position
                      .ensureVisible(
                    blueKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController!.position
                        .ensureVisible(
                      blueKey.currentContext!.findRenderObject() as RenderBox,
                      alignment: 0.5,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController!.position.ensureVisible(
                        orangeKey.currentContext!.findRenderObject() as RenderBox,
                        alignment: 0.2,
                        // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      );
                    });
                  });
                });
              });
            } else if (tabController!.previousIndex == 1) {
              scrollController!.position
                  .ensureVisible(
                blueKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position!.ensureVisible(
                  orangeKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.2,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                );
              });
            }
          } else {
            scrollController!.position.ensureVisible(
              orangeKey.currentContext!.findRenderObject() as RenderBox,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 600),
            );
          }
        }
        break;
      case 3:
        {
          if (yellowKey.currentContext == null) {
            if (tabController!.previousIndex == 0) {
              scrollController!.position
                  .ensureVisible(
                greenKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position
                    .ensureVisible(
                  greenKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.5, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position
                      .ensureVisible(
                    blueKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController!.position
                        .ensureVisible(
                      blueKey.currentContext!.findRenderObject() as RenderBox,
                      alignment: 0.5, // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController!.position
                          .ensureVisible(
                        orangeKey.currentContext!.findRenderObject() as RenderBox,
                        alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      )
                          .then((value) {
                        scrollController!.position
                            .ensureVisible(
                          orangeKey.currentContext!.findRenderObject() as RenderBox,
                          alignment: 0.5, // How far into view the item should be scrolled (between 0 and 1).
                          duration: const Duration(milliseconds: 200),
                        )
                            .then((value) {
                          scrollController!.position.ensureVisible(
                            yellowKey.currentContext!.findRenderObject() as RenderBox,
                            alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(milliseconds: 200),
                          );
                        });
                      });
                    });
                  });
                });
              });
            } else {
              scrollController!.position
                  .ensureVisible(
                blueKey.currentContext!.findRenderObject() as RenderBox,
                alignment: 1.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController!.position
                    .ensureVisible(
                  orangeKey.currentContext!.findRenderObject() as RenderBox,
                  alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController!.position.ensureVisible(
                    yellowKey.currentContext!.findRenderObject() as RenderBox,
                    alignment: 0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            }
          } else {
            scrollController!.position.ensureVisible(
              yellowKey.currentContext!.findRenderObject() as RenderBox,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
    }
  }

  SliverPersistentHeader makeTabBarHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
          color: Colors.white,
          child: TabBar(
            onTap: (val) {
              tabBarOnTap(val);
            },
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: Colors.red,
            indicatorWeight: 2.0,
            labelColor: Colors.red,
            controller: tabController,
            tabs: <Widget>[
              new Tab(
                child: Text(
                  "Green",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Blue",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Orange",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Yellow",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _topTabController!.dispose();
    scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: data.size.height / 5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          makeTabBarHeader(),
          SliverList(
            key: sliverListtKey,
            delegate: SliverChildListDelegate(
              [
                Container(
                  key: greenKey,
                  color: Colors.green,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: blueKey,
                  color: Colors.blue,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: orangeKey,
                  color: Colors.orange,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: yellowKey,
                  color: Colors.yellow,
                  height: data.size.height / 1.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> with TickerProviderStateMixin {
  PageController? pageController;
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
    pageController!.addListener(() {
      tabController!.animateTo(pageController!.page!.toInt());
    });
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: TabBar(
                onTap: (val) {
                  pageController!.animateToPage(val, duration: Duration(milliseconds: 100), curve: Curves.elasticInOut);
                },
                unselectedLabelColor: Colors.grey.shade700,
                indicatorColor: Colors.red,
                indicatorWeight: 2.0,
                labelColor: Colors.red,
                controller: tabController,
                tabs: [
                  new Tab(
                    child: Text(
                      "Green",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      "Blue",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      "Orange",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  new Tab(
                    child: Text(
                      "Yellow",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                allowImplicitScrolling: false,
                pageSnapping: false,
                physics: RangeMaintainingScrollPhysics(),
                controller: pageController,
                // key: sliverListtKey,
                children: [
                  Container(
                    color: Colors.green,
                    height: 100,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 700,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 500,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 900,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapWithCircleDrawing extends StatefulWidget {
  @override
  _MapWithCircleDrawingState createState() => _MapWithCircleDrawingState();
}

class _MapWithCircleDrawingState extends State<MapWithCircleDrawing> {
  GoogleMapController? _controller;
  LatLng? _startDragPosition;
  LatLng? _center;
  LatLng? _dragPoint;
  double _circleRadius = 1000.0; // Initial radius in meters
  Set<Circle> _circles = {};
  // bool _isDraggingRadius = false;
  String _radiusText = '';
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  bool isDrawPolygonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draw Circle on Google Map with Direct Radius Dragging'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleDrawing,
        backgroundColor: Colors.red,
        tooltip: 'Drawing',
        child: Icon((isDrawPolygonEnabled) ? Icons.cancel : Icons.edit),
      ),
      body: GestureDetector(
        onPanUpdate: isDrawPolygonEnabled == true ? _onPanUpdate : null,
        onPanEnd: isDrawPolygonEnabled == true
            ? (details) {
                // Clear the start drag position when dragging ends
                // setState(() {
                //   isDrawPolygonEnabled = false;
                // });
              }
            : null,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(20.981971, 105.864323),
            zoom: 14.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              _controller = controller;
              // _center = LatLng(20.981971, 105.864323);
            });
          },
          polylines: _polylines,
          circles: _circles,
          markers: _markers,
          onTap: _onMapTap,
        ),
      ),
    );
  }

  void toggleDrawing() {
    setState(() => isDrawPolygonEnabled = !isDrawPolygonEnabled);
  }

  void _onMapTap(LatLng point) {
    setState(() {
      _center = point;
      _dragPoint = point;
      _circles.clear();
      _markers.clear();
      _polylines.clear();
      _drawCircle();
      _drawPolyline();
      // _isDraggingRadius = false;
    });
  }

  void _drawPolyline() {
    if (_center != null && _dragPoint != null) {
      final List<LatLng> points = [_center!, _dragPoint!]; // List of points for the polyline
      final Polyline polyline = Polyline(
        polylineId: PolylineId('polyline'),
        color: Colors.red, // Color of the line
        points: points, // List of points
        width: 2, // Width of the line
      );

      // Add the polyline to the set of polylines
      _polylines.add(polyline);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) async {
    if (_center != null && _controller != null && isDrawPolygonEnabled == true) {
      final zoomLevel = await _controller!.getZoomLevel();
      setState(() {
        isDrawPolygonEnabled = true;
        _isDraggingRadius = true;
        final pixelDistance = details.localPosition.distance;
        final metersPerPixel = 156543.03392 * math.cos(_center!.latitude * math.pi / 180) / math.pow(2.15, zoomLevel);
        _circleRadius = pixelDistance * metersPerPixel;
        _drawCircle();
      });
    }
  }

  bool _isDraggingRadius = false;
  Offset? _startPan;
  double? _startRadius;

  // void _onPanUpdate(DragUpdateDetails details) {
  //   if (!_isDraggingRadius) {
  //     setState(() {
  //       _isDraggingRadius = true;
  //       _startPan = details.localPosition;
  //       _startRadius = _circleRadius;
  //     });
  //   } else {
  //     final dx = details.localPosition.dx - _startPan!.dx;
  //     final dy = details.localPosition.dy - _startPan!.dy;
  //     final dragDistance = math.sqrt(dx * dx + dy * dy);
  //
  //     setState(() {
  //       _circleRadius = (_startRadius! + dragDistance).clamp(0.0, double.infinity);
  //       _drawCircle();
  //     });
  //   }
  // }

  // void _drawCircle() {
  //   if (_center != null) {
  //     _circles.add(
  //       Circle(
  //         circleId: CircleId('circle'),
  //         center: _center!,
  //         radius: _circleRadius,
  //         fillColor: Colors.blue.withOpacity(0.3),
  //         strokeColor: Colors.blue,
  //         strokeWidth: 2,
  //       ),
  //     );
  //
  //     // Calculate the distance from the center to the radius point using the Haversine formula
  //     final distance = _calculateDistance();
  //     final formattedDistance = distance.toStringAsFixed(2);
  //
  //     // Create a custom marker for displaying the distance text
  //     final markerId = MarkerId('distance_marker');
  //     final latLng = _getIntermediatePoint(_center!, _dragPoint!, 0.5); // Midpoint
  //     final distanceText = 'Distance: $formattedDistance meters';
  //     final distanceMarker = Marker(
  //       markerId: markerId,
  //       position: latLng,
  //       icon: BitmapDescriptor.defaultMarker,
  //       infoWindow: InfoWindow(
  //         title: distanceText,
  //       ),
  //     );
  //
  //     // Create custom markers for center and radius point
  //     final centerMarker = Marker(
  //       markerId: MarkerId('center_marker'),
  //       position: _center!,
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //     );
  //
  //     final radiusMarker = Marker(
  //       markerId: MarkerId('radius_marker'),
  //       position: _dragPoint!,
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  //       infoWindow: InfoWindow(
  //         title: 'Radius Point',
  //       ),
  //     );
  //
  //     // Add all markers to the set of markers
  //     _markers.addAll([centerMarker, radiusMarker, distanceMarker]);
  //   }
  // }
  //
  double _calculateDistance() {
    if (_center != null && _dragPoint != null) {
      const double earthRadius = 6371000; // Earth's radius in meters
      final lat1 = _center!.latitude * math.pi / 180;
      final lon1 = _center!.longitude * math.pi / 180;
      final lat2 = _dragPoint!.latitude * math.pi / 180;
      final lon2 = _dragPoint!.longitude * math.pi / 180;

      final dlon = lon2 - lon1;
      final dlat = lat2 - lat1;

      final a = math.sin(dlat / 2) * math.sin(dlat / 2) + math.cos(lat1) * math.cos(lat2) * math.sin(dlon / 2) * math.sin(dlon / 2);

      final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

      final distance = earthRadius * c;
      return distance;
    }
    return 0.0;
  }

  LatLng _getIntermediatePoint(LatLng start, LatLng end) {
    final midLat = (start.latitude + end.latitude) / 2;
    final midLng = (start.longitude + end.longitude) / 2;
    return LatLng(midLat, midLng);
  }

  void _drawCircle() {
    if (_center != null) {
      _circles.add(
        Circle(
          circleId: CircleId('circle'),
          center: _center!,
          radius: _circleRadius,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeColor: Colors.blue,
          strokeWidth: 2,
        ),
      );

      _markers.add(
        Marker(
          markerId: MarkerId('center_marker'),
          position: _center!,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );

      // Calculate the position of the radiusMarker based on the center and radius
      final latLng = LatLng(
        _center!.latitude + (_circleRadius / 111320.0),
        _center!.longitude,
      );
      final distance = _calculateDistance();
      final formattedDistance = distance.toStringAsFixed(2);
      // Create a custom marker for displaying the radius text
      final markerId = MarkerId('radius_marker');
      final radiusText = 'Radius: ${_circleRadius.toStringAsFixed(2)} meters';
      final radiusMarker = Marker(
        markerId: markerId,
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: radiusText,
        ),
      );
      // Calculate the midpoint between the center and the radius point

      // Add the custom marker to the set of markers
      _markers.add(radiusMarker);
      _drawPolyline();
    }
  }
}

// class MapPage extends StatefulWidget {
//   // MapPage({required Key key}) : super(key: key);
//
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   static final Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(13.0827, 80.2707),
//     zoom: 14.4746,
//   );
//
//   final Set<Polygon> _polygons = HashSet<Polygon>();
//   final Set<Polyline> _polyLines = HashSet<Polyline>();
//
//   bool _drawPolygonEnabled = false;
//   List<LatLng> _userPolyLinesLatLngList = [];
//   bool _clearDrawing = false;
//   int? _lastXCoordinate, _lastYCoordinate;
//
//   List<LatLng> _mapLatLang = [];
//   List<LatLng> _latLang = [];
//
//   _getlatlan() {
//     setState(() => LatLng(13.0827, 80.2707));
//   }
//
//   _toggleDrawing() {
//     _clearPolygons();
//     setState(() => _drawPolygonEnabled = !_drawPolygonEnabled);
//   }
//
//   _onPanUpdate(DragUpdateDetails details) async {
//     // To start draw new polygon every time.
//     if (_clearDrawing) {
//       _clearDrawing = false;
//       _clearPolygons();
//     }
//
//     if (_drawPolygonEnabled) {
//       double? x, y;
//       if (Platform.isAndroid) {
//         // It times in 3 without any meaning,
//         // We think it's an issue with GoogleMaps package.
//         x = details.globalPosition.dx * 3;
//         y = details.globalPosition.dy * 3;
//       } else if (Platform.isIOS) {
//         x = details.globalPosition.dx;
//         y = details.globalPosition.dy;
//       }
//
//       // Round the x and y.
//       int xCoordinate = x!.round();
//       int yCoordinate = y!.round();
//
//       // Check if the distance between last point is not too far.
//       // to prevent two fingers drawing.
//       if (_lastXCoordinate != null && _lastYCoordinate != null) {
//         var distance = Math.sqrt(Math.pow(xCoordinate - _lastXCoordinate!, 2) + Math.pow(yCoordinate - _lastYCoordinate!, 2));
//
//         // Check if the distance of point and point is large.
//         if (distance > 80.0) return;
//       }
//
//       // Cached the coordinate.
//       _lastXCoordinate = xCoordinate;
//       _lastYCoordinate = yCoordinate;
//
//       ScreenCoordinate screenCoordinate = ScreenCoordinate(x: xCoordinate, y: yCoordinate);
//
//       final GoogleMapController controller = await _controller.future;
//       LatLng latLng = await controller.getLatLng(screenCoordinate);
//
//       try {
//         // Add new point to list.
//         _userPolyLinesLatLngList.add(latLng);
//         _latLang.add(latLng);
//
//         _polyLines.removeWhere((polyline) => polyline.polylineId.value == 'user_polyline');
//         _polyLines.add(
//           Polyline(
//             polylineId: PolylineId('user_polyline'),
//             points: _userPolyLinesLatLngList,
//             width: 2,
//             color: Colors.blue,
//           ),
//         );
//       } catch (e) {
//         print(" error painting $e");
//       }
//       setState(() {});
//     }
//   }
//
//   _onPanEnd(DragEndDetails details) async {
//     // Reset last cached coordinate
//     _lastXCoordinate = null;
//     _lastYCoordinate = null;
//
//     if (_drawPolygonEnabled) {
//       _polygons.removeWhere((polygon) => polygon.polygonId.value == 'user_polygon');
//       _polygons.add(
//         Polygon(
//           polygonId: PolygonId('user_polygon'),
//           points: _userPolyLinesLatLngList,
//           strokeWidth: 2,
//           strokeColor: Colors.blue,
//           fillColor: Colors.blue.withOpacity(0.4),
//         ),
//       );
//       setState(() {
//         _clearDrawing = true;
//         _mapLatLang = _userPolyLinesLatLngList;
//       });
//     }
//   }
//
//   _clearPolygons() {
//     setState(() {
//       _polyLines.clear();
//       _polygons.clear();
//       _userPolyLinesLatLngList.clear();
//     });
//   }
//
//   var lat = [LatLng(12.82879876203614, 80.12908793985844)];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Farm'),
//         iconTheme: IconThemeData(color: Colors.grey.shade800),
//         actions: <Widget>[
//           ElevatedButton(
//             // textColor: Colors.grey.shade800,
//             onPressed: () {
//               // _drawPolygonEnabled
//               //     ? Navigator.push(
//               //         context,
//               //         MaterialPageRoute(
//               //           builder: (context) => AddEditPage(data: new DataLat(_latLang)),
//               //         ),
//               //       )
//               //     : null;
//             },
//             child: _drawPolygonEnabled ? Text("Save") : Text("Draw"),
//             // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onPanUpdate: (_drawPolygonEnabled) ? _onPanUpdate : null,
//         onPanEnd: (_drawPolygonEnabled) ? _onPanEnd : null,
//         child: GoogleMap(
//           myLocationEnabled: true,
//           mapType: MapType.normal,
//           initialCameraPosition: _kGooglePlex,
//           polygons: _polygons,
//           polylines: _polyLines,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggleDrawing,
//         tooltip: 'Drawing',
//         child: new IconTheme(
//           data: new IconThemeData(color: Colors.grey.shade800),
//           child: new Icon((_drawPolygonEnabled) ? Icons.cancel : Icons.edit),
//         ),
//       ),
//     );
//   }
// }
//
// class DataLat {
//   List<LatLng> latLng;
//
//   DataLat(this.latLng);
// }
