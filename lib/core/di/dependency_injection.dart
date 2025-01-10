import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/core/networking/dio_factory.dart';
import 'package:todo_app/features/create_task/apis/create_task_api_service.dart';
import 'package:todo_app/features/create_task/data/repos/create_task_repo.dart';
import 'package:todo_app/features/edit_task/apis/edit_task_api_service.dart';
import 'package:todo_app/features/edit_task/data/repos/edit_task_repo.dart';
import 'package:todo_app/features/home/apis/home_api_service.dart';
import 'package:todo_app/features/home/data/repos/delete_task_repo.dart';

import 'package:todo_app/features/login/apis/login_api_service.dart';
import 'package:todo_app/features/login/data/repos/login_repo.dart';
import 'package:todo_app/features/profile/apis/profile_api_service.dart';
import 'package:todo_app/features/profile/data/repos/profile_repo.dart';
import 'package:todo_app/features/signup/apis/signup_api_service.dart';
import 'package:todo_app/features/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  //login
  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //signup
  getIt.registerLazySingleton<SignupApiService>(() => SignupApiService(dio));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  //home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<DeleteTaskRepo>(() => DeleteTaskRepo(getIt()));

  //create task
  getIt.registerLazySingleton<CreateTaskApiService>(
      () => CreateTaskApiService(dio));
  getIt.registerLazySingleton<CreateTaskRepo>(() => CreateTaskRepo(getIt()));

  //profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));

  //edit task
  getIt
      .registerLazySingleton<EditTaskApiService>(() => EditTaskApiService(dio));
  getIt.registerLazySingleton<EditTaskRepo>(() => EditTaskRepo(getIt()));
}
