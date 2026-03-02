// import 'dart:convert';
// import 'dart:developer' as logg;
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:get_it/get_it.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:template/helper/rk_validate.dart';
// import 'package:template/sharedpref/shared_preference_helper.dart';
// import 'package:template/utils/app_constants.dart' as app_constants;

// import '../routes/route_path/notifications_routes.dart';

// class MyNotification {
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
//   int? notificationId;
//   String? realEstateId;
//   String? type;
//   String? eventId;
//   MyNotification() {
//     initialize();
//   }

//   void goToDetailNotification(String type) {
//     if (type == "system" || type == "orther") {
//       Get.toNamed(
//         NotificationsRoutes.NOTIFICATION_DETAIL,
//         arguments: {'id': notificationId},
//       );
//     }
//   }

//   Future<void> initialize() async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     bool isPermissionPassed = false;

//     if (Platform.isIOS) {
//       final NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
//       isPermissionPassed = settings.authorizationStatus == AuthorizationStatus.authorized;
//     } else {
//       // for android, no need permission
//       isPermissionPassed = true;
//     }

//     if (isPermissionPassed) {
//       print('permission passed');
//       const androidInitialize = AndroidInitializationSettings("@mipmap/ic_launcher");
//       const iOSInitialize = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//       );
//       const initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

//       flutterLocalNotificationsPlugin?.initialize(
//         initializationsSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse response) async {
//           if (response.payload != null && response.payload!.isNotEmpty) {
//             final Map<String, dynamic> data = jsonDecode(response.payload!) as Map<String, dynamic>;
//             goToDetailNotification(type!);
//             logg.log('PAYLOAD DATA $data');
//           }
//         },
//         //     onSelectNotification: (String? payload) async {
//         //   try {
//         //     if (payload != null && payload.isNotEmpty) {
//         //       // if (!RkValidate.nullOrEmpty(payload)) {
//         //       // newsId = RkValidate.parseStringFromJson(message.data['news_id']);
//         //       // assetStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//         //       // assetId = RkValidate.parseStringFromJson(message.data['asset_status']);
//         //       // auctionId = RkValidate.parseStringFromJson(message.data['asset_status']);
//         //       // isClient = RkValidate.parseIntFromJson(message.data['asset_status']);
//         //       // publicStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//         //       // approveStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//         //       // reviewStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//         //       // type = RkValidate.parseIntFromJson(message.data['type']);
//         //       goToDetailNotification(type!);
//         //       // }
//         //       // handle event go to screen when click notification
//         //       // MyApp.navigatorKey.currentState.push(
//         //       //     MaterialPageRoute(builder: (context) => OrderDetailsScreen(orderModel: null, orderId: int.parse(payload))));
//         //     }
//         //   } catch (e) {
//         //     print(e);
//         //   }
//         //   return;
//         // }
//       );

//       FirebaseMessaging.instance.getToken().then((String? token) {
//         print('firebase token: $token');
//         if (token != null) {
//           GetIt.instance.get<SharedPreferenceHelper>().setFirebaseNotificationToken(token);
//         }
//       });
//       // if (Platform.isIOS == true) {
//       //   FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
//       // }

//       FirebaseMessaging.instance.getInitialMessage().then((message) {
//         // case app background
//         if (message != null) {
//           WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//             Future.delayed(Duration(seconds: 3), () {
//               if (!RkValidate.nullOrEmpty(message!.data)) {
//                 realEstateId = RkValidate.parseStringFromJson(message.data['real_estate_id']);
//                 notificationId = RkValidate.parseIntFromJson(message.data['id']);
//                 type = RkValidate.parseStringFromJson(message.data['type']);
//                 goToDetailNotification(type!);
//               }
//             });
//           });
//           // showNotification({
//           //   'title': message!.notification?.title ?? 'Notification',
//           //   'body': message!.notification?.body ?? 'Notification',
//           // });
//         }
//       });

//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         // Case app in foreground
//         print('onMessage: ${message.data}');
//         if (!RkValidate.nullOrEmpty(message.data)) {
//           realEstateId = RkValidate.parseStringFromJson(message.data['real_estate_id']);
//           notificationId = RkValidate.parseIntFromJson(message.data['id']);
//           type = RkValidate.parseStringFromJson(message.data['type']);
//           // goToDetailNotification(type!);
//         }

//         showNotification({
//           'title': message.notification?.title ?? 'Notification',
//           'body': message.notification?.body ?? 'Notification',
//         });
//       });

//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         // Case app is killed
//         if (!RkValidate.nullOrEmpty(message.data)) {
//           realEstateId = RkValidate.parseStringFromJson(message.data['real_estate_id']);
//           notificationId = RkValidate.parseIntFromJson(message.data['id']);
//           type = RkValidate.parseStringFromJson(message.data['type']);
//           goToDetailNotification(type!);
//         }

