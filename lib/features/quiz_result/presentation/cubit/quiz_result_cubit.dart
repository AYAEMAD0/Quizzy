import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/quiz_result_model.dart';
import '../../domain/repo/quiz_result_repository.dart';

part 'quiz_result_state.dart';

class QuizResultCubit extends Cubit<QuizResultState> {
  final QuizResultRepository repository;

  QuizResultCubit(this.repository) : super(QuizResultState());

  Future<void> loadResult(int score, int totalQuestions) async {
    emit(QuizResultState(loading: true));
    final name = await repository.getPlayerName() ?? "Player";
    emit(
      QuizResultState(
        result: QuizResultModel(
          playerName: name,
          score: score,
          totalQuestions: totalQuestions,
        ),
        loading: false,
      ),
    );
  }

  Future<void> resetPlayer() async {
    await repository.clearPlayerName();
  }
}
