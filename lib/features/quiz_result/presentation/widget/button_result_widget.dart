import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_button.dart';

class ButtonResultWidget extends StatelessWidget {
  const ButtonResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15.w,
      children: [
        CustomButton(
          text: AppStrings.tryAgain,
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.quizSetupRouteName);
          },
        ),
        CustomButton(
          text: AppStrings.newPlayer,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.loginRouteName);
          },
        ),
      ],
    );
  }
}
