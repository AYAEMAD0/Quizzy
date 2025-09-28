import '../repo/quiz_setup_repository.dart';

class StartQuiz {
  final QuizSetupRepository repository;
  StartQuiz(this.repository);

  Future<void> call(QuizSetupRepository settings) {
    return repository.startQuiz(settings);
  }
}
