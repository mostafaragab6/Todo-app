import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/profile/apis/profile_api_constant.dart';
import 'package:todo_app/features/profile/data/models/profile_response.dart';
part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET(ProfileApiConstant.profileUrl)
  Future<ProfileResponse> getProfile();
}
