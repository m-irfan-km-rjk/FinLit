import 'package:finlit/components/misc/questionslist.dart';
import 'package:flutter/material.dart';

class FinLitApp extends StatelessWidget {
  const FinLitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinLit Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionIndex = 0;
  bool answered = false;
  bool isCorrect = false;

  // Dummy data
  final questions = quizQuestions.map((q) => {
        "question": q.qtext,
        "image": q.qattachment ?? "",
        "options": q.qchoices,
        "correctIndex": q.correctIndex,
        "explanation": "This is a dummy explanation for the question.",
      }).toList();

  void checkAnswer(int index) {
    final correctIndex = questions[questionIndex]["correctIndex"] as int;
    setState(() {
      answered = true;
      isCorrect = index == correctIndex;
    });
  }

  void nextQuestion() {
    setState(() {
      answered = false;
      isCorrect = false;
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        questionIndex = 0; // restart
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[questionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF2C1346),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: answered
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      size: 80,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      isCorrect ? "Correct answer" : "Incorrect answer",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Option ${String.fromCharCode((current["correctIndex"] as int) + 65)}",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Explanation:\n${current["explanation"]}",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: nextQuestion,
                      child: const Text("Next Question"),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(current["image"] as String, height: 150),
                    const SizedBox(height: 20),
                    Text(
                      current["question"] as String,
                      style: const TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ...(current["options"] as List<String>)
                        .asMap()
                        .entries
                        .map((entry) {
                      int idx = entry.key;
                      String text = entry.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: idx == 0
                                  ? Colors.lightBlue
                                  : Colors.purpleAccent),
                          onPressed: () => checkAnswer(idx),
                          child: Text("Option ${String.fromCharCode(65 + idx)}: $text"),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {},
                      child: const Text("End Quiz"),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}