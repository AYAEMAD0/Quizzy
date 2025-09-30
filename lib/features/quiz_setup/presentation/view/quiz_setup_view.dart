import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy/core/constants/app_strings.dart';
import 'package:quizzy/features/quiz_setup/presentation/constants/quiz_setup_constants.dart';
import 'package:quizzy/features/quiz_setup/presentation/cubit/quiz_setup_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/quiz_setup_model.dart';
import '../widget/custom_drop_down.dart';
import '../widget/custom_snackbar.dart';

class QuizSetupView extends StatelessWidget {
  const QuizSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizSetupCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: BlocBuilder<QuizSetupCubit, QuizSetupState>(
              builder: (context, state) {
                final cubit = context.read<QuizSetupCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.setupQuiz,
                      style: TextStyles.font28WhiteBlueBold,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),

                    // Category
                    CustomDropDown(
                      text: AppStrings.selectCategory,
                      value: state.selectedCategory,
                      items: QuizSetupConstants.categories.entries
                          .map((e) =>
                          DropdownMenuItem(value: e.key, child: Text(e.value)))
                          .toList(),
                      onchange: (val) => cubit.setCategory(val??18),
                    ),

                    SizedBox(height: 30.h),

                    // Difficulty
                    CustomDropDown(
                      text: AppStrings.selectDifficulty,
                      value: state.selectedDifficulty,
                      items: QuizSetupConstants.difficulties
                          .map((d) =>
                          DropdownMenuItem(value: d, child: Text(d)))
                          .toList(),
                      onchange: (val) =>
                          cubit.setDifficulty(val ?? QuizSetupConstants.difficulties[0]),
                    ),

                    SizedBox(height: 30.h),

                    // Number of Questions
                    CustomDropDown(
                      text: AppStrings.selectNumberOfQuestions,
                      value: state.questionCount,
                      items: [5, 10, 15, 20]
                          .map((e) =>
                          DropdownMenuItem(value: e, child: Text("$e")))
                          .toList(),
                      onchange: (val) => cubit.setQuestionCount(val ?? 10),
                    ),

                    const Spacer(flex: 2),

                    // Start Button
                    CustomButton(
                      text: AppStrings.startQuiz,
                      onPressed: () {
                        final setup = cubit.getSetup();
                        if (setup != null) {
                          final settings = QuizSetupModel(
                            numberOfQuestions: setup.numberOfQuestions,
                            category: setup.category,
                            difficulty: setup.difficulty,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.quizPlayRouteName,
                            arguments: settings,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.transparent,
                              content: CustomSnackBar(),
                            ),
                          );
                        }
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
