import 'package:flutter/material.dart';

class SectionDetailsPage extends StatelessWidget {
  const SectionDetailsPage({
    super.key,
    required this.sectionId,
  });
  final String sectionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section ID: $sectionId'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('This is the section details page.'),
            // Add more details about the section here
            Text('Number of students: 123'),
            Text('Average grade: 90'),
            Text('Last updated: 2023-01-01'),
            Text('Course code: ABC123'),
            Text('Course name: Flutter Development'),
            Text('Instructor: Dr. John Doe')
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigate to the previous page
      //     Navigator.pop(context);
      //   },
      //   tooltip: 'Back',
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }
}
