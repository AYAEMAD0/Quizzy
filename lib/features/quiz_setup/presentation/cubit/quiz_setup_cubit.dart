import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/quiz_setup.dart';

part 'quiz_setup_state.dart';

class QuizSetupCubit extends Cubit<QuizSetupState> {
  QuizSetupCubit() : super(const QuizSetupState());

  void setCategory(int category) =>
      emit(state.copyWith(selectedCategory: category));

  void setDifficulty(String difficulty) =>
      emit(state.copyWith(selectedDifficulty: difficulty));

  void setQuestionCount(int count) =>
      emit(state.copyWith(questionCount: count));

  QuizSetup? getSetup() {
    if (state.selectedCategory != null &&
        state.selectedDifficulty != null &&
        state.questionCount != null) {
      return QuizSetup(
        numberOfQuestions: state.questionCount!,
        category: state.selectedCategory!,
        difficulty: state.selectedDifficulty!,
      );
    }
    return null;
  }
}
