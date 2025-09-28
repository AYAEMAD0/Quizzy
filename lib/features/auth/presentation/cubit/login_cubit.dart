import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_strings.dart';

class LoginCubit extends Cubit<bool> {
  LoginCubit() : super(false);

  Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppStrings.storeName, name);
    emit(true);
  }
}
