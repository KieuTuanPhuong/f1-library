import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/helper/rk_alert.dart';

class RkNetwork {
  final Connectivity connectivity;
  RkNetwork(this.connectivity);

  Future<bool> get isConnected async {
    // final ConnectivityResult _result = await connectivity.checkConnectivity();
    // return _result != ConnectivityResult.none;
    final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }

  static void checkConnectivity(BuildContext context) {
    bool _firstTime = true;
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
    //   if (!_firstTime) {
    //     //bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
    //     bool isNotConnected;
    //     if (result == ConnectivityResult.none) {
    //       isNotConnected = true;
    //     } else {
    //       isNotConnected = !await _updateConnectivityStatus();
    //     }
    //     RkAlert.error(message: isNotConnected ? 'no_connection'.tr : 'no_connection'.tr);
    //   }
    //   _firstTime = false;
    // });
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) async {
      if (!_firstTime) {
        bool hasInternet = false;

        // kiểm tra nếu có ít nhất 1 kết nối (wifi/mobile)
        if (results.isNotEmpty && results.first != ConnectivityResult.none) {
          hasInternet = await _updateConnectivityStatus();
        }

        if (!hasInternet) {
          RkAlert.error(message: 'no_connection'.tr);
        } else {
          RkAlert.success(message: 'reconnected'.tr);
        }
      }
      _firstTime = false;
    });
  }

  static Future<bool> _updateConnectivityStatus() async {
    late bool _isConnected;
    try {
      final List<InternetAddress> _result = await InternetAddress.lookup('google.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      }
    } catch (e) {
      _isConnected = false;
    }
    return _isConnected;
  }
}
