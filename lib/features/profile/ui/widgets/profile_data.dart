import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/profile/data/models/profile_response.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';

// ignore: must_be_immutable
class ProfileData extends StatelessWidget {
  ProfileData({required this.data, super.key});

  ProfileResponse? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.darkerPurple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NAME',
                style: TextStyles.font12LighterGreyWeight500(),
              ),
              Text(
                data?.displayName ?? '',
                style: TextStyles.font18LighterGreyWeight700(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.darkerPurple,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PHONE',
                    style: TextStyles.font12LighterGreyWeight500(),
                  ),
                  Text(
                    data?.userName ?? '',
                    style: TextStyles.font18LighterGreyWeight700(),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: data?.userName ?? ''));
                  },
                  child: Image.asset('assets/imgs/Frame (4).png')),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.darkerPurple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LEVEL',
                style: TextStyles.font12LighterGreyWeight500(),
              ),
              Text(
                data?.level ?? '',
                style: TextStyles.font18LighterGreyWeight700(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.darkerPurple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YEARS OF EXPERIENCE',
                style: TextStyles.font12LighterGreyWeight500(),
              ),
              Text(
                data!.experienceYears! > 1
                    ? '${data?.experienceYears} years'
                    : '${data?.experienceYears} year',
                style: TextStyles.font18LighterGreyWeight700(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsManager.darkerPurple,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOCATION',
                style: TextStyles.font12LighterGreyWeight500(),
              ),
              Text(
                data?.address ?? '',
                style: TextStyles.font18LighterGreyWeight700(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
