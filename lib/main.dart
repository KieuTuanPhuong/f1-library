import 'dart:developer';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
// import 'package:sizer/sizer.dart';
import 'package:template/app_binding.dart';
import 'package:template/localization/translation_helper.dart';
import 'package:template/routes/app_pages.dart';
import 'package:template/routes/route_path/home_routes.dart';
import 'package:template/routes/route_path/splash_routes.dart';
import 'package:template/theme/app_theme.dart';
import 'package:template/view/splash/splash_view_page.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'di_container.dart' as di;

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  //
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyCTUwNtG5Wn8mbEhHyYa8wAiQ8KJN4m6Hs',
      appId: '1:555029426942:android:5c64cde32a05957464abaf',
      messagingSenderId: '555029426942',
      projectId: 'rakhoi-2023',
      storageBucket: 'rakhoi-2023.firebasestorage.app',
    ));
  } else {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyDlF4aoisTtTn-C-O0W-ATLC6YMNqCp0Z8',
      appId: '1:555029426942:android:ac55bd1642ff9f4264abaf',
      messagingSenderId: '555029426942',
      projectId: 'rakhoi-2023',
      storageBucket: 'rakhoi-2023.appspot.com',
    ));
  }

  HttpOverrides.global = new MyHttpOverrides();
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  timeago.setLocaleMessages('vi', timeago.ViMessages());

  await di.init();
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = true;
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // if (SizerUtil.deviceType == DeviceType.mobile) {
  //   SystemChrome.setPreferredOrientations(
  //     [
  //       // DeviceOrientation.portraitUp,
  //       // DeviceOrientation.portraitDown,
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ],
  //   ).then((_) {
  //     runApp(const MyApp());
  //   });
  // } else {
  //   SystemChrome.setPreferredOrientations(
  //     [
  //       DeviceOrientation.portraitUp,
  //       DeviceOrientation.portraitDown,
  //       DeviceOrientation.landscapeLeft,
  //       DeviceOrientation.landscapeRight,
  //     ],
  //   ).then((_) {
  //     runApp(const MyApp());
  //   });
  // }
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // PaintingBinding.instance.imageCache.maximumSize = 20; // Số lượng tối đa các ảnh trong bộ nhớ cache
    // PaintingBinding.instance.imageCache.maximumSizeBytes = 20 * 1024 * 1024;
    super.initState();

    // initDeepLinkListener();
  }

  void initDeepLinkListener() async {
    try {
      AppLinks _appLinks = AppLinks();
      _appLinks.uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          handleDeepLink(uri);
        }
      });
    } catch (e) {
      print('Failed to get initial link: $e');
    }
  }

  void handleDeepLink(Uri uri) {
    print('Received deep link: ${uri.toString()}');
    Future.delayed(const Duration(seconds: 2)).then((value) {
      log("${uri.fragment}");
      Get.toNamed(RootViewRoutes.ROOT_VIEW);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String languageKey = TranslationHelper.getLocaleCode();

    // return ResponsiveSizer(builder: (context, orientation, deviceType) {
    // return OrientationBuilder(builder: (context, orientation) {
    return GetMaterialApp(
      // GetMaterialApp.router(
      // initialRoute: '/',
      // routes: {
      //   '/': (_) => GridWithScrollControllerExample(),
      // },
      initialRoute: SplashRoutes.SPLASH,

      // routeInformationParser: GetInformationParser(
      //   initialRoute: SplashRoutes.SPLASH,
      // ),
      //
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.Page,
      //   notFoundRoute: GetPage(name: '/notfound', page: () => SplashPage()),
      // ),
      routes: {
        "/": (context) => SplashPage(),
      },
      unknownRoute: GetPage(name: '/notfound', page: () => SplashPage()),
      localizationsDelegates: const [
        RefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('vi'),
        Locale('en'),
      ],
      initialBinding: AppBinding(),
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      builder: EasyLoading.init(),
      translations: TranslationHelper(),
      locale: Locale(languageKey),
    );
    // });
    // });
  }
}
