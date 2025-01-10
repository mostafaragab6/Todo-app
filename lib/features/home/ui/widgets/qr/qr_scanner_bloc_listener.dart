import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/logic/home_state.dart';

import '../../../../../core/networking/dio_factory.dart';

// ignore: must_be_immutable
class QrScannerBlocListener extends StatelessWidget {
  QrScannerBlocListener({required this.taskId, super.key});
  String? taskId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is SpecificTaskLoading ||
          current is SpecificTaskSuccess ||
          current is SpecificTaskError,
      listener: (context, state) => state.whenOrNull(
        specificTaskSuccess: (task) => Navigator.pushNamed(
            context, Routes.taskDetailScreen,
            arguments: task),
        specificTaskError: (error) {
          if (error.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<HomeCubit>().getSpecificTask(taskId ?? '');
          } else if (error.contains('status code of 500') ||
              error.contains(
                  '\'String\' is not a subtype of type \'Map<String, dynamic>\'')) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: ColorsManager.lightGrey,
                  title: Text('Task Not Found'),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context), // Close the dialog
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              },
            );
          }
          return null;
        },
      ),
      child: SizedBox.shrink(),
    );
  }
}
