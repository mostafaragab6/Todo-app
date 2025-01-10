import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/logic/home_state.dart';

import '../../../../../core/networking/dio_factory.dart';
import '../../../../../core/routing/routes.dart';

class TaskDetailBlocListener extends StatelessWidget {
  const TaskDetailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is DeleteTaskSuccess || current is DeleteTaskError,
      listener: (context, state) => state.whenOrNull(
        deleteTaskSuccess: (data) => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeScreen,
          (Route<dynamic> route) => false,
        ),
        deleteTaskError: (error) {
          if (error!.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<HomeCubit>().deleteTask();
          }
          return null;
        },
      ),
      child: SizedBox.shrink(),
    );
  }
}
