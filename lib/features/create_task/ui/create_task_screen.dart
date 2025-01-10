import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/widgets/app_text_button.dart';
import 'package:todo_app/features/create_task/logic/create_task_cubit.dart';
import 'package:todo_app/features/create_task/ui/widgets/create_task_bloc_listener.dart';
import 'package:todo_app/features/create_task/ui/widgets/create_task_form.dart';

// ignore: must_be_immutable
class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        context.read<CreateTaskCubit>().image = null;
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
                            context.read<CreateTaskCubit>().image = null;
                          },
                          child: Image.asset('assets/imgs/Arrow .png')),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Add new task',
                        style: TextStyles.font16BlackWeight700(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CreateTaskForm(),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextButton(
                    onPressed: () {
                      if (context
                          .read<CreateTaskCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<CreateTaskCubit>().createTask();
                      }
                    },
                    child: Text(
                      'Add task',
                      style: TextStyles.font19WhiteWeight700(),
                    ),
                  ),
                  CreateTaskBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
