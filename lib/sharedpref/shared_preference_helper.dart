import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/auth/auth_request.dart';
import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Login: ----------------------------------------------------------
  bool get getLogin {
    return _sharedPreference.getBool(Preferences.isLogin) ?? false;
  }

  void setLogin({required bool status}) {
    _sharedPreference.setBool(Preferences.isLogin, status);
  }

  // splash: ----------------------------------------------------------
  bool get getSplash {
    return _sharedPreference.getBool(Preferences.isSplash) ?? false;
  }

  void setSplash({required bool status}) {
    _sharedPreference.setBool(Preferences.isSplash, status);
  }

  // General Methods: Access token
  String get getJwtToken {
    return _sharedPreference.getString(Preferences.jwtToken) ?? '';
  }

  Future<void> setJwtToken(String authToken) async {
    await _sharedPreference.setString(Preferences.jwtToken, authToken) ?? '';
  }

  // member code
  String get getMemberCode {
    return _sharedPreference.getString(Preferences.memberCode) ?? '';
  }

  Future<void> setMemberCode(String memberCode) async {
    await _sharedPreference.setString(Preferences.memberCode, memberCode) ?? '';
  }

  // member id
  String get getMemberId {
    return _sharedPreference.getString(Preferences.memberId) ?? '';
  }

  Future<void> setMemberId(String memberId) async {
    await _sharedPreference.setString(Preferences.memberId, memberId) ?? '';
  }

  /// approve status
  String get getApproveMemberStatus {
    return _sharedPreference.getString(Preferences.approveStatus) ?? '';
  }

  Future<void> setApproveMemberStatus(String approveStatus) async {
    await _sharedPreference.setString(Preferences.approveStatus, approveStatus) ?? '';
  }

  // fcm token
  String get getFcmToken {
    return _sharedPreference.getString(Preferences.fcmToken) ?? '';
  }

  void setFcmToken(String fcmToken) {
    _sharedPreference.setString(Preferences.fcmToken, fcmToken);
  }

  // Language:---------------------------------------------------
  String get getLanguage {
    print(_sharedPreference.getString(Preferences.currentLanguage));
    return _sharedPreference.getString(Preferences.currentLanguage) ?? 'vi';
  }

  void setLanguage(String language) {
    print('set language $language');
    _sharedPreference.setString(Preferences.currentLanguage, language);
  }

  // profile
  String get getProfile {
    return _sharedPreference.getString(Preferences.profile) ?? '{}';
  }

  void setProfile(String remember) {
    _sharedPreference.setString(Preferences.profile, remember);
  }

  // cookies
  String get getCookies {
    return _sharedPreference.getString(Preferences.cookies) ?? '{}';
  }

  void setCookies(String cookies) {
    _sharedPreference.setString(Preferences.cookies, cookies);
  }

  // Password
  String get getPwd {
    return _sharedPreference.getString(Preferences.pwd) ?? '{}';
  }

  void setPwd(String pwd) {
    _sharedPreference.setString(Preferences.pwd, pwd);
  }

  // username
  String get getUserName {
    return _sharedPreference.getString(Preferences.usr) ?? '';
  }

  void setUserName(String userName) {
    _sharedPreference.setString(Preferences.usr, userName);
  }

  // userId
  String? get getUserId {
    return _sharedPreference.getString(Preferences.userId);
  }

  void setUserId(String userId) {
    _sharedPreference.setString(Preferences.userId, userId);
  }

  // firebase notification token
  String get firebaseNotificationToken {
    return _sharedPreference.getString(Preferences.firebaseNotification) ?? '';
  }

  void setFirebaseNotificationToken(String token) {
    _sharedPreference.setString(Preferences.firebaseNotification, token);
  }

  // system design
  String get getPhoneSystem {
    return _sharedPreference.getString(Preferences.phoneSystem) ?? '';
  }

  Future<void> setPhoneSystem(String phoneSystem) async {
    await _sharedPreference.setString(Preferences.phoneSystem, phoneSystem) ?? '';
  }

  /// hotline2
  String get getHotline2System {
    return _sharedPreference.getString(Preferences.hotline2System) ?? '';
  }

  Future<void> setHotline2System(String hotline2System) async {
    await _sharedPreference.setString(Preferences.hotline2System, hotline2System) ?? '';
  }

  String get getEmailSystem {
    return _sharedPreference.getString(Preferences.emailSystem) ?? '';
  }

  Future<void> setEmailSystem(String emailSystem) async {
    await _sharedPreference.setString(Preferences.emailSystem, emailSystem) ?? '';
  }

  // list recently view
  List<String>? get getProductIdHistoryList {
    final String listString = _sharedPreference.getString(Preferences.recentlyList) ?? '';
    if (listString.isEmpty) {
      return [];
    }
    final List<String> list = listString.split(",");
    return list;
  }

  void setProductIdHistoryList(List<String> list) {
    final String encodedData = list.reduce((value, element) => value == '' ? element : "$value,$element");
    _sharedPreference.setString(Preferences.recentlyList, encodedData);
  }

  void saveRecentlyId(String id) {
    final List<String> list = getProductIdHistoryList ?? [];
    if (!list.contains(id)) {
      list.add(id);
    }

    setProductIdHistoryList(list);
    _sharedPreference.reload();
  }

  List<AuthRequest>? get getAccountSaveList {
    final String account = _sharedPreference.getString(Preferences.accountSaveList) ?? '';
    if (account.isEmpty) {
      return [];
    }
    final result = (json.decode(account) as List).map((e) => AuthRequest.fromJson(e as Map<String, dynamic>)).toList();
    print(result);
    return result;
  }

  Future<void> saveAccount(AuthRequest request) async {
    final List<AuthRequest> list = await getAccountSaveList ?? [];
    for (var item in list) {
      if (item.email == request.email) {
        list.remove(item);
        //isValue = true;
        break;
      }
    }
    list.add(request);
    final listString = jsonEncode(list);
    _sharedPreference.setString(Preferences.accountSaveList, listString);
  }

  Future<AuthRequest?> isExistedAccount(String val) async {
    final List<AuthRequest> list = await getAccountSaveList ?? [];
    AuthRequest? auth;
    for (var item in list) {
      if (item.email == val) {
        auth = item;
        break;
      }
    }
    return auth;
  }
}
