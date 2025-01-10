import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/signup/apis/signup_api_service.dart';
import 'package:todo_app/features/signup/data/models/signup_request.dart';
import 'package:todo_app/features/signup/data/models/signup_response.dart';

class SignupRepo {
  final SignupApiService _signupApiService;

  SignupRepo(this._signupApiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequest signupRequest) async {
    try {
      final response = await _signupApiService.signup(signupRequest);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
