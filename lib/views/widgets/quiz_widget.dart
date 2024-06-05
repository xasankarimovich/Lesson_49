import 'package:flutter/material.dart';
class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int _currentQuestion = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _quizQuestions = [
    // Your quiz questions data
  ];

  void _onQuizAnswer(int selectedOption) {
    // Quiz answer logic
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _quizQuestions[_currentQuestion]['question'],
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...List.generate(
          _quizQuestions[_currentQuestion]['options'].length,
              (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () => _onQuizAnswer(index),
              child: Text(
                _quizQuestions[_currentQuestion]['options'][index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}