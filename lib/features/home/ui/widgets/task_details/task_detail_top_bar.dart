import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/data/models/model.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/home_cubit.dart';

// ignore: must_be_immutable
class TaskDetailTopBar extends StatefulWidget {
  TaskDetailTopBar(
      {required this.overLayController, required this.data, super.key});
  Data? data;
  OverlayPortalController overLayController;

  @override
  State<TaskDetailTopBar> createState() => _TaskDetailTopBarState();
}

class _TaskDetailTopBarState extends State<TaskDetailTopBar> {
  //final overLayController = OverlayPortalController();

  bool detailsOpened = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        GestureDetector(
            onTap: () {
              widget.overLayController.hide();
              Navigator.pop(context);
            },
            child: Image.asset('assets/imgs/Arrow .png')),
        Text(
          'Task Details',
          style: TextStyles.font16BlackWeight700(),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            widget.overLayController.toggle();
            setState(() {
              detailsOpened = !detailsOpened;
            });
          },
          child: Container(
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: OverlayPortal(
                controller: widget.overLayController,
                overlayChildBuilder: (context) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 65.h,
                        left: 260.w,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.only(start: 60.0.w),
                              child: ClipPath(
                                clipper: TriangleClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(1.0, 1.0),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                    color: const Color.fromARGB(
                                        255, 255, 253, 253),
                                  ),
                                  width: 13,
                                  height: 13,
                                ),
                              ),
                            ),
                            Container(
                              width: 90.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    //offset: const Offset(1.0, 1.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      widget.overLayController.toggle();
                                      Navigator.pushNamed(
                                        context,
                                        Routes.editScreen,
                                        arguments: widget.data,
                                      );
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17.0),
                                    child: Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        context.read<HomeCubit>().deleteTask();
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                child: Image.asset('assets/imgs/Frame (3).png')),
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0) // Top center
      ..lineTo(0, size.height) // Bottom-left
      ..lineTo(size.width, size.height) // Bottom-right
      ..close(); // Close the path to form the triangle

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
