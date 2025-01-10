import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/profile/apis/profile_api_service.dart';
import 'package:todo_app/features/profile/data/models/profile_response.dart';

class ProfileRepo {
  final ProfileApiService _profileApiService;
  ProfileRepo(this._profileApiService);

  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _profileApiService.getProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
