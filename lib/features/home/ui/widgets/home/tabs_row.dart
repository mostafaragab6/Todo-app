import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';

import '../../../../../core/theming/colors_manager.dart';

class TabsRow extends StatefulWidget {
  const TabsRow({super.key});

  @override
  State<TabsRow> createState() => _TabsRowState();
}

class _TabsRowState extends State<TabsRow> {
  bool allIsSelected = true;
  bool inProgressIsSelected = false;
  bool waitingIsSelected = false;
  bool finishedIsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7.w,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              allIsSelected = true;
              inProgressIsSelected = false;
              waitingIsSelected = false;
              finishedIsSelected = false;
            });
            context.read<HomeCubit>().filter('all');
          },
          child: Container(
            height: 37.h,
            width: 50.w,
            decoration: BoxDecoration(
                color: allIsSelected
                    ? ColorsManager.mainPurpule
                    : ColorsManager.lighterPurple,
                borderRadius: BorderRadius.circular(23)),
            child: Center(
              child: Text(
                'All',
                style: TextStyle(
                    color: allIsSelected
                        ? Colors.white
                        : ColorsManager.darkPurple),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              allIsSelected = false;
              inProgressIsSelected = true;
              waitingIsSelected = false;
              finishedIsSelected = false;
              context.read<HomeCubit>().filter('inprogress');
            });
          },
          child: Container(
            height: 37.h,
            width: 90.w,
            decoration: BoxDecoration(
                color: inProgressIsSelected
                    ? ColorsManager.mainPurpule
                    : ColorsManager.lighterPurple,
                borderRadius: BorderRadius.circular(23)),
            child: Center(
                child: Text(
              'Inprogress',
              style: TextStyle(
                  color: inProgressIsSelected
                      ? Colors.white
                      : ColorsManager.darkPurple),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              allIsSelected = false;
              inProgressIsSelected = false;
              waitingIsSelected = true;
              finishedIsSelected = false;
            });
            context.read<HomeCubit>().filter('waiting');
          },
          child: Container(
            height: 37.h,
            width: 70.w,
            decoration: BoxDecoration(
                color: waitingIsSelected
                    ? ColorsManager.mainPurpule
                    : ColorsManager.lighterPurple,
                borderRadius: BorderRadius.circular(23)),
            child: Center(
                child: Text(
              'Waiting',
              style: TextStyle(
                  color: waitingIsSelected
                      ? Colors.white
                      : ColorsManager.darkPurple),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              allIsSelected = false;
              inProgressIsSelected = false;
              waitingIsSelected = false;
              finishedIsSelected = true;
              context.read<HomeCubit>().filter('finished');
            });
          },
          child: Container(
            height: 37.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: finishedIsSelected
                    ? ColorsManager.mainPurpule
                    : ColorsManager.lighterPurple,
                borderRadius: BorderRadius.circular(23)),
            child: Center(
                child: Text(
              'Finished',
              style: TextStyle(
                  color: finishedIsSelected
                      ? Colors.white
                      : ColorsManager.darkPurple),
            )),
          ),
        ),
      ],
    );
  }
}
