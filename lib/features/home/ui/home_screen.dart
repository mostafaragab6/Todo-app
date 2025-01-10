import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/ui/widgets/home/tabs_row.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/home/home_bloc_builder.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 15.0.h, end: 20.w),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.createTaskScreen,
            );
          },
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: ColorsManager.mainPurpule,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsetsDirectional.only(
            start: 20.w,
            end: 20.w,
            bottom: 30.h,
            top: 10.h,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Logo',
                        style: TextStyles.font24BlackWeight700(),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.profileScreen,
                          );
                        },
                        icon: Image.asset(
                          'assets/imgs/Frame.png',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  'Logout',
                                  style: TextStyles.font16BlackWeight400(),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'You’ll need to enter your phone\n and password next time\n you want to login',
                                  style: TextStyles.font12BlackWeight400()
                                      .copyWith(height: 1.7),
                                  textAlign: TextAlign.center,
                                ),
                                actionsPadding: EdgeInsets.zero,
                                buttonPadding: EdgeInsets.zero,
                                actions: [
                                  AppTextButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                    },
                                    backGroundColor: Colors.white,
                                    width: 147,
                                    borderRadiusStyle: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorsManager.lighterGrey1),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyles.font16BlackWeight400(),
                                    ),
                                  ),
                                  AppTextButton(
                                    onPressed: () {
                                      context.read<HomeCubit>().logout();
                                      Navigator.pop(dialogContext);
                                    },
                                    backGroundColor: Colors.white,
                                    width: 147,
                                    borderRadiusStyle: const BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorsManager.lighterGrey1),
                                    child: Text(
                                      'Logout',
                                      style: TextStyles.font16RedWeight400(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          // context.read<HomeCubit>().getTasks();
                          // context.read<HomeCubit>().logout();
                        },
                        icon: Image.asset(
                          'assets/imgs/Frame (1).png',
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'My Tasks',
                    style: TextStyles.font16DarkPurpleWeight700(),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TabsRow(),
                  SizedBox(
                    height: 25.h,
                  ),
                  HomeBlocBuilder()
                ],
              ),
              Positioned(
                top: 620.h,
                left: 269.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.qrScanScreen,
                    );
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.moreLighterPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset('assets/imgs/Qr.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
