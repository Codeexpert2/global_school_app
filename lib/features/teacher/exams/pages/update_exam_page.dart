import 'package:flutter/material.dart';

class UpdateExamPage extends StatelessWidget {
  const UpdateExamPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Exam'),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              Text('Update Exam Page for Exam ID: $id'),
              const TextField(
                decoration: InputDecoration(labelText: 'New Exam Name'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'New Exam Description'),
                maxLength: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Update the exam using the provided id
                  // Example: FirebaseFirestore.instance.collection('exams').document(id).updateData({
                  //   'name': _nameController.text,
                  //   'description': _descriptionController.text,
                  // });
                  // Navigator.pop(context);
                },
                child: const Text('Update Exam'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
