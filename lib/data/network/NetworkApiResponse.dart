import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:major_project/data/app_exception.dart';
import 'package:major_project/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponse extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw FetchDataException('Network Request Timeout');
    }
    return responseJson;
   
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw FetchDataException('Network Request Timeout');
    }

      return responseJson;

  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
            return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      default:
        throw FetchDataException('Error while communicating with the server');

    }
  }

}