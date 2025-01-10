import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/edit_task/apis/edit_task_api_service.dart';
import 'package:todo_app/features/edit_task/data/models/edit_task_request.dart';
import 'package:todo_app/features/home/data/models/model.dart';

class EditTaskRepo {
  final EditTaskApiService _editTaskApiService;
  EditTaskRepo(this._editTaskApiService);

  Future<ApiResult<Data>> editTask(
    String taskId,
    EditTaskRequest editTaskRequest,
  ) async {
    try {
      final response = await _editTaskApiService.editTask(
        taskId,
        editTaskRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
