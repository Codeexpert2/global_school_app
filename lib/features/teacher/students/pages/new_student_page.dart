import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewStudentPage extends StatelessWidget {
  const NewStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Student'),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Student Name',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Student ID',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Student Email',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
