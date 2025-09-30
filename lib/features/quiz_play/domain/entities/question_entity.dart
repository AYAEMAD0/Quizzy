class QuestionEntity {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  QuestionEntity({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
