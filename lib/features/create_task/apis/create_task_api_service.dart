import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/create_task/apis/create_task_api_constant.dart';

import '../data/models/create_task_request.dart';
part 'create_task_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CreateTaskApiService {
  factory CreateTaskApiService(Dio dio) = _CreateTaskApiService;

  @POST(CreateTaskApiConstant.createTaskUrl)
  Future<String> createTask(
    @Body() CreateTaskRequest createTaskRequest,
  );
}
