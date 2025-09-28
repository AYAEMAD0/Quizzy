import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final Widget? prefixIconName;
  final Widget? suffixIconName;
  final bool? obscure;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.prefixIconName,
    this.suffixIconName,  this.obscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autofocus: false,
      maxLines: maxLines,
      obscureText: obscure!,
      obscuringCharacter: "*",
      cursorColor: AppColors.primary,
      cursorHeight: 22.h,
      cursorWidth: 3.w,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.font16GrayMedium,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        prefixIcon: prefixIconName,
        suffixIcon: suffixIconName,
        prefixIconColor: AppColors.iconTextFieldColor,
        suffixIconColor: AppColors.iconTextFieldColor,
        enabledBorder: builtBorder(AppColors.primary),
        focusedBorder: builtBorder(AppColors.primary),
        errorBorder: builtBorder(AppColors.incorrect),
        focusedErrorBorder: builtBorder(AppColors.incorrect),
        errorStyle:TextStyles.font14WhiteBlueBold,
        filled: true,
        fillColor: AppColors.colorWhiteBlue,
      ),
    );
  }
}

OutlineInputBorder builtBorder(Color borderSideColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.r),
    borderSide: BorderSide(color: borderSideColor, width: 2.w),
  );
}
