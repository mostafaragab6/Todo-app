import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/home/data/models/model.dart';
import 'package:todo_app/features/home/ui/widgets/home/home_bloc_listener.dart';

import '../../../../../core/theming/styles.dart';
import '../../../logic/home_cubit.dart';

// ignore: must_be_immutable
class ListViewItem extends StatefulWidget {
  ListViewItem({this.index, this.length, required this.data, super.key});

  Data? data;
  int? index;
  int? length;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.taskDetailScreen,
              arguments: widget.data,
            );
          },
          child: Row(
            spacing: 15.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  width: 55.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://todo.iraqsapp.com/images/${widget.data?.image}",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/imgs/work-order.png'),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data?.title ?? '',
                                style: TextStyles.font16BlackWeight700(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsetsDirectional.only(bottom: 2.h),
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: widget.data?.status == 'waiting'
                                      ? ColorsManager.pink
                                      : widget.data?.status == 'finished'
                                          ? ColorsManager.lightBlue
                                          : ColorsManager.lightPurple,
                                ),
                                child: Text(
                                  widget.data?.status ?? '',
                                  style: TextStyles.font12PurpleWeight500()
                                      .copyWith(
                                    color: widget.data?.status == 'waiting'
                                        ? ColorsManager.orange
                                        : widget.data?.status == 'finished'
                                            ? ColorsManager.blue
                                            : ColorsManager.mainPurpule,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isOpened = !isOpened;
                                    });
                                  },
                                  child:
                                      Image.asset('assets/imgs/Frame (3).png'))
                            ],
                          ),
                        ),
                        Text(
                          widget.data?.desc ?? '',
                          style: TextStyles.font14LightPurpleWeight400(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 40.0.w),
                          child: Row(
                            spacing: 5.w,
                            children: [
                              Image.asset(
                                'assets/imgs/Frame (2).png',
                                color: widget.data?.priority == 'high'
                                    ? ColorsManager.orange
                                    : widget.data?.priority == 'medium'
                                        ? ColorsManager.mainPurpule
                                        : ColorsManager.blue,
                              ),
                              Text(
                                widget.data?.priority ?? '',
                                style:
                                    TextStyles.font12PurpleWeight500().copyWith(
                                  color: widget.data?.priority == 'high'
                                      ? ColorsManager.orange
                                      : widget.data?.priority == 'medium'
                                          ? ColorsManager.mainPurpule
                                          : ColorsManager.blue,
                                ),
                              ),
                              Spacer(),
                              Text(
                                widget.data?.createdAt?.substring(0, 10) ?? '',
                                style: TextStyles.font12LightPurpleWeight400(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    isOpened
                        ? Positioned(
                            top: 20.h,
                            left: 160.w,
                            child: Container(
                              width: 90.w,
                              height: 55.h,
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.editScreen,
                                        arguments: widget.data,
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 15.0.w,
                                          top: 3.0.h,
                                          bottom: 2.0.h),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
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
                                    padding: EdgeInsetsDirectional.only(
                                        start: 15.0.w,
                                        top: 3.0.h,
                                        bottom: 2.0.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.read<HomeCubit>().deleteTask(
                                              fromHomeTaskId: widget.data?.id,
                                            );
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                  HomeBlocListener(taskId: widget.data?.id),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
        ),
        widget.index == widget.length! - 1
            ? SizedBox(
                height: 120.h,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
