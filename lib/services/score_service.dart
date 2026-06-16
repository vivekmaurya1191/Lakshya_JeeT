class ScoreService {
  static int calculateDailyScore({
    required double studyHours,
    required double codingHours,
    required int sleepScore,
  }) {
    int studyPoints =
    ((studyHours / 8) * 40).clamp(0, 40).toInt();

    int codingPoints =
    ((codingHours / 3) * 30).clamp(0, 30).toInt();

    int sleepPoints =
    ((sleepScore / 100) * 30).clamp(0, 30).toInt();

    return studyPoints +
        codingPoints +
        sleepPoints;
  }

  static String getScoreStatus(int score) {
    if (score >= 80) {
      return "🟢 Excellent";
    }

    if (score >= 50) {
      return "🟡 Average";
    }

    return "🔴 Need Improvement";
  }
}