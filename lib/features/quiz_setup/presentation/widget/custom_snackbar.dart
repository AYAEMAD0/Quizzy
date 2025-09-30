import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy/core/constants/app_strings.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.colorBlack,
      ),
      child: Text(
        AppStrings.pleaseSelectAllOptions,
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
