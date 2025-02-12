import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/features/student/exam/provider/exam_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ExamDetailsPage extends ConsumerWidget {
  const ExamDetailsPage({super.key, required this.examId});
  final String examId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examdetails = ref.watch(examDetailsProvider(examId));

    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).examDetails,
      ),
      body: examdetails.when(
        data: (exam) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailCard(Icons.book, 'Course', exam.topic ?? 'غير متوفر'),
              const SizedBox(height: 8),
              _buildDetailCard(
                  Icons.date_range,
                  'Date',
                  exam.date != null
                      ? DateFormat('yyyy-MM-dd').format(exam.date!)
                      : 'غير متوفر'),
              const SizedBox(height: 8),
              _buildDetailCard(Icons.access_time, 'Time',
                  '${exam.startTime} - ${exam.endTime}'),
              const SizedBox(height: 8),
              _buildDetailCard(
                  Icons.grade, 'Mark', exam.mark?.toString() ?? 'غير متوفر'),
              const SizedBox(height: 8),
              _buildDetailCard(
                  Icons.school, 'Semester', exam.semester ?? 'غير متوفر'),
              if (exam.video != null)
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: _buildVideoButton(),
                ),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
          ),
        ),
        error: (error, stack) => Center(
          child: Text(
            'حدث خطأ: $error',
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, AppColors.green1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.deepPurple.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.deepPurple)),
                    const SizedBox(height: 4),
                    Text(value,
                        style: TextStyle(
                            fontSize: 14, color: Colors.deepPurple.shade700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.play_circle_fill, size: 28),
        label: const Text('مشاهدة الفيديو', style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green2,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          shadowColor: Colors.deepPurple.withOpacity(0.3),
        ),
      ),
    );
  }
}
