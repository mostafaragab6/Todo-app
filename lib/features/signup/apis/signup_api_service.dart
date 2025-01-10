import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/signup/apis/signup_api_constant.dart';
import 'package:todo_app/features/signup/data/models/signup_response.dart';

import '../data/models/signup_request.dart';
part 'signup_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio) = _SignupApiService;

  @POST(SignupApiConstant.signupUrl)
  Future<SignupResponse> signup(
    @Body() SignupRequest signupRequest,
  );
}
