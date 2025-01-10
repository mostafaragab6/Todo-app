import 'package:todo_app/core/networking/api_result.dart';
import 'package:todo_app/features/home/apis/home_api_service.dart';

class DeleteTaskRepo {
  final HomeApiService _homeApiService;
  DeleteTaskRepo(this._homeApiService);

  Future<ApiResult<String>> deleteTask(String taskId) async {
    try {
      await _homeApiService.deleteTask(taskId);
      return ApiResult.success('Deleted Successfully');
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
