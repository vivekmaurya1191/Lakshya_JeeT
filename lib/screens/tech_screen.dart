import 'package:flutter/material.dart';
import '../models/user_data.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  late TextEditingController flutterController;
  late TextEditingController dsaController;
  late TextEditingController techNotesController;

  @override
  void initState() {
    super.initState();

    flutterController = TextEditingController(
      text: UserData.box
          .get('flutterHours', defaultValue: 0)
          .toString(),
    );

    dsaController = TextEditingController(
      text: UserData.box
          .get('dsaHours', defaultValue: 0)
          .toString(),
    );

    techNotesController = TextEditingController(
      text: UserData.box
          .get('techNotes', defaultValue: ''),
    );
  }

  void saveTechData() {
    UserData.box.put(
      'flutterHours',
      double.tryParse(flutterController.text) ?? 0,
    );

    UserData.box.put(
      'dsaHours',
      double.tryParse(dsaController.text) ?? 0,
    );

    UserData.box.put(
      'techNotes',
      techNotesController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Tech Data Saved 💻"),
      ),
    );

    setState(() {});
  }

  @override
  void dispose() {
    flutterController.dispose();
    dsaController.dispose();
    techNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tech Hub"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: flutterController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Flutter Hours",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: dsaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "DSA Hours",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: techNotesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Tech Notes",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: saveTechData,
              child: const Text("Save"),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Tech Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "💙 Flutter: ${UserData.box.get('flutterHours', defaultValue: 0)} hrs",
                    ),

                    Text(
                      "🧠 DSA: ${UserData.box.get('dsaHours', defaultValue: 0)} hrs",
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