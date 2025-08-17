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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/home_logo.png",
                height: 311,
              ),
              SizedBox(height: 19,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fin",
                    style: GoogleFonts.baloo2(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0000),
                    ),
                  ),
                  Text(
                    "Lit",
                    style: GoogleFonts.baloo2(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0AB9D4),
                    ),
                  ),
                ],
              ),
              Text(
                "Gain financial literacy through quizzes",
                style: GoogleFonts.baloo2(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 126,),
              Container(
                width: 376,
                height: 183,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,top: 22),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FButton(fIcon: Icon(
                            Icons.play_arrow,
                            size: 32,
                          ), onPressed: () {}),
                          SizedBox(width: 37,),
                          Text(
                            "Play Quiz",
                            style: GoogleFonts.arimo(
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 19,),
                      Row(
                        children: [
                          FButton(fIcon: Icon(
                            Icons.settings,
                            size: 32,
                          ), onPressed: () {}),
                          SizedBox(width: 37,),
                          Text(
                            "Settings",
                            style: GoogleFonts.arimo(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
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