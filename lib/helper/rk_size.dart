import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RkSize {
  // constructor
  RkSize() {
    init();
  }

  /// Device's Orientation
  static late Orientation orientation;

  static Size _size = const Size(0, 0);
  static Size _sizeIncludeTop = const Size(0, 0);
  static Size _sizeIncludeBottom = const Size(0, 0);
  static Size _sizeIncludeTopBottom = const Size(0, 0);

  // static final SharedPreferences _sharedPreference;
  static Future<SharedPreferences> get _sharedPreference async => _prefsInstance ??= await SharedPreferences.getInstance();

  // shared pref instance
  static SharedPreferences? _prefsInstance;

  // call this method from init()
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _sharedPreference;
    _size = Size(_prefsInstance!.getDouble('maxWidth') ?? 0, _prefsInstance!.getDouble('maxHeight') ?? 0);
    print('alo');
    print('${_size.width} - ${_size.height}');
    _sizeIncludeTop = Size(_prefsInstance!.getDouble('maxWidthIncludeTop') ?? 0, _prefsInstance!.getDouble('maxHeightIncludeTop') ?? 0);
    _sizeIncludeBottom = Size(_prefsInstance!.getDouble('maxWidthIncludeBottom') ?? 0, _prefsInstance!.getDouble('maxHeightIncludeBottom') ?? 0);
    _sizeIncludeTopBottom = Size(_prefsInstance!.getDouble('maxWidthIncludeTopBottom') ?? 0, _prefsInstance!.getDouble('maxHeightIncludeTopBottom') ?? 0);
    return _prefsInstance!;
  }

  static Size get size {
    return _size;
  }

  static Size get sizeIncludeTop {
    return _sizeIncludeTop;
  }

  static Size get sizeIncludeBottom {
    return _sizeIncludeBottom;
  }

  static Size get sizeIncludeTopBottom {
    return _sizeIncludeTopBottom;
  }

  static void update({
    required double width,
    required double height,
    required Orientation currentOrientation,
  }) {
    orientation = currentOrientation;
    _prefsInstance!.setDouble('maxWidth', width);
    _prefsInstance!.setDouble('maxHeight', height);
    _size = Size(width, height);
  }

  static void updateMaxSizeIncludeTop({required double width, required double height}) {
    _prefsInstance!.setDouble('maxWidthIncludeTop', width);
    _prefsInstance!.setDouble('maxHeightIncludeTop', height);
    _sizeIncludeTop = Size(width, height);
  }

  static void updateMaxSizeIncludeBottom({required double width, required double height}) {
    _prefsInstance!.setDouble('maxWidthIncludeBottom', width);
    _prefsInstance!.setDouble('maxHeightIncludeBottom', height);
    _sizeIncludeBottom = Size(width, height);
  }

  static void updateMaxSizeIncludeTopBottom({required double width, required double height}) {
    _prefsInstance!.setDouble('maxWidthIncludeTopBottom', width);
    _prefsInstance!.setDouble('maxHeightIncludeTopBottom', height);
    _sizeIncludeTopBottom = Size(width, height);
  }

  static bool isScreen4_3({double? width, double? height}) {
    double _width = width ?? _size.width;
    double _height = height ?? _size.height;
    // Default screen portrait
    if (_width > _height) {
      // Screen landscape
      final double _temp = _height;
      _height = _width;
      _width = _temp;
    }
    final ratio = _height / _width;
    if (((4 / 3) - ratio).abs() < 0.1) {
      // print('Screen is 4/3');
      return true;
    }
    // print('Screen is not 4/3');
    return false;
  }

  /*
  * DO NOT OVERIDE PARAM size
  * */
  static double getFontSize({double? width, double? height, double size = 1000}) {
    double _width = width ?? _size.width;
    double _height = height ?? _size.height;

    print('getFontSize _width $_width');
    print('getFontSize _height $_height');
    // Default screen portrait
    if (_width > _height) {
      // Screen landscape
      final double _temp = _height;
      _height = _width;
      _width = _temp;
    }
    // print('getFontSize width $width height $height size $size');
    final ratio = _height / _width;

    if (ratio >= 1.9) {
      // print('getFontSize ratio $ratio ratio >= 1.9');
      return (_width * 1.675) / size;
    } else if (ratio >= 1.7) {
      // print('getFontSize ratio $ratio ratio >= 1.7');
      return _height / size;
    } else if (ratio > 1.575) {
      // print('getFontSize ratio $ratio ratio >= 1.575');
      return (_width * 1.575) / size;
    } else {
      return _width / size;
    }
  }

  // table
  static RkDevice get device {
    final sizeDevice = sqrt((size.width * size.width) + (size.height * size.height));
    if (sizeDevice > 1100) {
      return RkDevice.TABLE;
    }
    return RkDevice.IPHONE;
  }
}

enum RkDevice {
  TABLE,
  IPHONE,
}
