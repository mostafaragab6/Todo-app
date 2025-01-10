import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/dependency_injection.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/create_task/logic/create_task_cubit.dart';
import 'package:todo_app/features/create_task/ui/create_task_screen.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_cubit.dart';
import 'package:todo_app/features/edit_task/ui/edit_task_screen.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/ui/home_screen.dart';
import 'package:todo_app/features/home/ui/widgets/qr/qr_scanner.dart';
import 'package:todo_app/features/home/ui/widgets/task_details/task_detail.dart';
import 'package:todo_app/features/login/logic/login_cubit.dart';
import 'package:todo_app/features/login/ui/login_screen.dart';
import 'package:todo_app/features/onboarding/ui/on_boarding_screen.dart';
import 'package:todo_app/features/profile/logic/profile_cubit.dart';
import 'package:todo_app/features/profile/ui/profile_screen.dart';
import 'package:todo_app/features/signup/logic/signup_cubit.dart';
import 'package:todo_app/features/signup/ui/signup_screen.dart';
import 'package:todo_app/features/splash/ui/splash_screen.dart';

import '../../features/home/data/models/model.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (builder) => SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (builder) => OnBoardingScreen(),
        );
      case Routes.editScreen:
        return MaterialPageRoute(builder: (builder) {
          final data = settings.arguments as Data?;

          return BlocProvider(
            create: (BuildContext context) => EditTaskCubit(
              getIt(),
              data!,
            ),
            child: EditTaskScreen(
              taskDetails: data,
            ),
          );
        });
      case Routes.createTaskScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
              create: (BuildContext context) => CreateTaskCubit(getIt()),
              child: CreateTaskScreen()),
        );
      case Routes.taskDetailScreen:
        return MaterialPageRoute(
          builder: (builder) {
            final data = settings.arguments as Data?;

            return BlocProvider.value(
              value: HomeCubit(getIt()),
              child: TaskDetail(
                data: data,
              ),
            );
          },
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
              create: (BuildContext context) =>
                  ProfileCubit(getIt())..getProfile(),
              child: ProfileScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
              create: (BuildContext context) => HomeCubit(getIt())..getTasks(),
              child: HomeScreen()),
        );
      case Routes.qrScanScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider.value(
            value: HomeCubit(getIt()),
            child: QrScanner(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (BuildContext context) => LoginCubit(getIt()),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (builder) => BlocProvider(
            create: (BuildContext context) => SignupCubit(getIt()),
            child: SignupScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
