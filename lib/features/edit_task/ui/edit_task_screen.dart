import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/edit_task/logic/edit_task_cubit.dart';
import 'package:todo_app/features/edit_task/ui/widgets/edit_task_bloc_listener.dart';
import 'package:todo_app/features/edit_task/ui/widgets/edit_task_form.dart';
import 'package:todo_app/features/home/data/models/model.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({required this.taskDetails, super.key});
  Data? taskDetails;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        context.read<EditTaskCubit>().image = null;
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(
              20.w,
              20.h,
              20.w,
              10.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            context.read<EditTaskCubit>().image = null;
                          },
                          child: Image.asset('assets/imgs/Arrow .png')),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Edit task',
                        style: TextStyles.font16BlackWeight700(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  EditTaskForm(),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextButton(
                    onPressed: () {
                      context.read<EditTaskCubit>().editTask();
                    },
                    child: Text(
                      'Edit task',
                      style: TextStyles.font19WhiteWeight700(),
                    ),
                  ),
                  EditTaskBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
