import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/create_task/logic/create_task_cubit.dart';
import 'package:todo_app/features/create_task/logic/create_task_state.dart';

import '../../../../core/networking/dio_factory.dart';

class CreateTaskBlocListener extends StatelessWidget {
  const CreateTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTaskCubit, CreateTaskState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) => state.whenOrNull(
        loading: () => SizedBox.shrink(),
        success: (data) => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeScreen,
          ((Route<dynamic> route) => false),
        ),
        error: (error) {
          if (error.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<CreateTaskCubit>().createTask();
          }
          return null;
        },
      ),
      child: SizedBox.shrink(),
    );
  }
}
