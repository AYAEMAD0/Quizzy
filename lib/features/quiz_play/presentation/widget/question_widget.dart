import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class QuestionWidget extends StatelessWidget {
  final String text;

  const QuestionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.natural,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.font20BlackBold,
      ),
    );
  }
}
