import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/home/data/models/model.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/ui/widgets/task_details/task_detail_top_bar.dart';

import '../../../../../core/theming/styles.dart';
import 'task_detail_bloc_listener.dart';

// ignore: must_be_immutable
class TaskDetail extends StatefulWidget {
  TaskDetail({this.data, super.key});
  Data? data;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final overLayController = OverlayPortalController();
  bool detailsOpened = false;

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().taskId = widget.data?.id;
    DateTime parsedDate = DateTime.parse(widget.data?.createdAt ?? '');
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        overLayController.hide();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              bottom: 30.h,
              top: 20.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskDetailTopBar(
                    data: widget.data,
                    overLayController: overLayController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://todo.iraqsapp.com/images/${widget.data?.image}",
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/imgs/work-order.png'),
                      ),
                    ),
                  ),
                  Text(
                    widget.data?.title ?? "",
                    style: TextStyles.font24BlackWeight700(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.data!.desc!,
                    style: TextStyles.font14LightGreyWeight400()
                        .copyWith(height: 1.7),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 7.h, start: 25.w, end: 15.w),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Date',
                              style: TextStyles.font9DarkPurpleWeight400(),
                            ),
                            Text(
                              DateFormat("d MMMM, yyyy").format(parsedDate),
                              style: TextStyles.font14GreyWeight400(),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Image.asset('assets/imgs/calendar.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 0.h, start: 25.w, end: 15.w),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.data?.status ?? '',
                          style: TextStyles.font16PurpleWeight700(),
                        ),
                        Spacer(),
                        Image.asset('assets/imgs/Arrow - Down 2.png')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 0.h, start: 25.w, end: 15.w),
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.lighterPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/imgs/F.png'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '${widget.data?.priority} priority',
                          style: TextStyles.font16PurpleWeight700(),
                        ),
                        Spacer(),
                        Image.asset('assets/imgs/Arrow - Down 2.png')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: QrImageView(
                      data: widget.data?.id ?? "",
                      version: QrVersions.auto,
                      size: 200.0,
                      gapless: false,
                    ),
                  ),
                  TaskDetailBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
