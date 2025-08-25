import 'package:finlit/components/misc/questionslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  var questionIndex = 0.obs;
  var answered = false.obs;
  var isCorrect = false.obs;
  var selectedIndex = (-1).obs;
  var score = 0.obs;
  var totaltime = 0.obs;
  var timeleft = 30.obs;

  final questions = quizQuestions.map((q) => {
        "question": q.qtext,
        "image": q.qattachment,
        "options": q.qchoices,
        "correctIndex": q.correctIndex,
        "explanation": "This is a detailed explanation for the question.",
      }).toList();

  void checkAnswer(int index) {
    final correctIndex = questions[questionIndex.value]["correctIndex"] as int;
    selectedIndex.value = index;
    answered.value = true;
    isCorrect.value = index == correctIndex;

    if (isCorrect.value) {
      score.value++;
    }
  }

  void nextQuestion() {
    answered.value = false;
    isCorrect.value = false;
    selectedIndex.value = -1;

    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
    } else {
      _showQuizComplete();
    }
  }

  void resetQuiz() {
    questionIndex.value = 0;
    answered.value = false;
    isCorrect.value = false;
    selectedIndex.value = -1;
    score.value = 0;
  }

  void endQuiz() {
    // Implementation for ending the quiz
     Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF2C1346),
        title: const Text('End Quiz', style: TextStyle(color: Colors.white)),
        content: Text(
          'Are you sure you want to end the quiz?\nYour current score: ${score.value}/${questionIndex.value + (answered.value ? 1 : 0)}',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              resetQuiz();
            },
            child: const Text('End Quiz', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showQuizComplete() {
    // Implementation for showing quiz completion
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF2C1346),
        title: const Text('Quiz Complete!', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              score.value >= questions.length * 0.7 ? Icons.emoji_events : Icons.thumb_up,
              size: 50,
              color: score.value >= questions.length * 0.7 ? Colors.amber : Colors.blue,
            ),
            const SizedBox(height: 16),
            Text(
              'Final Score: ${score.value}/${questions.length}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${((score.value / questions.length) * 100).toStringAsFixed(1)}%',
              style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              resetQuiz();
            },
            child: const Text('Restart Quiz', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}