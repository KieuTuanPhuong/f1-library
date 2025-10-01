import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/data/datasource/remote/dio/dio_client.dart';
import 'package:template/helper/rk_network.dart';
import 'package:template/helper/rk_size.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'notification/my_notification.dart';
import 'sharedpref/shared_preference_helper.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferenceHelper>(SharedPreferenceHelper(sharedPreferences));
  sl.registerSingleton<RkSize>(RkSize());
  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerSingleton<MyNotification>(MyNotification());

  // Core
  sl.registerLazySingleton(() => RkNetwork(sl()));
  sl.registerSingleton<DioClient>(DioClient());
}
