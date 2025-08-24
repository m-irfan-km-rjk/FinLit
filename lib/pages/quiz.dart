import 'package:finlit/components/themes/ficon_extension.dart';
import 'package:finlit/components/ui/icon_round.dart';
import 'package:finlit/main.dart';
import 'package:finlit/pages/pause.dart';
import 'package:finlit/pages/quizresult.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/controllers/question_controller.dart'; // Import your QuizController

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());

    return Scaffold(
      backgroundColor: const Color(0xFF2C1346),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(controller),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() => controller.answered.value
                    ? QuizResult(controller: controller)
                    : _buildQuestionScreen(controller)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(QuizController controller) {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.quiz, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'FinLit',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(icon: Icon(Icons.pause_circle_rounded),onPressed: (){Get.to(PausePage());}),
        ],
      ),
    ));
  }

  Widget _buildQuestionScreen(QuizController controller) {
    return Obx(() {
      final current = controller.questions[controller.questionIndex.value];

      return Column(
        children: [
          // Progress indicator
          // Question number
          // Image if available
          // Question text
          // Options
          // End Quiz Button
          // Progress indicator
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (controller.questionIndex.value + 1) / controller.questions.length,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          
          // Question number
          Text(
            'Question ${controller.questionIndex.value + 1}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          
          // Image if available
          if (current["image"] != null && (current["image"] as String).isNotEmpty)
            Container(
              height: 180,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  current["image"] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.white54,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          
          // Question text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Text(
              current["question"] as String,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          
          // Options
          Expanded(
            child: ListView.builder(
              itemCount: (current["options"] as List<String>).length,
              itemBuilder: (context, index) {
                final option = (current["options"] as List<String>)[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildOptionButton(
                    option: option,
                    optionLetter: String.fromCharCode(65 + index),
                    index: index,
                    onTap: () => controller.checkAnswer(index),
                  ),
                );
              },
            ),
          ),
          
          // End Quiz Button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.endQuiz,
              icon: const Icon(Icons.stop, color: Colors.white),
              label: const Text(
                'End Quiz',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
    });
  }
}


Widget _buildOptionButton({
    required String option,
    required String optionLetter,
    required int index,
    required VoidCallback onTap,
  }) {
    final colors = [
      Colors.lightBlue,
      Colors.purpleAccent,
      Colors.orange,
      Colors.teal,
    ];
    
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors[index % colors.length].withOpacity(0.8),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  optionLetter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




















































































































































































































// import 'package:finlit/components/ui/icon_round.dart';
// import 'package:finlit/main.dart';
// import 'package:finlit/pages/pause.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:finlit/components/misc/questionslist.dart';

// // Quiz Controller using GetX
// class QuizController extends GetxController {
//   var questionIndex = 0.obs;
//   var answered = false.obs;
//   var isCorrect = false.obs;
//   var selectedIndex = (-1).obs;
//   var score = 0.obs;
  
//   final questions = quizQuestions.map((q) => {
//         "question": q.qtext,
//         "image": q.qattachment,
//         "options": q.qchoices,
//         "correctIndex": q.correctIndex,
//         "explanation": "This is a detailed explanation for the question.",
//       }).toList();

//   void checkAnswer(int index) {
//     final correctIndex = questions[questionIndex.value]["correctIndex"] as int;
//     selectedIndex.value = index;
//     answered.value = true;
//     isCorrect.value = index == correctIndex;
    
//     if (isCorrect.value) {
//       score.value++;
//     }
//   }

//   void nextQuestion() {
//     answered.value = false;
//     isCorrect.value = false;
//     selectedIndex.value = -1;
    
//     if (questionIndex.value < questions.length - 1) {
//       questionIndex.value++;
//     } else {
//       // Show final score or restart
//       _showQuizComplete();
//     }
//   }

//   void resetQuiz() {
//     questionIndex.value = 0;
//     answered.value = false;
//     isCorrect.value = false;
//     selectedIndex.value = -1;
//     score.value = 0;
//   }

//   void endQuiz() {
//     Get.dialog(
//       AlertDialog(
//         backgroundColor: const Color(0xFF2C1346),
//         title: const Text('End Quiz', style: TextStyle(color: Colors.white)),
//         content: Text(
//           'Are you sure you want to end the quiz?\nYour current score: ${score.value}/${questionIndex.value + (answered.value ? 1 : 0)}',
//           style: const TextStyle(color: Colors.white70),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
//           ),
//           TextButton(
//             onPressed: () {
//               Get.back();
//               resetQuiz();
//             },
//             child: const Text('End Quiz', style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showQuizComplete() {
//     Get.dialog(
//       AlertDialog(
//         backgroundColor: const Color(0xFF2C1346),
//         title: const Text('Quiz Complete!', style: TextStyle(color: Colors.white)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               score.value >= questions.length * 0.7 ? Icons.emoji_events : Icons.thumb_up,
//               size: 50,
//               color: score.value >= questions.length * 0.7 ? Colors.amber : Colors.blue,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Final Score: ${score.value}/${questions.length}',
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               '${((score.value / questions.length) * 100).toStringAsFixed(1)}%',
//               style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Get.back();
//               resetQuiz();
//             },
//             child: const Text('Restart Quiz', style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FinLitApp extends StatelessWidget {
//   const FinLitApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'FinLit Quiz',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         primaryColor: const Color(0xFF2C1346),
//         scaffoldBackgroundColor: const Color(0xFF2C1346),
//       ),
//       home: const QuizScreen(),
//     );
//   }
// }

// class QuizScreen extends StatelessWidget {
//   const QuizScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final QuizController controller = Get.put(QuizController());

//     return Scaffold(
//       backgroundColor: const Color(0xFF2C1346),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               // Header with logo and question counter
//               _buildHeader(controller),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: Obx(() => controller.answered.value
//                     ? _buildResultScreen(controller)
//                     : _buildQuestionScreen(controller)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(QuizController controller) {
//     return Obx(() => Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.white.withOpacity(0.2)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: const BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.quiz, color: Colors.white, size: 20),
//               ),
//               const SizedBox(width: 12),
//               const Text(
//                 'FinLit',
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           IconButton(onPressed: (){Get.toNamed(AppRoutes().PAUSE);}, icon: FIcon(Icons.pause_circle_rounded)),
//         ],
//       ),
//     ));
//   }





















//   Widget _buildQuestionScreen(QuizController controller) {
//     return Obx(() {
//       final current = controller.questions[controller.questionIndex.value];
      
//       return Column(
//         children: [
//           // Progress indicator
//           Container(
//             width: double.infinity,
//             height: 8,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: FractionallySizedBox(
//               alignment: Alignment.centerLeft,
//               widthFactor: (controller.questionIndex.value + 1) / controller.questions.length,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
          
//           // Question number
//           Text(
//             'Question ${controller.questionIndex.value + 1}',
//             style: const TextStyle(
//               fontSize: 18,
//               color: Colors.white70,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 20),
          
//           // Image if available
//           if (current["image"] != null && (current["image"] as String).isNotEmpty)
//             Container(
//               height: 180,
//               width: double.infinity,
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white.withOpacity(0.1),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.network(
//                   current["image"] as String,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Icon(
//                       Icons.image_not_supported,
//                       color: Colors.white54,
//                       size: 50,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
          
//           // Question text
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: Colors.white.withOpacity(0.1)),
//             ),
//             child: Text(
//               current["question"] as String,
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//                 height: 1.4,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 30),
          
//           // Options
//           Expanded(
//             child: ListView.builder(
//               itemCount: (current["options"] as List<String>).length,
//               itemBuilder: (context, index) {
//                 final option = (current["options"] as List<String>)[index];
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 12),
//                   child: _buildOptionButton(
//                     option: option,
//                     optionLetter: String.fromCharCode(65 + index),
//                     index: index,
//                     onTap: () => controller.checkAnswer(index),
//                   ),
//                 );
//               },
//             ),
//           ),
          
//           // End Quiz Button
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.only(top: 20),
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red.withOpacity(0.8),
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: controller.endQuiz,
//               icon: const Icon(Icons.stop, color: Colors.white),
//               label: const Text(
//                 'End Quiz',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }


























//   Widget _buildResultScreen(QuizController controller) {
//     return Obx(() {
//       final current = controller.questions[controller.questionIndex.value];
      
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Result Icon
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: controller.isCorrect.value 
//                   ? Colors.green.withOpacity(0.2) 
//                   : Colors.red.withOpacity(0.2),
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: controller.isCorrect.value ? Colors.green : Colors.red,
//                 width: 3,
//               ),
//             ),
//             child: Icon(
//               controller.isCorrect.value ? Icons.check : Icons.close,
//               size: 60,
//               color: controller.isCorrect.value ? Colors.green : Colors.red,
//             ),
//           ),
//           const SizedBox(height: 24),
          
//           // Result Text
//           Text(
//             controller.isCorrect.value ? "Correct answer" : "Incorrect answer",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: controller.isCorrect.value ? Colors.green : Colors.red,
//             ),
//           ),
//           const SizedBox(height: 20),
          
//           // Correct Answer Display
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               "Option ${String.fromCharCode((current["correctIndex"] as int) + 65)}",
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
          
//           // Explanation
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: Colors.white.withOpacity(0.2)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Explanation",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   current["explanation"] as String,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.white70,
//                     height: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 30),
          
//           // Score Display
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.blue.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.blue.withOpacity(0.5)),
//             ),
//             child: Text(
//               'Score: ${controller.score.value}/${controller.questionIndex.value + 1}',
//               style: const TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           const SizedBox(height: 30),
          
//           // Next Question Button
//           Container(
//             width: double.infinity,
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onPressed: controller.nextQuestion,
//               icon: const Icon(Icons.arrow_forward, color: Colors.white),
//               label: Text(
//                 controller.questionIndex.value < controller.questions.length - 1
//                     ? 'Next Question'
//                     : 'Finish Quiz',
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }



























//   Widget _buildOptionButton({
//     required String option,
//     required String optionLetter,
//     required int index,
//     required VoidCallback onTap,
//   }) {
//     final colors = [
//       Colors.lightBlue,
//       Colors.purpleAccent,
//       Colors.orange,
//       Colors.teal,
//     ];
    
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colors[index % colors.length].withOpacity(0.8),
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 2,
//         ),
//         onPressed: onTap,
//         child: Row(
//           children: [
//             Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   optionLetter,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 option,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }