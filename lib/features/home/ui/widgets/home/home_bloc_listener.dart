import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/dio_factory.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';

// ignore: must_be_immutable
class HomeBlocListener extends StatelessWidget {
  HomeBlocListener({required this.taskId, super.key});
  String? taskId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is DeleteTaskSuccess || current is DeleteTaskError,
      listener: (context, state) => state.whenOrNull(
        deleteTaskSuccess: (data) => context.read<HomeCubit>().getTasks(),
        deleteTaskError: (error) {
          if (error!.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<HomeCubit>().deleteTask(fromHomeTaskId: taskId);
          }
          return null;
        },
      ),
      child: SizedBox.shrink(),
    );
  }
}
