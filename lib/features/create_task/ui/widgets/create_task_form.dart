import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_drop_down_text_field.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/create_task_cubit.dart';
import 'upload_image_bloc_builder.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({super.key});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  String selectedValue = 'low';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<CreateTaskCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<CreateTaskCubit>(),
                    child: Container(
                      width: double.infinity,
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                size: 100,
                              ),
                              onPressed: () {
                                context
                                    .read<CreateTaskCubit>()
                                    .pickImage('camera');
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.image,
                                size: 100,
                              ),
                              onPressed: () {
                                context
                                    .read<CreateTaskCubit>()
                                    .pickImage('gallery');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Image.asset(
              'assets/imgs/Frame 1.png',
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          UploadImageBlocBuilder(),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Task title',
            style: TextStyles.font12GreyWeight400(),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextFormField(
            hintText: 'Enter title here...',
            controller: context.read<CreateTaskCubit>().titleController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Must write your task title";
              }
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Task description',
            style: TextStyles.font12GreyWeight400(),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextFormField(
            maxLines: 7,
            hintText: 'Enter description here...',
            controller: context.read<CreateTaskCubit>().descController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Must write your task description";
              }
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Priority',
            style: TextStyles.font12GreyWeight400(),
          ),
          dropDownField(),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Due date',
            style: TextStyles.font12GreyWeight400(),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2039),
              ).then((value) {
                setState(() {
                  context.read<CreateTaskCubit>().dateController.text =
                      value.toString().substring(0, 10);
                  //print(selectedDate?.substring(0, 10));
                });
              });
            },
            child: AppTextFormField(
              enabled: false,
              maxLines: 1,
              hintText: 'Choose due date...',
              suffixIcon: Image.asset('assets/imgs/calendar.png'),
              controller: context.read<CreateTaskCubit>().dateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Must choose your task due date";
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownField() {
    return AppDropDownTextField(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
      icon: Image.asset('assets/imgs/Arrow - Down 2.png'),
      borderColor: Colors.transparent,
      fillColor: ColorsManager.lighterPurple,
      value: selectedValue,
      list: [
        DropdownMenuItem(
          value: 'low',
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                'Low priority',
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'medium',
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                'Medium priority',
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'high',
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                'High priority',
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
      ],
      hintText: 'Choose experience level',
      controller: context.read<CreateTaskCubit>().priorityController,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
          context.read<CreateTaskCubit>().priorityController.text = value;
        });
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'You must choose priority';
        }
      },
    );
  }
}
