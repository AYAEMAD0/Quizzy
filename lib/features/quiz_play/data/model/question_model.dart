import '../../domain/entities/question_entity.dart';

class QuestionModel {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    final allAnswers = List<String>.from(json['incorrect_answers']);
    allAnswers.add(json['correct_answer']);
    allAnswers.shuffle();
    return QuestionModel(
      question: json['question'],
      answers: allAnswers,
      correctAnswer: json['correct_answer'],
    );
  }

  QuestionEntity toEntity() => QuestionEntity(
    question: question,
    answers: answers,
    correctAnswer: correctAnswer,
  );
}
