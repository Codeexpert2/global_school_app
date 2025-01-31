import 'package:flutter/material.dart';

class NewExamPage extends StatelessWidget {
  const NewExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Exam'),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              const Text('This is the New Exam Page'),
              const Text('Please fill in the following details'),
              const TextField(
                decoration: InputDecoration(labelText: 'Exam Name'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Duration (in minutes)'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Exam Creation Page
                },
                child: const Text('Create Exam'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Exam Creation Page
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
