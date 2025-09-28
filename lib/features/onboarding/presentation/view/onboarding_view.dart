import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../pages/onboarding_pages.dart';
import '../widget/built_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
          child: IntroductionScreen(
            globalBackgroundColor: AppColors.primary,
            pages: OnboardingPages.pages,
            dotsDecorator: DotsDecorator(
              color: AppColors.indicatorUnactive,
              activeColor: AppColors.indicatorActive,
              activeSize: Size(25.w, 8.h),
              size: Size(10.w, 10.h),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.sp),
              ),
            ),
            showBackButton: true,
            showNextButton: true,
            showDoneButton: true,
            next: BuiltButton(text: AppStrings.next),
            back: BuiltButton(
              text: AppStrings.back,
              alignment: Alignment.bottomLeft,
            ),
            done: BuiltButton(text: AppStrings.finish),
            onDone: () async {
              //todo done
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool(AppStrings.showOnBoarding, true);
              Navigator.pushReplacementNamed(context, Routes.loginRouteName);
            },
          ),
        ),
      ),
    );
  }
}
