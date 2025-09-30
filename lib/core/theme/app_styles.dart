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
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font28WhiteBlueBold = GoogleFonts.montserrat(
    color: AppColors.colorWhiteBlue,
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16WhiteMedium = GoogleFonts.montserrat(
    color: AppColors.colorWhiteBlue,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font24NaturalBold = GoogleFonts.montserrat(
    color: AppColors.natural,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font24RedExtraBold = GoogleFonts.montserrat(
    color: AppColors.incorrect,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font18NaturalBold = GoogleFonts.montserrat(
    color: AppColors.natural,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20BlackBold = GoogleFonts.montserrat(
    color: AppColors.colorBlack,
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
  );
}
