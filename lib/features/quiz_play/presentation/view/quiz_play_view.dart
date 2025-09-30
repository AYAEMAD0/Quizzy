import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizzy/core/constants/app_strings.dart';
import 'package:quizzy/core/routing/routes.dart';
import 'package:quizzy/features/quiz_play/presentation/widget/answer_widget.dart';
import 'package:quizzy/features/quiz_play/presentation/widget/progress_bar.dart';
import 'package:quizzy/features/quiz_play/presentation/widget/question_widget.dart';
import 'package:quizzy/features/quiz_play/presentation/widget/time_widget.dart';

import '../../../../core/networking/api_client.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../quiz_setup/data/models/quiz_setup_model.dart';
import '../../data/data_sources/remote_data_source.dart';
import '../../data/repo_impl/quiz_repository_impl.dart';
import '../../domain/usecase/fetch_questions_usecase.dart';
import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';

class QuizPlayView extends StatelessWidget {
  final QuizSetupModel settings;

  const QuizPlayView({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    final unescape = HtmlUnescape();

    return BlocProvider(
      create: (_) => QuizCubit(
        FetchQuestionsUseCase(
          QuizRepositoryImpl(RemoteDataSourceImpl(ApiClient())),
        ),
      )..fetchQuestions(settings),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.quiz, style: TextStyles.font24NaturalBold),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.colorWhite),
              );
            }
            if (state.error != null) {
              return Center(
                child: Text(state.error!, style: TextStyles.font24RedExtraBold),
              );
            }
            if (state.completed) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.quizResultRouteName,
                  arguments: {
                    'score': state.score,
                    'totalQuestions': state.questions.length,
                  },
                );
              });
              return const SizedBox.shrink();
            }
            final progress = (state.currentIndex + 1) / state.questions.length;
            final q = state.current!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimeWidget(
                    numOfQuestion: state.questions.length,
                    currentOfQuestion: state.currentIndex + 1,
                    timeLeft: state.timeLeft,
                  ),
                  SizedBox(height: 30.h),
                  ProgressBar(progress: progress),
                  SizedBox(height: 30.h),
                  QuestionWidget(text: unescape.convert(q.question)),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView(
                      children: q.answers.map((answer) {
                        final decodedAnswer = unescape.convert(answer);
                        final decodedCorrect = unescape.convert(
                          q.correctAnswer,
                        );
                        final isSelected =
                            state.selectedAnswer == decodedAnswer;
                        final isCorrect = decodedAnswer == decodedCorrect;
                        Color color = AppColors.natural;
                        if (state.selectedAnswer != null) {
                          if (isCorrect) {
                            color = AppColors.correct;
                          } else if (isSelected) {
                            color = AppColors.incorrect;
                          }
                        }
                        return AnswerWidget(
                          color: color,
                          onTap: () => context.read<QuizCubit>().selectAnswer(
                            decodedAnswer,
                          ),
                          decodedAnswer: decodedAnswer,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
