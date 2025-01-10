import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/home/data/models/model.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = Loading;
  const factory HomeState.success(List<Data?>? data) = Success;
  const factory HomeState.error() = Error;

  const factory HomeState.specificTaskLoading() = SpecificTaskLoading;
  const factory HomeState.specificTaskSuccess(Data? specificTask) =
      SpecificTaskSuccess;
  const factory HomeState.specificTaskError(String error) = SpecificTaskError;

  const factory HomeState.logoutSuccess(String? message) = LogoutSuccess;
  const factory HomeState.logoutError(String? message) = LogoutError;

  const factory HomeState.deleteTaskSuccess(String? message) =
      DeleteTaskSuccess;
  const factory HomeState.deleteTaskError(String? message) = DeleteTaskError;
}
