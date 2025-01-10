import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/login/apis/login_api_service.dart';
import 'package:todo_app/features/login/data/models/login_request.dart';
import 'package:todo_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final LoginApiService _loginApiService;
  LoginRepo(this._loginApiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      final response = await _loginApiService.login(
        loginRequest,
      );
      return ApiResult.success(
        response,
      );
    } catch (error) {
      return ApiResult.failure(
        error.toString(),
      );
    }
  }
}
