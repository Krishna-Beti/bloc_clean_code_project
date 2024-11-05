import 'dart:async';

import 'package:bloc_clean_code_project/config/routes/routes_name.dart';
import 'package:bloc_clean_code_project/services/session_manager/session_controller.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    SessionController().getUserFromPreferences().then((value) {

      if(SessionController().isLogin ?? false) {
        Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen, (route) => false,));
      }
      else {
        Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false,));
      }

    },).onError((error, stackTrace) {
      Timer(const Duration(seconds: 2), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false,));
    },);
  }

}