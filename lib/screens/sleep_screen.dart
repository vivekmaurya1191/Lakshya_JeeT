import 'package:flutter/material.dart';
import '../models/user_data.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  late TextEditingController sleepController;
  late TextEditingController wakeController;

  @override
  void initState() {
    super.initState();

    sleepController =
        TextEditingController(text: UserData.sleepTime);

    wakeController =
        TextEditingController(text: UserData.wakeTime);
  }

  void saveSleepData() {
    UserData.sleepTime = sleepController.text;
    UserData.wakeTime = wakeController.text;

    UserData.sleepScore = 80;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Sleep Data Saved 😴"),
      ),
    );

    setState(() {});
  }

  @override
  void dispose() {
    sleepController.dispose();
    wakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sleep Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: sleepController,
              decoration: const InputDecoration(
                labelText: "Sleep Time (Example: 10:30 PM)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: wakeController,
              decoration: const InputDecoration(
                labelText: "Wake Time (Example: 5:30 AM)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: saveSleepData,
              child: const Text("Save Sleep Data"),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Sleep Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "😴 Sleep Time: ${UserData.sleepTime}",
                    ),

                    Text(
                      "🌅 Wake Time: ${UserData.wakeTime}",
                    ),

                    Text(
                      "⭐ Sleep Score: ${UserData.sleepScore}",
                    ),
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