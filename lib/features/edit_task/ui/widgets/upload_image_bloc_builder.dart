import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_cubit.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_state.dart';

import '../../../../core/networking/dio_factory.dart';

class UploadImageBlocBuilder extends StatelessWidget {
  const UploadImageBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTaskCubit, EditTaskState>(
      buildWhen: (previous, current) =>
          current is UploadImageSuccess ||
          current is UploadImageLoading ||
          current is UploadImageError,
      builder: (context, state) => state.maybeWhen(
        uploadImageLoading: () {
          print('i am here');
          return LinearProgressIndicator(
            color: ColorsManager.mainPurpule,
          );
        },
        uploadImageSuccess: () {
          return SizedBox.shrink();
        },
        uploadImageError: (error) {
          if (error.contains('status code of 401')) {
            DioFactory.refreshToken();
            context.read<EditTaskCubit>().uploadImage();
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
