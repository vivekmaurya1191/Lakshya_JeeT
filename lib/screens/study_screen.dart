import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/score_service.dart';
import 'dart:core';
class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  late TextEditingController studyController;
  late TextEditingController codingController;
  late TextEditingController notesController;
  void showAchievementPopup(
      String title,
      String description,
      ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(
                Icons.emoji_events,
                size: 60,
                color: Colors.amber,
              ),
              SizedBox(height: 10),
              Text("Achievement Unlocked!"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Awesome! 🚀"),
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();

    studyController = TextEditingController(
      text: UserData.studyHours == 0
          ? ''
          : UserData.studyHours.toString(),
    );

    codingController = TextEditingController(
      text: UserData.codingHours == 0
          ? ''
          : UserData.codingHours.toString(),
    );

    notesController = TextEditingController(
      text: UserData.notes,
    );
  }

  void saveData() {
    setState(() {
      UserData.studyHours =
          double.tryParse(studyController.text) ?? 0;

      UserData.codingHours =
          double.tryParse(codingController.text) ?? 0;

      UserData.notes = notesController.text;

      UserData.xp =
          (UserData.studyHours * 20).toInt() +
              (UserData.codingHours * 30).toInt();
      UserData.dailyScore =
          ScoreService.calculateDailyScore(
            studyHours: UserData.studyHours,
            codingHours: UserData.codingHours,
            sleepScore: UserData.sleepScore,
          );
      String today =
      DateTime.now().toString().substring(0, 10);

      if (UserData.lastSaveDate != today) {
        UserData.streak++;

        UserData.lastSaveDate = today;
      }
      if (UserData.studyHours > 0 ||
          UserData.codingHours > 0) {
        UserData.firstSaveAchievement = true;
      }

      if (!UserData.studyMasterAchievement &&
          UserData.studyHours >= 5) {

        UserData.studyMasterAchievement = true;

        Future.delayed(
          const Duration(milliseconds: 300),
              () {
            showAchievementPopup(
              "🏆 Study Master",
              "Completed 5+ study hours in a day!",
            );
          },
        );
      }

      if (UserData.xp >= 100) {
        UserData.xp100Achievement = true;
      }
      if (UserData.xp >= 500) {
        UserData.level = 4;
      } else if (UserData.xp >= 250) {
        UserData.level = 3;
      } else if (UserData.xp >= 100) {
        UserData.level = 2;
      } else {
        UserData.level = 1;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Study Data Saved ✅"),
      ),
    );
  }

  @override
  void dispose() {
    studyController.dispose();
    codingController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: studyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Study Hours",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: codingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Coding Hours",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Notes",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: saveData,
              child: const Text("Save"),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Current Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("📚 Study Hours: ${UserData.studyHours}"),
                    Text("💻 Coding Hours: ${UserData.codingHours}"),
                    Text("⚡ XP: ${UserData.xp}"),
                    Text("⭐ Level: ${UserData.level}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}