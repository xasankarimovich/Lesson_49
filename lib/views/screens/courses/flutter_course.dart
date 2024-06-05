import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlutterInfo extends StatefulWidget {
  const FlutterInfo({super.key, required ValueChanged<bool> onThemeChanged, required ValueChanged<String> onImageChanged});

  @override
  State<FlutterInfo> createState() => _FlutterInfoState();
}

class _FlutterInfoState extends State<FlutterInfo> {
  late VideoPlayerController _controller;
  bool _showQuiz = false;
  int _currentQuestion = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _quizQuestions = [
    {
      'question': 'What is the name of the framework shown in the image?',
      'options': ['Flutter', 'React Native', 'Android Studio', 'iOS'],
      'answer': 0,
    },
    {
      'question': 'What is the purpose of the Flutter framework?',
      'options': [
        'Building mobile apps',
        'Creating websites',
        'Developing desktop applications',
        'All of the above'
      ],
      'answer': 0,
    },
    {
      'question': 'What is the programming language used in Flutter?',
      'options': ['Java', 'Swift', 'Kotlin', 'Dart'],
      'answer': 3,
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onLesson1Pressed() {}

  void _onLesson2Pressed() {
    // Video player logic
  }

  void _onQuizStart() {
    setState(() {
      _showQuiz = true;
    });
  }

  void _onQuizAnswer(int selectedOption) {
    if (_quizQuestions[_currentQuestion]['answer'] == selectedOption) {
      _score++;
    }

    if (_currentQuestion < _quizQuestions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score: $_score/${_quizQuestions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _showQuiz = false;
                  _currentQuestion = 0;
                  _score = 0;
                });
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Info'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image, text, and lesson buttons
          if (_showQuiz)
            Expanded(
              child: Column(
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
              ),
            )
          else
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _onQuizStart,
                  child: const Text('Start Quiz'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}