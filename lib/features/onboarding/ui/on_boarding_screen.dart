import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/shared_pref_helpers.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/widgets/app_text_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPrefHelper.setData('is_opened', true);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Image.asset(
              'assets/imgs/Frame 4.png',
            ),
            Positioned(
              top: 520.h,
              left: 21.w,
              child: Column(
                children: [
                  Text(
                    'Task Management \n&To-Do List',
                    style: TextStyles.font24BlackWeight700(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!',
                    textAlign: TextAlign.center,
                    style: TextStyles.font14GreyWeight400().copyWith(
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppTextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginScreen,
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Let’s Start',
                          style: TextStyles.font19WhiteWeight700(),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset('assets/imgs/Arrow - Left.png')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
