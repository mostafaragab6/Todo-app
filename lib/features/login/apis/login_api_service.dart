import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/login/apis/api_constant.dart';
import 'package:todo_app/features/login/data/models/login_response.dart';

import '../data/models/login_request.dart';
part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(ApiConstant.loginUrl)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequest,
  );
}
