import 'package:finlit/pages/pause.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as icon;
import '../components/misc/question.dart';

class QuizPage extends StatefulWidget {
    const QuizPage({Key? key}) : super(key: key);

    @override
    State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
    int currentQuestion = 0;

    void _nextQuestion() {
        setState(() {
            if (currentQuestion < questions.length - 1) {
                currentQuestion++;
            } else {
                // Optionally show a dialog or navigate to a results page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quiz finished!')),
                );
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        final question = questions[currentQuestion];

        return Scaffold(
            appBar: AppBar(
                title: const Text('Quiz'),
                actions: [
                  IconButton(
                    onPressed: PauseMenu.new,
                    icon: icon.Icon(Icons.pause),
                  ),
                ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Text(
                            question.text,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        ...question.displayToButtons(_nextQuestion),
                    ],
                ),
            ),
        );
    }
}