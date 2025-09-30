abstract class QuizResultRepository {
  Future<String?> getPlayerName();

  Future<void> clearPlayerName();
}
