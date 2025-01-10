import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/theming/colors_manager.dart';

// ignore: must_be_immutable
class AppTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backGroundColor;
  final BorderRadius? borderRadiusStyle;
  final BorderSide? borderSide;

  const AppTextButton({
    this.borderSide,
    this.borderRadiusStyle,
    this.backGroundColor,
    this.radius,
    this.width,
    this.height,
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backGroundColor ?? ColorsManager.mainPurpule,
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            width ?? 331.w,
            height ?? 49.h,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius:
                borderRadiusStyle ?? BorderRadius.circular(radius ?? 12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
