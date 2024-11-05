import 'dart:convert';

import 'package:bloc_clean_code_project/models/user/user_model.dart';
import 'package:bloc_clean_code_project/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController {

  static final SessionController _session = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel userModel = UserModel();
  bool? isLogin;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue("token", jsonEncode(user));
    // Storing value to check login
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreferences() async {
    try {
      var userData = await localStorage.readValue("token");
      var isLogin = await localStorage.readValue("isLogin");

      if(userData.isNotEmpty){
        SessionController().userModel = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }

}