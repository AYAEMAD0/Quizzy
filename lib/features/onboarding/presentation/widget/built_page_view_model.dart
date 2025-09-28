import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/theme/app_styles.dart';

class BuiltPageViewModel {
  static PageViewModel build({
    required String imagePage,
    required String titlePage,
    required String descPage,
  }) {
    return PageViewModel(
      image: Image.asset(imagePage),
      titleWidget: Text(
        titlePage,
        textAlign: TextAlign.center,
        style: TextStyles.font28WhiteExtraBold,
      ),
      bodyWidget: Text(
        descPage,
        style: TextStyles.font14WhiteSemiBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
