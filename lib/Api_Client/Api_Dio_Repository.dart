import 'package:dio/dio.dart';
import 'package:dummylogin/Api_Client/api_Client.dart';

class AppRepository {
  ApiClient? _apiRequest;
  Dio? dio;
  AppRepository() {
    dio = Dio();
    _apiRequest = ApiClient(dio!);
  }

}
