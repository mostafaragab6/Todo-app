import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';
import '../theming/styles.dart';

class AppDropDownTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final TextEditingController controller;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? icon;

  final TextStyle? hintTextStyle;
  final bool? enabled;
  final Function(String?) validator;
  final void Function(String?)? onChanged;

  final List<DropdownMenuItem<String>> list;
  final String? value;
  final double? maxWidth;

  const AppDropDownTextField({
    this.maxWidth,
    this.icon,
    this.borderColor,
    required this.value,
    required this.list,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    required this.hintText,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.fillColor,
    this.hintTextStyle,
    this.onChanged,
    super.key,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? ColorsManager.grey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ColorsManager.mainPurpule,
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
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: hintTextStyle ?? TextStyles.font14GreyWeight400(),
        hintText: hintText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 0.w, vertical: 13.h),
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
      ),
      dropdownColor: Colors.white,
      items: list,
      onChanged: onChanged,
      value: value,
      icon: icon,
    );
  }
}
