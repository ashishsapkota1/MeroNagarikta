import 'dart:convert';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiResponse.dart';
import '../model/nagarikta.dart';
import '../res/app_url.dart';

 class Repository{
   final BaseApiServices _apiServices = NetworkApiResponse();
   Future<Nagarikta?> uploadApi(dynamic data) async {
     try {
       dynamic response = await _apiServices.getPostApiResponse(
           AppUrl.postUrl, data);
       // dynamic decodedResponse = utf8.decode(response);
       print(response);
       return Nagarikta.fromMap(response);
     } catch (e) {
       print(e);
     }
     return null;
   }

}