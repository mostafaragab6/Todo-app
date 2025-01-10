import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/home/data/models/model.dart';

part 'edit_task_state.freezed.dart';

@Freezed()
class EditTaskState<T> with _$EditTaskState<T> {
  const factory EditTaskState.initial() = _Initial;

  const factory EditTaskState.loading() = Loading;
  const factory EditTaskState.success(Data data) = Success;
  const factory EditTaskState.error(String error) = Error;

  const factory EditTaskState.uploadImageLoading() = UploadImageLoading;

  const factory EditTaskState.uploadImageSuccess() = UploadImageSuccess;
  const factory EditTaskState.uploadImageError(String error) = UploadImageError;
}
