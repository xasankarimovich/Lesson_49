import 'package:flutter/material.dart';

import '../widgets/quiz_widget.dart';
import '../widgets/vedio_player.dart';
class FlutterInfo extends StatefulWidget {
  const FlutterInfo({super.key});

  @override
  State<FlutterInfo> createState() => _FlutterInfoState();
}

class _FlutterInfoState extends State<FlutterInfo> {
  bool _showQuiz = false;

  void _onQuizStart() {
    setState(() {
      _showQuiz = true;
    });
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
          const VideoPlayerWidget(),
          if (_showQuiz)
            const Expanded(
              child: QuizWidget(),
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