import 'package:dio/dio.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import '../helpers/constants.dart';
import '../helpers/shared_pref_helpers.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      setDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void setDioHeaders() async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}'
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static Future<void> refreshToken() async {
    print(await SharedPrefHelper.getSecuredString('refresh_token'));
    dio
        ?.get(
      '${ApiConstants.baseUrl}/auth/refresh-token?token=${await SharedPrefHelper.getSecuredString('refresh_token')}',
    )
        .then(
      (value) {
        print(value.data['access_token']);
        SharedPrefHelper.setSecuredString(
            'access_token', value.data['access_token']);
        setTokenIntoHeaderAfterLogin(value.data['access_token']);
      },
    );
  }
}
