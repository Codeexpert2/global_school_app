class Question {
  Question({
    this.imageUrl,
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.isMultipleChoice,
  });
  final String? imageUrl;
  final String text;
  final List<String> options;
  final String correctAnswer;
  final bool isMultipleChoice;
}
