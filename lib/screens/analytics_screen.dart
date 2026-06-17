import 'package:flutter/material.dart';
import '../models/user_data.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Study Hours"),
                trailing: Text(
                  "${UserData.studyHours}",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.code),
                title: const Text("Coding Hours"),
                trailing: Text(
                  "${UserData.codingHours}",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.bolt),
                title: const Text("XP"),
                trailing: Text(
                  "${UserData.xp}",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Level"),
                trailing: Text(
                  "${UserData.level}",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department),
                title: const Text("Streak"),
                trailing: Text(
                  "${UserData.streak}",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.score),
                title: const Text("Daily Score"),
                trailing: Text(
                  "${UserData.dailyScore}/100",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}