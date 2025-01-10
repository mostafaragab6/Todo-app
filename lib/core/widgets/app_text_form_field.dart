import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final bool? isObscured;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final TextEditingController controller;
  final Color? fillColor;
  final TextStyle? hintTextStyle;
  final bool? enabled;
  final int? maxLines;
  final Color? borderColor;

  final Function(String?) validator;
  final Function(String?)? onChanged;
  final double? maxWidth;

  const AppTextFormField({
    this.borderColor,
    this.maxWidth,
    this.maxLines,
    this.enabled,
    super.key,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    required this.hintText,
    this.isObscured,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.fillColor,
    this.hintTextStyle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      enabled: enabled,
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ColorsManager.lightGrey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ColorsManager.lightGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ColorsManager.mainPurpule,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: hintTextStyle ?? TextStyles.font14GreyWeight400(),
        hintText: hintText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
      ),
      onChanged: onChanged,
      obscureText: isObscured ?? false,
      style: TextStyles.font14GreyWeight400(),
    );
  }
}
