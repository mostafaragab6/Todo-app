import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/create_task/apis/create_task_api_service.dart';
import 'package:todo_app/features/create_task/data/models/create_task_request.dart';

class CreateTaskRepo {
  final CreateTaskApiService _createTaskApiService;
  CreateTaskRepo(this._createTaskApiService);

  Future<ApiResult<String>> createTask(
    CreateTaskRequest createTaskRequest,
  ) async {
    try {
      final response =
          await _createTaskApiService.createTask(createTaskRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
