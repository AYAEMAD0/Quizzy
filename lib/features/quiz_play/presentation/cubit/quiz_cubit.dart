// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quizzy/features/quiz_play/presentation/cubit/quiz_state.dart';
// import '../../../quiz_setup/data/models/quiz_setup_model.dart';
// import '../../domain/usecase/fetch_questions_usecase.dart';
//
// class QuizCubit extends Cubit<QuizState> {
//   final FetchQuestionsUseCase fetchQuestionsUseCase;
//   Timer? _timer;
//
//   QuizCubit(this.fetchQuestionsUseCase) : super(const QuizState());
//
//   Future<void> fetchQuestions(QuizSetupModel settings) async {
//     emit(state.copyWith(loading: true, error: null));
//     try {
//       final questions = await fetchQuestionsUseCase(settings);
//       emit(state.copyWith(
//         loading: false,
//         questions: questions,
//         currentIndex: 0,
//         score: 0,
//         completed: false,
//         timeLeft: 10,
//       ));
//       _startTimer();
//     } catch (e) {
//       emit(state.copyWith(loading: false, error: e.toString()));
//     }
//   }
//
//   // void selectAnswer(String answer) {
//   //   if (state.current == null || state.selectedAnswer != null) return;
//   //   int newScore = state.score;
//   //   if (answer == state.current!.correctAnswer) newScore++;
//   //   emit(state.copyWith(selectedAnswer: answer, score: newScore));
//   //   Future.delayed(const Duration(seconds: 2), nextQuestion);
//   // }
//
//   void selectAnswer(String answer) {
//     if (state.current == null || state.selectedAnswer != null) return;
//
//     _timer?.cancel(); // وقف الـ timer فورًا عند اختيار إجابة
//
//     int newScore = state.score;
//     if (answer == state.current!.correctAnswer) newScore++;
//
//     emit(state.copyWith(selectedAnswer: answer, score: newScore));
//
//     // انتظر 2 أو 3 ثواني قبل الانتقال للسؤال التالي
//     Future.delayed(const Duration(seconds: 2), () {
//       if (!state.completed) nextQuestion();
//     });
//   }
//
//   void nextQuestion() {
//     if (state.currentIndex + 1 < state.questions.length) {
//       emit(state.copyWith(
//         currentIndex: state.currentIndex + 1,
//         selectedAnswer: null,
//         timeLeft: 10,
//       ));
//       _startTimer();
//     } else {
//       emit(state.copyWith(completed: true));
//       _timer?.cancel();
//     }
//   }
//
//
//   // void nextQuestion() {
//   //   if (state.currentIndex + 1 < state.questions.length) {
//   //     emit(state.copyWith(
//   //       currentIndex: state.currentIndex + 1,
//   //       selectedAnswer: null,
//   //       timeLeft: 10,
//   //     ));
//   //     _startTimer();
//   //   } else {
//   //     emit(state.copyWith(completed: true));
//   //     _timer?.cancel();
//   //   }
//   // }
//
//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (state.timeLeft > 0) {
//         emit(state.copyWith(timeLeft: state.timeLeft - 1));
//       } else {
//         timer.cancel();
//         nextQuestion();
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzy/features/quiz_play/presentation/cubit/quiz_state.dart';

import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../../domain/usecase/fetch_questions_usecase.dart';

class QuizCubit extends Cubit<QuizState> {
  final FetchQuestionsUseCase fetchQuestionsUseCase;
  Timer? _timer;

  static const int questionDuration = 10;
  static const int delayAfterAnswer = 2;

  QuizCubit(this.fetchQuestionsUseCase) : super(const QuizState());

  Future<void> fetchQuestions(QuizSetupModel settings) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final questions = await fetchQuestionsUseCase(settings);
      emit(
        state.copyWith(
          loading: false,
          questions: questions,
          currentIndex: 0,
          score: 0,
          completed: false,
          timeLeft: questionDuration,
        ),
      );
      _startTimer();
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void selectAnswer(String answer) {
    if (state.current == null || state.selectedAnswer != null) return;

    _timer?.cancel();

    int newScore = state.score;
    if (answer == state.current!.correctAnswer) newScore++;

    emit(state.copyWith(selectedAnswer: answer, score: newScore));

    // بعد ثانيتين ينتقل للسؤال اللي بعده
    Future.delayed(const Duration(seconds: delayAfterAnswer), () {
      if (!state.completed) nextQuestion();
    });
  }

  void nextQuestion() {
    if (state.currentIndex + 1 < state.questions.length) {
      emit(
        state.copyWith(
          currentIndex: state.currentIndex + 1,
          selectedAnswer: null,
          timeLeft: questionDuration,
        ),
      );
      _startTimer();
    } else {
      emit(state.copyWith(completed: true));
      _timer?.cancel();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        emit(state.copyWith(timeLeft: state.timeLeft - 1));
      } else {
        timer.cancel();
        nextQuestion();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
