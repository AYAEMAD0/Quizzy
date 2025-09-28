part of 'quiz_setup_cubit.dart';

class QuizSetupState {
  final int? selectedCategory;
  final String? selectedDifficulty;
  final int? questionCount;

  const QuizSetupState({
    this.selectedCategory,
    this.selectedDifficulty,
    this.questionCount,
  });

  QuizSetupState copyWith({
    int? selectedCategory,
    String? selectedDifficulty,
    int? questionCount,
  }) {
    return QuizSetupState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedDifficulty: selectedDifficulty ?? this.selectedDifficulty,
      questionCount: questionCount ?? this.questionCount,
    );
  }
}

