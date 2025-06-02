import 'package:flutter/material.dart';
import 'package:task/view/profilescreen.dart';
import '../../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Welcome to Flutter Internship",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (_) => const Center(child: CircularProgressIndicator()),
                );

                await Future.delayed(const Duration(seconds: 2));
                Navigator.pop(context);

                User user = User(
                  name: "Alenta",
                  email: "alenta@example.com",
                  phoneNumber: "9876543210",
                  imageUrl: "https://i.pravatar.cc/150?img=3",
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen(user: user)),
                );
              },
              child: const Text("View Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
