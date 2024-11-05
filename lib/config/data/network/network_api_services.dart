import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_code_project/config/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_code_project/config/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices{

  @override
  Future<dynamic> getApi(String url) async{

  }

  @override
  Future<dynamic> postApi(String url, data) async{
    dynamic jsonResponse;
    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    }
    on SocketException {
      throw NoInternetException();
    }
    on TimeoutException{
      throw RequestTimeoutException("Time out try again");
    }
    return jsonResponse;
  }


  dynamic returnResponse(http.Response res){
    switch(res.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(res.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(res.body);
        return jsonResponse;
      case 401:
        throw UnAuthorizedException();
      case 500:
        throw FetchDataException("Error while loading data : "+res.statusCode.toString());
    }
  }


}