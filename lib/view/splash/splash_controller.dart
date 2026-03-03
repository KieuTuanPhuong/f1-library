import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:sizer/sizer.dart';

import '../../data/provider/provider.dart';
import '../../di_container.dart';
import '../../routes/route_path/home_routes.dart';
import '../../sharedpref/shared_preference_helper.dart';

class SplashController extends GetxController {
  LatLng? location;
  Set<Marker> markers = {};
  BitmapDescriptor? customIcon;
  GoogleMapController? mapController;
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};
  List<LatLng> points = [];
  List<Offset> point = [];
  List<List<Offset>> segments = [];
  String access_token = sl<SharedPreferenceHelper>().getJwtToken;
  // DeviceType deviceType = DeviceType.mobile;
  bool? isLogin = false;
  final Provider provider = Provider();
  // DeleteMemberRequest deleteMemberRequest = DeleteMemberRequest();
  // VersionApp? versionApp;
  // String? versionAndroid;
  // String? versionIos;
  // String? currentVersion;

  @override
  void onInit() async {
    super.onInit();
    // requestCurrentLocation();
    // onCheckDevice();
    // if (Platform.isIOS) {
    //   BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(0, 0)), ImagesPath.test).then((d) {
    //     customIcon = d;
    //     update();
    //   });
    // } else {
    //   BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1, 1)), ImagesPath.test).then((d) {
    //     customIcon = d;
    //     update();
    //   });
    // }
    await FirebaseAnalytics.instance.logAppOpen();
    Future.delayed(const Duration(seconds: 1), () {
      // onGetInformationSystem();
      checkGuard();
    });

    // isLogin = sl.get<SharedPreferenceHelper>().getLogin;
    // Future.delayed(const Duration(seconds: 2), () {
    //   // Get.offAndToNamed(RootViewRoutes.ROOT_VIEW);
    //   Get.offAndToNamed(AuthRoutes.LOGIN);
    // });
  }

  // void onCheckDevice() {
  //   if (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.shortestSide < 600) {
  //     deviceType = DeviceType.mobile;
  //   } else {
  //     deviceType = DeviceType.tablet;
  //   }
  //   update();
  // }

  bool isOlderVersion(String current, String latest) {
    final currentParts = current.split('.').map(int.parse).toList();
    final latestParts = latest.split('.').map(int.parse).toList();
    for (int i = 0; i < latestParts.length; i++) {
      if (i >= currentParts.length || currentParts[i] < latestParts[i])
        return true;
      if (currentParts[i] > latestParts[i]) return false;
    }
    return false;
  }

  void showUpdateDialog(BuildContext context, bool forceUpdate) {
    showDialog(
      barrierDismissible: !forceUpdate,
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Cập nhật cần thiết'),
        content:
            Text('Có phiên bản mới. Vui lòng cập nhật để tiếp tục sử dụng.'),
        actions: [
          if (!forceUpdate)
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Bỏ qua'),
            ),
          TextButton(
            onPressed: () {
              // mở link đến store

              if (Platform.isAndroid) {
                launchUrl(
                  Uri.parse(
                      'https://play.google.com/store/apps/details?id=knk.office.KingSoftOfficeMobile.shortcuts'),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                launchUrl(
                  Uri.parse(
                      'https://apps.apple.com/cz/app/s%C3%A0n-giao-d%E1%BB%8Bch-b%C4%91s-ra-kh%C6%A1i-vn/id6475702859'),
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            child: Text('Cập nhật'),
          ),
        ],
      ),
    );
  }

  // void onGetInformationSystem() async {
  //   await provider.get(
  //     endPoint: APIEndPoint.getInformation,
  //     onSuccess: (data) async {
  //       if (!RkValidate.nullOrEmpty(data) &&
  //           !RkValidate.nullOrEmpty(data['version_app'])) {
  //         versionApp = VersionApp.fromJson(
  //             data['version_app_agent'] as Map<String, dynamic>);
  //         versionAndroid = versionApp!.appAndroid;
  //         versionIos = versionApp!.appIos;
  //         PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //         String appName = packageInfo.appName;
  //         String packageName = packageInfo.packageName;
  //         String version = packageInfo.version;
  //         String buildNumber = packageInfo.buildNumber;
  //         print(
  //             "object ${appName} - ${packageName} - ${version} - ${buildNumber}");
  //         if (Platform.isAndroid) {
  //           currentVersion = "${version}.${buildNumber}";
  //         } else {
  //           currentVersion = "${version}.${buildNumber}";
  //         }
  //         if (Platform.isAndroid) {
  //           if (isOlderVersion(currentVersion!, versionAndroid!)) {
  //             showUpdateDialog(Get.context!, true);
  //           } else {
  //             checkGuard();
  //           }
  //         } else {
  //           if (isOlderVersion(currentVersion!, versionIos!)) {
  //             showUpdateDialog(Get.context!, true);
  //           } else {
  //             checkGuard();
  //           }
  //         }
  //       }
  //       update();
  //     },
  //     onError: (onError) {
  //       checkGuard();
  //     },
  //   );
  // }

  // void addPoint(LatLng point) {
  //   points.add(point);
  //   polylines.add(Polyline(
  //     polylineId: PolylineId('polyline_${polylines.length}'),
  //     points: points,
  //     color: Colors.blue,
  //     width: 5,
  //   ));
  //   print("polyline_${polylines.length}");
  //   polygons.add(Polygon(
  //     polygonId: PolygonId('polygon_${polygons.length}'),
  //     points: points,
  //     fillColor: Colors.green.withOpacity(0.5),
  //     strokeColor: Colors.green,
  //     strokeWidth: 2,
  //   ));

  //   circles.add(Circle(
  //     circleId: CircleId('circle_${circles.length}'),
  //     center: point,
  //     radius: 100,
  //     fillColor: Colors.red.withOpacity(0.5),
  //     strokeColor: Colors.red,
  //     strokeWidth: 2,
  //   ));
  //   update();
  // }

  // void clearDrawings() {
  //   points.clear();
  //   polylines.clear();
  //   polygons.clear();
  //   circles.clear();
  //   update();
  // }

  // void addMaker(LatLng latLng) {
  //   markers.add(
  //       Marker(markerId: MarkerId('1'), icon: customIcon!, position: latLng));
  //   // mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 13)));
  //   update();
  // }

  Future<LocationData> requestCurrentLocation() async {
    final location = Location();
    final status = await Permission.location.request();
    if (!status.isGranted) {
      return location.getLocation();
    }
    var _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      return await location.getLocation();
    } else {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return location.getLocation();
      }
      return await location.getLocation();
    }
  }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

  // void onLogOut() {
  //   provider.post(
  //     endPoint: APIEndPoint.signOutMember,
  //     bodyIsFormData: true,
  //     data: deleteMemberRequest.toJson(),
  //     onSuccess: (data) {
  //       sl<SharedPreferenceHelper>().setJwtToken("");
  //       // Get.offNamed(AuthRoutes.LOGIN);
  //       update();
  //     },
  //     onError: (onError) {
  //       // Get.offNamed(AuthRoutes.LOGIN);
  //     },
  //   );

  //   update();
  // }

  void checkGuard() {
    // For F1 API version, skip authentication and go straight to RootView
    Get.offNamedUntil(RootViewRoutes.ROOT_VIEW, (route) => route.isFirst);
    // if (access_token == "") {
    //   // onLogOut();
    //   // Get.offNamedUntil(AuthRoutes.LOGIN, (route) => route.isFirst);
    //   // Get.offNamed(AuthRoutes.LOGIN);
    //   Get.offNamedUntil(RootViewRoutes.ROOT_VIEW, (route) => route.isFirst);
    // } else {
    //   // onLogOut();
    //   // Get.offNamedUntil(AuthRoutes.LOGIN, (route) => route.isFirst);
    //   // Get.offNamed(AuthRoutes.LOGIN);
    //   Get.offNamedUntil(RootViewRoutes.ROOT_VIEW, (route) => route.isFirst);
    // }
  }
}
