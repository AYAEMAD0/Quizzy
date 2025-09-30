import 'package:flutter/material.dart';
import 'package:quizzy/features/auth/presentation/view/login_view.dart';
import 'package:quizzy/features/quiz_play/presentation/view/quiz_play_view.dart';
import 'package:quizzy/features/quiz_setup/presentation/view/quiz_setup_view.dart';

import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/quiz_setup/data/models/quiz_setup_model.dart';
import 'routes.dart';

class AppRouter {
   Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRouteName:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRouteName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.quizSetupRouteName:
        return MaterialPageRoute(builder: (_) => QuizSetupView());
      case Routes.quizPlayRouteName:
        final args = settings.arguments as QuizSetupModel;
        return MaterialPageRoute(
          builder: (_) => QuizPlayView(settings: args),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
