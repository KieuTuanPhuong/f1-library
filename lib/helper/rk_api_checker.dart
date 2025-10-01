import 'package:flutter/material.dart';
import 'package:template/data/base/api_response.dart';
import 'package:template/helper/rk_alert.dart';

mixin RkApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if (apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
      // Provider.of<AuthProvider>(context,listen: false).clearSharedData();
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const AuthScreen()), (route) => false);
    } else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message.toString();
      }
      print(_errorMessage);
      RkAlert.error(message: _errorMessage);
    }
  }
}
