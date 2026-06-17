import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/score_service.dart';
import 'analytics_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning 👋";
    } else if (hour < 17) {
      return "Good Afternoon ☀️";
    } else if (hour < 21) {
      return "Good Evening 🌇";
    } else {
      return "Good Night 🌙";
    }
  }
  String getQuote() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Start strong today 🚀";
    } else if (hour < 17) {
      return "Keep pushing forward 💪";
    } else if (hour < 21) {
      return "Finish what you started 🔥";
    } else {
      return "Rest and recharge 🌙";
    }
  }
  String getLevelName(int level) {
    switch (level) {
      case 1:
        return "Beginner";
      case 2:
        return "Learner";
      case 3:
        return "Builder";
      case 4:
        return "Achiever";
      default:
        return "Legend";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text(
          "🚀 Lakshya Jeet",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Chip(
              label: Text(
                "🔥 ${UserData.streak}",
              ),
            ),
          ),
        ],
        elevation: 0,

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.deepPurple.withValues(alpha: 0.2),
            height: 1,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1E293B),
                  Color(0xFF334155),
                ],
              ),

              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withAlpha(80),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreeting(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  UserData.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  "Level ${UserData.level} • ${UserData.xp} XP",
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  getQuote(),
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _infoCard(
                  icon: Icons.bolt,
                  title: "XP",
                  value: "${UserData.xp}",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _infoCard(
                  icon: Icons.star,
                  title: "Level",
                  value: getLevelName(UserData.level),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "XP Progress (${UserData.xp}/${UserData.level == 1 ? 100 : UserData.level == 2 ? 250 : UserData.level == 3 ? 500 : 1000})",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: (UserData.xp / 500).clamp(0.0, 1.0),
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: (
                        UserData.xp /
                            (UserData.level == 1
                                ? 100
                                : UserData.level == 2
                                ? 250
                                : UserData.level == 3
                                ? 500
                                : 1000)
                    ).clamp(0.0, 1.0),
                    minHeight: 10,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _infoCard(
                  icon: Icons.local_fire_department,
                  title: "Streak",
                  value: "${UserData.streak} Days",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _infoCard(
                  icon: Icons.bedtime,
                  title: "Sleep",
                  value: "${UserData.sleepScore}/100",
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "🎯 Today's Score",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${UserData.dailyScore}/100",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: UserData.dailyScore >= 80
                          ? Colors.green
                          : UserData.dailyScore >= 50
                          ? Colors.orange
                          : Colors.red,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    ScoreService.getScoreStatus(
                      UserData.dailyScore,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "🎯 Daily Goals",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "📚 Study: ${UserData.studyHours}/${UserData.studyGoal} hrs",
                  ),

                  const SizedBox(height: 8),

                  LinearProgressIndicator(
                    value: (UserData.studyHours /
                        UserData.studyGoal)
                        .clamp(0.0, 1.0),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    "💻 Coding: ${UserData.codingHours}/${UserData.codingGoal} hrs",
                  ),

                  const SizedBox(height: 8),

                  LinearProgressIndicator(
                    value: (UserData.codingHours /
                        UserData.codingGoal)
                        .clamp(0.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Today's Progress",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("📚 Study Hours"),
                      Text("${UserData.studyHours}"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: (UserData.studyHours / 8)
                        .clamp(0.0, 1.0),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("💻 Coding Hours"),
                      Text("${UserData.codingHours}"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: (UserData.codingHours / 4)
                        .clamp(0.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "🏆 Achievements",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (UserData.firstSaveAchievement)
                    const Chip(
                      avatar: Icon(Icons.emoji_events),
                      label: Text("First Save"),
                    ),

                  if (UserData.studyMasterAchievement)
                    const Chip(
                      avatar: Icon(Icons.school),
                      label: Text("Study Master"),
                    ),

                  if (UserData.xp100Achievement)
                    const Chip(
                      avatar: Icon(Icons.bolt),
                      label: Text("100 XP Club"),
                    ),

                  if (!UserData.firstSaveAchievement &&
                      !UserData.studyMasterAchievement &&
                      !UserData.xp100Achievement)
                    const Text(
                      "No achievements unlocked yet",
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Notes",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                UserData.notes.isEmpty
                    ? "No notes added yet."
                    : UserData.notes,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: icon == Icons.bolt
                  ? Colors.amber
                  : icon == Icons.star
                  ? Colors.purple
                  : icon == Icons.local_fire_department
                  ? Colors.orange
                  : icon == Icons.bedtime
                  ? Colors.indigo
                  : Colors.blue,
            ),
            const SizedBox(height: 8),
            Text(title),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}