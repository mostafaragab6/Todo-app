import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/create_task/logic/create_task_cubit.dart';
import 'package:todo_app/features/create_task/logic/create_task_state.dart';

import '../../../../core/networking/dio_factory.dart';

class UploadImageBlocBuilder extends StatelessWidget {
  const UploadImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      buildWhen: (previous, current) =>
          current is UploadedImageSuccess ||
          current is UploadedImageError ||
          current is UploadedImageLoading,
      builder: (context, state) => state.maybeWhen(
        uploadedImageLoading: () {
          print('i am here');
          return LinearProgressIndicator(
            color: ColorsManager.mainPurpule,
          );
        },
        uploadedImageSuccess: (data) {
          return SizedBox.shrink();
        },
        uploadedImageError: (error) {
          if (error.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<CreateTaskCubit>().uploadImage();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              //Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: ColorsManager.lightGrey,
                    title: Text('Issue when upload'),
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
            });
          }
          return SizedBox.shrink();
        },
        orElse: () {
          return SizedBox.shrink();
        },
      ),
    );
  }
}
