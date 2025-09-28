class QuizSetupModel {
  final int numberOfQuestions;
  final int category;
  final String difficulty;

  QuizSetupModel({
    required this.numberOfQuestions,
    required this.category,
    required this.difficulty,
  });

  Map<String, dynamic> toJson() {
    return {
      "amount": numberOfQuestions,
      "category": category,
      "difficulty": difficulty,
    };
  }

  factory QuizSetupModel.fromJson(Map<String, dynamic> json) {
    return QuizSetupModel(
      numberOfQuestions: json["amount"],
      category: json["category"],
      difficulty: json["difficulty"],
    );
  }
}
