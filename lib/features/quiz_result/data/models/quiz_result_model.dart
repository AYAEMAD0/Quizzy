class QuizResultModel {
  final String playerName;
  final int score;
  final int totalQuestions;

  QuizResultModel({
    required this.playerName,
    required this.score,
    required this.totalQuestions,
  });

  int get wrongAnswers => totalQuestions - score;
}
