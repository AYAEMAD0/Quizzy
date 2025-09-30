import 'package:quizzy/core/constants/app_strings.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/networking/api_client.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../model/question_model.dart';

abstract class RemoteDataSource {
  Future<List<QuestionModel>> fetchQuestions(QuizSetupModel settings);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;

  RemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<QuestionModel>> fetchQuestions(QuizSetupModel settings) async {
    try {
      final response = await apiClient.get(
        ApiConstants.getQuestions,
        queryParameters: {
          "amount": settings.numberOfQuestions,
          "type": "multiple",
          "category": settings.category,
          "difficulty": settings.difficulty.toLowerCase(),
        },
      );

      return (response.data['results'] as List)
          .map((e) => QuestionModel.fromJson(e))
          .toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    } catch (_) {
      throw ParsingFailure(AppStrings.parsingError);
    }
  }
}
