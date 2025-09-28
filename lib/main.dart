import 'package:flutter/material.dart';
import 'package:quizzy/quizzy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/app_strings.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final isShowOnBoarding = prefs.getBool(AppStrings.showOnBoarding) ?? false;
  runApp(Quizzy(appRouter: AppRouter(), showOnBoarding: isShowOnBoarding));
}
