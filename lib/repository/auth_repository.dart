import 'package:mvvmpractice/data/network/based_api_services.dart';
import 'package:mvvmpractice/data/network/network_api_services.dart';
import 'package:mvvmpractice/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

    Future<dynamic> registrationApi(dynamic data) async {
      try {
        dynamic response = await _apiServices.getPostApiResponse(
            AppUrl.registerEndPoint, data);
        return response;
      } catch (e) {
        throw e;
      }

  }
}