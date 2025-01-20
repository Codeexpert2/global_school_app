
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/question_model.dart';

// قائمة الأسئلة
final questionsProvider = Provider<List<Question>>((ref) {
  return [
    Question(
      text: 'ما هي عاصمة فرنسا؟',
      options: ['باريس', 'لندن', 'روما', 'مدريد'],
      correctAnswer: 'باريس',
      isMultipleChoice: true,
    ),
    Question(
      imageUrl: 'https://example.com/image.png',
      text: 'هل الصورة تحتوي على قطة؟',
      options: ['صح', 'خطأ'],
      correctAnswer: 'صح',
      isMultipleChoice: false,
    ),
    Question(
      text: 'ما هي عاصمة فرنسا؟',
      options: ['باريس', 'لندن', 'روما', 'مدريد'],
      correctAnswer: 'باريس',
      isMultipleChoice: true,
    ),
    Question(
      imageUrl: 'https://example.com/image.png',
      text: 'هل الصورة تحتوي على قطة؟',
      options: ['صح', 'خطأ'],
      correctAnswer: 'صح',
      isMultipleChoice: false,
    ),
    Question(
      text: 'ما هي عاصمة فرنسا؟',
      options: ['باريس', 'لندن', 'روما', 'مدريد'],
      correctAnswer: 'باريس',
      isMultipleChoice: true,
    ),
    Question(
      imageUrl: 'https://example.com/image.png',
      text: 'هل الصورة تحتوي على قطة؟',
      options: ['صح', 'خطأ'],
      correctAnswer: 'صح',
      isMultipleChoice: false,
    ),
  ];
});

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);
final answersProvider = StateNotifierProvider<AnswersNotifier, Map<int, String?>>((ref) {
  return AnswersNotifier();
});

class AnswersNotifier extends StateNotifier<Map<int, String?>> {
  AnswersNotifier() : super({});

  void saveAnswer(int questionIndex, String answer) {
    state = {
      ...state,
      questionIndex: answer,
    };
  }

  String? getAnswer(int questionIndex) {
    return state[questionIndex];
  }
}
