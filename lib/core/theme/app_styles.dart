import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font28WhiteExtraBold = GoogleFonts.montserrat(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.colorWhite,
  );
  static TextStyle font14WhiteSemiBold = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.colorWhite,
  );
  static TextStyle font16GrayMedium = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.hintTextFieldColor,
  );
  static TextStyle font22PrimarySemiBold = GoogleFonts.montserrat(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primary,
  );
  static TextStyle font14WhiteBlueBold = GoogleFonts.montserrat(
    color: AppColors.colorWhiteBlue,
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
  );
}
