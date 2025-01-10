import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_cubit.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_state.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/routes.dart';

class EditTaskBlocListener extends StatelessWidget {
  const EditTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTaskCubit, EditTaskState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) => state.whenOrNull(
        success: (data) => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeScreen,
          (Route<dynamic> route) => false,
        ),
        error: (error) {
          if (error.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<EditTaskCubit>().editTask();
          }
          return null;
        },
      ),
      child: SizedBox.shrink(),
    );
  }
}
