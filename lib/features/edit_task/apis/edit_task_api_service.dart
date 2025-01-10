import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/networking/api_constants.dart';
import 'package:todo_app/features/edit_task/apis/edit_task_api_constants.dart';
import 'package:todo_app/features/home/data/models/model.dart';

import '../data/models/edit_task_request.dart';
part 'edit_task_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EditTaskApiService {
  factory EditTaskApiService(Dio dio) = _EditTaskApiService;

  @PUT(EditTaskApiConstants.editTaskUrl)
  Future<Data> editTask(
    @Path("taskId") String taskId,
    @Body() EditTaskRequest editTaskRequest,
  );
}
