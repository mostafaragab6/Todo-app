import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/app_drop_down_text_field.dart';
import 'package:todo_app/features/signup/logic/signup_cubit.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';

// ignore: must_be_immutable
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String? selectedExperienceLevel;
  var countryController = TextEditingController();

  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            width: 326.w,
            child: AppTextFormField(
              hintTextStyle: TextStyles.font14LightGreyWeight400(),
              hintText: 'Name...',
              controller: context.read<SignupCubit>().nameController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'You must write your name';
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: 326.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorsManager.lightGrey),
              color: Colors.white,
            ),
            child: Row(
              children: [
                AppDropDownTextField(
                  borderColor: Colors.transparent,
                  onChanged: (value) {},
                  maxWidth: 85.w,
                  value: 'EG',
                  list: [
                    DropdownMenuItem(
                      value: 'EG',
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/imgs/EG.png',
                              width: 23.w,
                              height: 23.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '+20',
                              style: TextStyles.font14DarkGreyWeight700(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'IR',
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/imgs/Iraq (IQ).png'),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '+20',
                              style: TextStyles.font14DarkGreyWeight700(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'KSA',
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/imgs/KSA.png',
                              width: 23.w,
                              height: 23.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '+20',
                              style: TextStyles.font14DarkGreyWeight700(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                  hintText: '',
                  controller: countryController,
                  validator: (String? value) {},
                ),
                AppTextFormField(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  borderColor: Colors.transparent,
                  maxWidth: 238.w,
                  hintTextStyle: TextStyles.font14LightGreyWeight400(),
                  hintText: '123 456-7890',
                  controller: context.read<SignupCubit>().phoneController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'You must write your phone number';
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 326.w,
            child: AppTextFormField(
              hintTextStyle: TextStyles.font14LightGreyWeight400(),
              hintText: 'Years of experience...',
              controller: context.read<SignupCubit>().yearExpLevelController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'You must write your years of experience';
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 326.w,
            child: AppDropDownTextField(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
              value: selectedExperienceLevel,
              list: [
                DropdownMenuItem(value: 'fresh', child: Text('Fresh')),
                DropdownMenuItem(value: 'junior', child: Text('Junior')),
                DropdownMenuItem(value: 'senior', child: Text('Senior')),
                DropdownMenuItem(value: 'midLevel', child: Text('Mid-level')),
              ],
              hintText: 'Choose experience level',
              controller: context.read<SignupCubit>().expLevelController,
              onChanged: (value) {
                context.read<SignupCubit>().expLevelController.text = value!;
              },
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'You must write your years of experience';
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 326.w,
            child: AppTextFormField(
              hintTextStyle: TextStyles.font14LightGreyWeight400(),
              hintText: 'Address...',
              controller: context.read<SignupCubit>().addressController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'You must write your address';
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 326.w,
            child: AppTextFormField(
              maxLines: 1,
              hintTextStyle: TextStyles.font14LightGreyWeight400(),
              hintText: 'Password...',
              isObscured: isPass,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPass = !isPass;
                  });
                },
                icon: isPass
                    ? Icon(
                        Icons.visibility_off,
                        color: ColorsManager.lightGrey,
                      )
                    : Icon(
                        Icons.visibility,
                        color: ColorsManager.lightGrey,
                      ),
              ),
              controller: context.read<SignupCubit>().passController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'You must write your password';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
