import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_task_state.freezed.dart';

@Freezed()
class CreateTaskState<T> with _$CreateTaskState<T> {
  const factory CreateTaskState.initial() = _Initial;

  const factory CreateTaskState.loading() = Loading;
  const factory CreateTaskState.success(String data) = Success;
  const factory CreateTaskState.error(String error) = Error;

  const factory CreateTaskState.uploadedImageSuccess(String data) =
      UploadedImageSuccess;
  const factory CreateTaskState.uploadedImageLoading() = UploadedImageLoading;
  const factory CreateTaskState.uploadedImageError(String data) =
      UploadedImageError;
}
