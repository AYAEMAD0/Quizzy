import 'package:equatable/equatable.dart';

import '../../domain/entities/question_entity.dart';

class QuizState extends Equatable {
  final bool loading;
  final String? error;
  final List<QuestionEntity> questions;
  final int currentIndex;
  final int score;
  final bool completed;
  final String? selectedAnswer;
  final int timeLeft;

  const QuizState({
    this.loading = false,
    this.error,
    this.questions = const [],
    this.currentIndex = 0,
    this.score = 0,
    this.completed = false,
    this.selectedAnswer,
    this.timeLeft = 10,
  });

  QuestionEntity? get current =>
      questions.isNotEmpty && currentIndex < questions.length
      ? questions[currentIndex]
      : null;

  QuizState copyWith({
    bool? loading,
    String? error,
    List<QuestionEntity>? questions,
    int? currentIndex,
    int? score,
    bool? completed,
    String? selectedAnswer,
    int? timeLeft,
  }) {
    return QuizState(
      loading: loading ?? this.loading,
      error: error,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      completed: completed ?? this.completed,
      selectedAnswer: selectedAnswer,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }

  @override
  List<Object?> get props => [
    loading,
    error,
    questions,
    currentIndex,
    score,
    completed,
    selectedAnswer,
    timeLeft,
  ];
}
