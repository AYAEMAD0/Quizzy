import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_strings.dart';

class OnboardingCubit extends Cubit<bool> {
  OnboardingCubit() : super(false);

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.showOnBoarding, true);
    emit(true);
  }
}
