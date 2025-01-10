import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_drop_down_text_field.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/edit_task_cubit.dart';
import 'upload_image_bloc_builder.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({super.key});

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditTaskCubit>().formKey,
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
                    value: context.read<EditTaskCubit>(),
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
                                    .read<EditTaskCubit>()
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
                                    .read<EditTaskCubit>()
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
            controller: context.read<EditTaskCubit>().titleController,
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
            controller: context.read<EditTaskCubit>().descController,
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
          SizedBox(
            height: 10.h,
          ),
          dropDownField(
            firstValue: 'low',
            secondValue: 'medium',
            thirdValue: 'high',
            firstText: 'Low priority',
            secondText: 'Medium priority',
            thirdText: 'High priority',
            controller: context.read<EditTaskCubit>().priorityController,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Status',
            style: TextStyles.font12GreyWeight400(),
          ),
          SizedBox(
            height: 10.h,
          ),
          dropDownField(
            firstValue: 'waiting',
            secondValue: 'inprogress',
            thirdValue: 'finished',
            firstText: 'Waiting',
            secondText: 'Inprogress',
            thirdText: 'Finished',
            controller: context.read<EditTaskCubit>().statusController,
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
                  context.read<EditTaskCubit>().dateController.text =
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
              controller: context.read<EditTaskCubit>().dateController,
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

  Widget dropDownField({
    required String firstValue,
    required String secondValue,
    required String thirdValue,
    required String firstText,
    required String secondText,
    required String thirdText,
    required TextEditingController controller,
  }) {
    return AppDropDownTextField(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
      icon: Image.asset('assets/imgs/Arrow - Down 2.png'),
      borderColor: Colors.transparent,
      fillColor: ColorsManager.lighterPurple,
      value: controller.text,
      list: [
        DropdownMenuItem(
          value: firstValue,
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                firstText,
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: secondValue,
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                secondText,
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
        DropdownMenuItem(
          value: thirdValue,
          child: Row(
            spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset('assets/imgs/F.png'),
              ),
              Text(
                thirdText,
                style: TextStyles.font16PurpleWeight700(),
              ),
            ],
          ),
        ),
      ],
      hintText: 'Choose experience level',
      controller: controller,
      onChanged: (value) {
        controller.text = value ?? '';
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'You must choose priority';
        }
      },
    );
  }
}
