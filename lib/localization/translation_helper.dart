import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/sharedpref/shared_preference_helper.dart';

import 'en.dart';
import 'vi.dart';

class TranslationHelper extends Translations {

  static const String VN_LANGUAGE_CODE = 'vi';
  static const String ENG_LANGUAGE_CODE = 'en';

  static void changeLocale(String langCode) {
    GetIt.instance.get<SharedPreferenceHelper>().setLanguage(langCode);
    Get.updateLocale(Locale(langCode));
  }

  static String getLocaleCode() {
    return GetIt.instance.get<SharedPreferenceHelper>().getLanguage;
  }

  @override
  Map<String, Map<String, String>> get keys => {
    VN_LANGUAGE_CODE : vn,
    ENG_LANGUAGE_CODE : en,
  };
}