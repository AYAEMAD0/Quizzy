import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_strings.dart';
import '../../domain/repo/quiz_result_repository.dart';

class QuizResultRepositoryImpl implements QuizResultRepository {
  @override
  Future<String?> getPlayerName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppStrings.storeName);
  }

  @override
  Future<void> clearPlayerName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppStrings.storeName);
  }
}
