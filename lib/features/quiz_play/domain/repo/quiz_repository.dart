import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../../domain/entities/question_entity.dart';

abstract class QuizRepository {
  Future<List<QuestionEntity>> fetchQuestions(QuizSetupModel settings);
}
