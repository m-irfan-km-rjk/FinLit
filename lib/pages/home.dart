import 'package:finlit/components/themes/theme.dart';
import 'package:finlit/components/ui/icon_button.dart';
import 'package:flutter/material.dart';
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
                child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.06, // 6% of width
                    top: h * 0.025,
                    bottom: h*0.025
                  ),
                  child: Column(
                    children: [
                      // Play Quiz row
                      Row(
                        children: [
                          FButton(
                            fIcon: const Icon(Icons.play_arrow, size: 32),
                            onPressed: () {},
                          ),
                          SizedBox(width: w * 0.08),
                          Text(
                            "Play Quiz",
                            style: GoogleFonts.arimo(
                              fontSize: w * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: h * 0.025),

                      // Settings row
                      Row(
                        children: [
                          FButton(
                            fIcon: const Icon(Icons.settings, size: 32),
                            onPressed: () {},
                          ),
                          SizedBox(width: w * 0.08),
                          Text(
                            "Settings",
                            style: GoogleFonts.arimo(
                              fontSize: w * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}