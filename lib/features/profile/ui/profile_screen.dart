import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import 'widgets/profile_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
            20.w,
            25.h,
            20.w,
            0,
          ),
          child: Column(
            spacing: 10.h,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        //context.read<ProfileCubit>().getProfile();
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/imgs/Arrow .png')),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Profile',
                    style: TextStyles.font16BlackWeight700(),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ProfileBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
