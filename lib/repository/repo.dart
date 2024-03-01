

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiResponse.dart';
import '../model/nagarikta.dart';
import '../res/app_url.dart';

class Repository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<Nagarikta?> uploadApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.postUrl, data);
      return Nagarikta.fromMap(response['data']);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
