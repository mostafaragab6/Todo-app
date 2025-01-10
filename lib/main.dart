import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/di/dependency_injection.dart';
import 'package:todo_app/core/helpers/constants.dart';
import 'package:todo_app/core/helpers/shared_pref_helpers.dart';
import 'package:todo_app/core/routing/app_router.dart';
import 'package:todo_app/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  isOpened = await SharedPrefHelper.getBool('is_opened');

  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  runApp(TodoApp(
    appRouter: AppRouter(),
  ));
}

checkIfUserLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  if (userToken == null || userToken.isEmpty) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
}
