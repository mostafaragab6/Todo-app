import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/home/apis/home_api_constants.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @DELETE(HomeApiConstants.deleteTask)
  Future<String> deleteTask(
    @Path('taskId') String taskId,
  );
}
