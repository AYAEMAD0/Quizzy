import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../entities/question_entity.dart';
import '../repo/quiz_repository.dart';

class FetchQuestionsUseCase {
  final QuizRepository repository;

  FetchQuestionsUseCase(this.repository);

  Future<List<QuestionEntity>> call(QuizSetupModel settings) async {
    return await repository.fetchQuestions(settings);
  }
}
