import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/controllers/question_controller.dart'; // Import your QuizController

class QuizResult extends StatelessWidget {
  final QuizController controller;

  const QuizResult({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final current = controller.questions[controller.questionIndex.value];

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Result Icon
          // Result Text
          // Correct Answer Display
          // Explanation
          // Score Display
          // Next Question Button
               // Result Icon
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: controller.isCorrect.value 
                  ? Colors.green.withOpacity(0.2) 
                  : Colors.red.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: controller.isCorrect.value ? Colors.green : Colors.red,
                width: 3,
              ),
            ),
            child: Icon(
              controller.isCorrect.value ? Icons.check : Icons.close,
              size: 60,
              color: controller.isCorrect.value ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 24),
          
          // Result Text
          Text(
            controller.isCorrect.value ? "Correct answer" : "Incorrect answer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: controller.isCorrect.value ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          
          // Correct Answer Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Option ${String.fromCharCode((current["correctIndex"] as int) + 65)}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Explanation
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explanation",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  current["explanation"] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          
          // Score Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue.withOpacity(0.5)),
            ),
            child: Text(
              'Score: ${controller.score.value}/${controller.questionIndex.value + 1}',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 30),
          
          // Next Question Button
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.nextQuestion,
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: Text(
                controller.questionIndex.value < controller.questions.length - 1
                    ? 'Next Question'
                    : 'Finish Quiz',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
    });
  }
}