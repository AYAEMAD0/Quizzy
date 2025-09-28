import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../widget/built_page_view_model.dart';

class OnboardingPages {
  static List<PageViewModel> pages = [
    BuiltPageViewModel.build(
      imagePage: AppAsset.onBoardingOne,
      titlePage: AppStrings.onboarding1Title,
      descPage: AppStrings.onboarding1Desc,
    ),
    BuiltPageViewModel.build(
      imagePage: AppAsset.onBoardingTwo,
      titlePage: AppStrings.onboarding2Title,
      descPage: AppStrings.onboarding2Desc,
    ),
    BuiltPageViewModel.build(
      imagePage: AppAsset.onBoardingThree,
      titlePage: AppStrings.onboarding3Title,
      descPage: AppStrings.onboarding3Desc,
    ),
  ];
}
