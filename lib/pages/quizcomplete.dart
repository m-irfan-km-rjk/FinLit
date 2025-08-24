// 📄 lib/components/quiz/quiz_score_card.dart
import 'package:finlit/pages/home.dart';
import 'package:finlit/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/controllers/question_controller.dart';

class QuizScoreCard extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int totalTime; // in seconds
  final bool isDarkTheme;
  final VoidCallback onPlayAgain;
  final VoidCallback onMainMenu;

  const QuizScoreCard({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalTime,
    this.isDarkTheme = true,
    required this.onPlayAgain,
    required this.onMainMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkTheme 
          ? const Color(0xFF2D1B69) // Dark purple
          : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with FinLit logo
          _buildHeader(),
          const SizedBox(height: 20),
          
          // Score section
          _buildScoreSection(),
          const SizedBox(height: 20),
          
          // Stats section
          _buildStatsSection(),
          const SizedBox(height: 20),
          
          // Thumbs up icon and message
          _buildResultMessage(),
          const SizedBox(height: 25),
          
          // Action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Fin',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkTheme ? Colors.red : Colors.red,
          ),
        ),
        Text(
          'Lit',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkTheme ? Colors.blue : Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildScoreSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isDarkTheme 
          ? Colors.black.withOpacity(0.2)
          : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'SCORE',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDarkTheme ? Colors.white : Colors.black,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Column(
      children: [
        _buildStatRow(
          icon: Icons.check_circle,
          iconColor: Colors.green,
          label: 'Correct',
          value: correctAnswers.toString(),
        ),
        const SizedBox(height: 8),
        _buildStatRow(
          icon: Icons.cancel,
          iconColor: Colors.red,
          label: 'Wrong',
          value: wrongAnswers.toString(),
        ),
        const SizedBox(height: 8),
        _buildStatRow(
          icon: Icons.access_time,
          iconColor: Colors.orange,
          label: 'Total Time',
          value: _formatTime(totalTime),
        ),
      ],
    );
  }

  Widget _buildStatRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          ': $value',
          style: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildResultMessage() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.thumb_up,
            color: Colors.green,
            size: 32,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Good Job',
          style: TextStyle(
            color: isDarkTheme ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Play Again Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onPlayAgain,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkTheme 
                ? const Color(0xFF4C3B8A)
                : const Color(0xFF6C5CE7),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.play_arrow, size: 20),
            label: const Text(
              'Play Again',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        
        // Main Menu Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onMainMenu,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkTheme 
                ? const Color(0xFF4C3B8A)
                : const Color(0xFF6C5CE7),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.menu, size: 20),
            label: const Text(
              'Main Menu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(int totalSeconds) {
    if (totalSeconds < 60) {
      return '${totalSeconds}s';
    } else {
      final minutes = totalSeconds ~/ 60;
      final seconds = totalSeconds % 60;
      return '${minutes}m ${seconds}s';
    }
  }
}

// 📄 Usage Example in your Quiz Complete Page
class QuizCompletePageWithCard extends StatelessWidget {
  const QuizCompletePageWithCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.find<QuizController>();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz completed',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              
              // Dark Theme Card
              QuizScoreCard(
                correctAnswers: controller.score.value,
                wrongAnswers: controller.questions.length - controller.score.value,
                totalTime: 60, // You'll need to track actual time
                isDarkTheme: true,
                onPlayAgain: () {
                  controller.resetQuiz();
                  Get.offAll(() => const QuizScreen());
                },
                onMainMenu: () {
                  Get.offAll(() => const Homepage());
                },
              ),
              const SizedBox(height: 30),
              
              // Light Theme Card (for comparison)
              QuizScoreCard(
                correctAnswers: controller.score.value,
                wrongAnswers: controller.questions.length - controller.score.value,
                totalTime: 60,
                isDarkTheme: false,
                onPlayAgain: () {
                  controller.resetQuiz();
                  Get.offAll(() => const QuizScreen());
                },
                onMainMenu: () {
                  Get.offAll(() => const Homepage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}