import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy/core/routing/app_router.dart';
import 'package:quizzy/core/theme/app_theme.dart';

import 'core/routing/routes.dart';

class Quizzy extends StatelessWidget {
  final AppRouter appRouter;
  final bool showOnBoarding;

  const Quizzy({
    super.key,
    required this.appRouter,
    required this.showOnBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: showOnBoarding
              ? Routes.loginRouteName
              : Routes.onboardingRouteName,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
