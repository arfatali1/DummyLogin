import 'package:dio/dio.dart';
import 'package:dummylogin/Api_Client/Api_End_points.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://devmobeen-001-site1.itempurl.com/api/TibaApp/')
abstract class ApiClient {
  factory ApiClient(Dio dio,
      {String baseUrl}) = _ApiClient;

  @POST(ApiEndPoints.SIGNUP)
  Future<String> register(@Body()Map<String,dynamic>registerModel);
  @POST(ApiEndPoints.LOGIN)
  Future<String> login(@Body()Map<String,dynamic>loginModel);

}
