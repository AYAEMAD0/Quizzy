import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.numOfQuestion,
    required this.currentOfQuestion,
    required this.timeLeft,
  });

  final int numOfQuestion;
  final int currentOfQuestion;
  final int timeLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${AppStrings.question} $currentOfQuestion/$numOfQuestion",
          style: TextStyles.font18NaturalBold,
        ),
        Text(
          "${AppStrings.time} $timeLeft ${AppStrings.sec}",
          style: timeLeft < 4
              ? TextStyles.font18NaturalBold.copyWith(
                  color: AppColors.incorrect,
                )
              : TextStyles.font18NaturalBold.copyWith(color: AppColors.natural),
        ),
      ],
    );
  }
}