//         // showNotification({
//         //   'title': message.notification?.title ?? 'Notification',
//         //   'body': message.notification?.body ?? 'Notification',
//         // });
//         print('onMes sageApp: $message');
//       });

//       // Case app in background
//       if (Platform.isIOS == true) {
//         FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
//       }
//     }
//   }

//   Future<void> showNotification(Map<String, dynamic> message) async {
//     if (message['image'] != null && (message['image'].toString().isNotEmpty)) {
//       try {
//         await showBigPictureNotificationHiddenLargeIcon(message);
//       } catch (e) {
//         await showBigTextNotification(message);
//       }
//     } else {
//       await showBigTextNotification(message);
//     }
//   }

//   Future<void> showTextNotification(Map<String, dynamic> message) async {
//     final String _title = message['title'].toString();
//     final String _body = message['body'].toString();
//     final String _orderID = message['order_id'].toString();

//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       sound: RawResourceAndroidNotificationSound('notification'),
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin?.show(0, _title, _body, platformChannelSpecifics, payload: "1");
//   }

//   Future<void> showBigTextNotification(Map<String, dynamic> message) async {
//     final String _title = message['title'].toString();
//     final String _body = message['body'].toString();
//     final String _orderID = message['order_id'].toString();

//     final BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//       _body,
//       htmlFormatBigText: true,
//       contentTitle: _title,
//       htmlFormatContentTitle: true,
//     );
//     final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'big text channel id',
//       'big text channel name',
//       importance: Importance.max,
//       styleInformation: bigTextStyleInformation,
//       priority: Priority.high,
//     );
//     final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin?.show(0, _title, _body, platformChannelSpecifics, payload: "1");
//   }

//   Future<void> showBigPictureNotificationHiddenLargeIcon(Map<String, dynamic> message) async {
//     final String _title = message['title'].toString();
//     final String _body = message['body'].toString();
//     final String _orderID = message['order_id'].toString();
//     final String _image = message['image'].toString().startsWith('http') ? message['image'].toString() : '${app_constants.BASE_URL}/storage/app/public/notification/${message['image']}';

//     final String largeIconPath = await _downloadAndSaveFile(_image, 'largeIcon');
//     final String bigPicturePath = await _downloadAndSaveFile(_image, 'bigPicture');

//     final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
//       FilePathAndroidBitmap(bigPicturePath),
//       hideExpandedLargeIcon: true,
//       contentTitle: _title,
//       htmlFormatContentTitle: true,
//       summaryText: _body,
//       htmlFormatSummaryText: true,
//     );
//     final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'big text channel id',
//       'big text channel name',
//       largeIcon: FilePathAndroidBitmap(largeIconPath),
//       priority: Priority.high,
//       sound: const RawResourceAndroidNotificationSound('notification'),
//       styleInformation: bigPictureStyleInformation,
//       importance: Importance.max,
//     );
//     final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin?.show(0, _title, _body, platformChannelSpecifics, payload: _orderID);
//   }

//   Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//     await Firebase.initializeApp();

//     // if (!RkValidate.nullOrEmpty(message.data)) {
//     //   print('background: $message');
//     //   newsId = RkValidate.parseStringFromJson(message.data['news_id']);
//     //   assetStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//     //   assetId = RkValidate.parseStringFromJson(message.data['asset_status']);
//     //   auctionId = RkValidate.parseStringFromJson(message.data['asset_status']);
//     //   isClient = RkValidate.parseIntFromJson(message.data['asset_status']);
//     //   publicStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//     //   approveStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//     //   reviewStatus = RkValidate.parseIntFromJson(message.data['asset_status']);
//     //   type = RkValidate.parseIntFromJson(message.data['type']);
//     //   goToDetailNotification(type!);
//     // }
//     // if (RkNumber.parseInt(message.data['logout_status']) == 1) {
//     //   final String accessToken = sl.get<SharedPreferenceHelper>().getJwtToken;
//     //   if (accessToken != '') {
//     //     sl<SharedPreferenceHelper>().setJwtToken("");
//     //     // Get.put(LoginController());
//     //     Get.create(() => LoginController());
//     //     Get.offAllNamed(AuthRoutes.LOGIN);
//     //     // Navigator.popUntil(Get.context!, ModalRoute.withName('/login'));
//     //   }
//     // }
//     // showNotification({
//     //   'title': message.notification?.title ?? 'Notification',
//     //   'body': message.notification?.body ?? 'Notification',
//     // });
//   }

//   Future<String> _downloadAndSaveFile(String url, String fileName) async {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/$fileName';
//     final Response response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
//     final File file = File(filePath);
//     await file.writeAsBytes(response.data as List<int>);
//     return filePath;
//   }
// }
