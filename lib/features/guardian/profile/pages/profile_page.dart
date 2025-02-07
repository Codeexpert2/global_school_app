import 'package:flutter/material.dart';
import 'package:global_school/core/constants/images.dart';

class GuardianProfilePage extends StatelessWidget {
  const GuardianProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardian Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              AppImages.imagesProfilePlaceholder,
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            const Text('John Doe'),
            const Text('Age: 35'),
            const Text('Address: 123 Main St, Anytown, USA'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Guardian's Schedule page
        },
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}
