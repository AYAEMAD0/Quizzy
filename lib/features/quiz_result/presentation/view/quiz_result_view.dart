import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzy/core/constants/app_asset.dart';
import 'package:quizzy/core/constants/app_strings.dart';
import 'package:quizzy/features/quiz_result/presentation/widget/button_result_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../data/repo_impl/quiz_result_repository_impl.dart';
import '../cubit/quiz_result_cubit.dart';

class QuizResultView extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultView({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          QuizResultCubit(QuizResultRepositoryImpl())
            ..loadResult(score, totalQuestions),
      child: Scaffold(
        body: BlocBuilder<QuizResultCubit, QuizResultState>(
          builder: (context, state) {
            if (state.loading || state.result == null) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.colorWhite),
              );
            }

            final result = state.result!;
            final isHappy = result.score >= (result.totalQuestions / 2).round();

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    isHappy ? AppAsset.happyBoy : AppAsset.sadBoy,
                    width: 200.w,
                    height: 250.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "${result.playerName} , ${AppStrings.score}",
                    style: TextStyles.font26NaturalBold,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "${result.score}/${result.totalQuestions}",
                    style: isHappy
                        ? TextStyles.font30GreenBold
                        : TextStyles.font30GreenBold.copyWith(
                            color: AppColors.incorrect,
                          ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "${AppStrings.correctAnswers} : ${result.score}",
                    style: TextStyles.font25GreenBold,
                  ),
                  Text(
                    "${AppStrings.wrongAnswers} :  ${result.wrongAnswers}",
                    style: TextStyles.font25GreenBold.copyWith(
                      color: AppColors.incorrect,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonResultWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
