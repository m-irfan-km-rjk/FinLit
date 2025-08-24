import 'package:finlit/components/ui/icon_round.dart';
import 'package:finlit/pages/quiz.dart';
import 'package:finlit/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // Screen width/height (shortcuts)
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                "assets/images/home_logo.png",
                height: h * 0.34, // ~34% of screen height
              ),

              SizedBox(height: h * 0.02),

              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fin",
                    style: GoogleFonts.baloo2(
                      fontSize: w * 0.15, // ~15% of screen width
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF0000),
                    ),
                  ),
                  Text(
                    "Lit",
                    style: GoogleFonts.baloo2(
                      fontSize: w * 0.15,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0AB9D4),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.01),

              // Subtitle
              Text(
                "Gain financial literacy through quizzes",
                textAlign: TextAlign.center,
                style: GoogleFonts.baloo2(
                  fontSize: w * 0.04, // ~4% of width
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: h * 0.12),

              // Card container
              Container(
                width: w * 0.9, // 90% of screen width
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Play Quiz row
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.play_arrow),
                      title: Text(
                        "Play Quiz",
                        style: GoogleFonts.arimo(
                          fontSize: w * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.offAll(() => QuizScreen());
                      },
                    ),
                    // Settings row
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.settings_rounded),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.arimo(
                          fontSize: w * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Get.to(() => SettingsPage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}