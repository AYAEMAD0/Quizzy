import '../../../../core/error/app_exception.dart';
import '../../../../core/error/failure.dart';
import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/repo/quiz_repository.dart';
import '../data_sources/remote_data_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final RemoteDataSource remoteDataSource;

  QuizRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<QuestionEntity>> fetchQuestions(QuizSetupModel settings) async {
    try {
      final models = await remoteDataSource.fetchQuestions(settings);
      return models.map((m) => m.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    } on ParsingException catch (e) {
      throw ParsingFailure(e.message);
    } catch (e) {
      throw AppException("Unknown failure: $e");
    }
  }
}
