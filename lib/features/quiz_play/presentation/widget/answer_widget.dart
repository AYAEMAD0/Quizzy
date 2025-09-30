import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.decodedAnswer,
  });

  final Color color;
  final void Function() onTap;
  final String decodedAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            decodedAnswer,
            textAlign: TextAlign.center,
            style: TextStyles.font18NaturalBold.copyWith(
              color: AppColors.colorBlack,
            ),
          ),
        ),
      ),
    );
  }
}
