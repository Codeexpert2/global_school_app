import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_drawer.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/student/exam/pages/questions/success_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/quiz_page_provider.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsProvider);
    final currentIndex = ref.watch(currentQuestionIndexProvider);
    final currentQuestion = questions[currentIndex];
    final totalQuestions = questions.length;

    void goToNextQuestion() {
      if (currentIndex < totalQuestions - 1) {
        ref.read(currentQuestionIndexProvider.notifier).state++;
      } else {
        // عند الوصول للسؤال الأخير، التحقق من النجاح أو الرسوب
        final correctAnswers = ref
            .read(answersProvider.notifier)
            .calculateCorrectAnswers(questions);
        final passingScore = (totalQuestions * 0.7).ceil(); // النجاح 70%
        if (correctAnswers >= passingScore) {
          context.pushNamed(AppRoutes.studentSuccessquiz.name);
        } else {
          context.pushNamed(AppRoutes.studentFailurequiz.name);
        }
      }
    }

    void goToPreviousQuestion() {
      if (currentIndex > 0) {
        ref.read(currentQuestionIndexProvider.notifier).state--;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('الامتحان (${currentIndex + 1}/$totalQuestions)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProgressSection(ref, currentIndex, totalQuestions),
            const SizedBox(height: 16),
            if (currentQuestion.imageUrl != null)
              Center(
                child: Image.network(
                  currentQuestion.imageUrl!,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              currentQuestion.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...currentQuestion.options.map((option) {
              final selectedAnswer = ref.watch(answersProvider)[currentIndex];
              return ListTile(
                title: Text(option),
                leading: Radio<String>(
                  value: option,
                  groupValue: selectedAnswer,
                  onChanged: (value) {
                    ref
                        .read(answersProvider.notifier)
                        .saveAnswer(currentIndex, value!);
                  },
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: goToPreviousQuestion,
                  child: const Text('السؤال السابق'),
                ),
                ElevatedButton(
                  onPressed: goToNextQuestion,
                  child: currentIndex == totalQuestions - 1
                      ? const Text('إنهاء الامتحان')
                      : const Text('السؤال التالي'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgressSection(
      WidgetRef ref, int currentIndex, int totalQuestions) {
    final answers = ref.watch(answersProvider);
    final answeredCount =
        answers.values.where((answer) => answer != null).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('عدد الأسئلة: $totalQuestions',
            style: const TextStyle(fontSize: 16)),
        Text('تمت الإجابة: $answeredCount',
            style: const TextStyle(fontSize: 16, color: Colors.green)),
        Text('لم تتم الإجابة: ${totalQuestions - answeredCount}',
            style: const TextStyle(fontSize: 16, color: Colors.red)),
      ],
    );
  }
}
