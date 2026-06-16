import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: UserData.name);
  }

  void saveProfile() {
    UserData.name = nameController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Saved ✅"),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Level"),
                trailing: Text(
                  UserData.level.toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.bolt),
                title: const Text("XP"),
                trailing: Text(
                  UserData.xp.toString(),
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department),
                title: const Text("Streak"),
                trailing: Text(
                  UserData.streak.toString(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveProfile,
              child: const Text("Save Profile"),
            ),
          ],
        ),
      ),
    );
  }
}