import 'package:bloc_clean_code_project/config/data/network/network_api_services.dart';
import 'package:bloc_clean_code_project/models/user/user_model.dart';

import '../../config/app_urls.dart';

class LoginRepository {

  final _api = NetworkApiServices();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrls.loginApi, data);
    return UserModel.fromJson(response);
  }

}