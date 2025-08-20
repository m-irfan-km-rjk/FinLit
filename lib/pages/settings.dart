import 'package:finlit/components/ui/icon_round.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  var sound = false;
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 18,right: 18,top: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF321B4F),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_back_rounded,size: 33,)),
              ),
              SizedBox(width: 27,),
              Text(
                "Settings",
                style: GoogleFonts.assistant(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Container(
            width: 376,
            height: 336,
            decoration: BoxDecoration(
              color: Color(0xFF321B4F),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23,top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Appearance",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19,right: 19,top: 9,bottom: 9),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.palette_rounded),
                          Text("Theme", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.wb_sunny_rounded,size: 50,))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.text_fields_rounded),
                          Text("Font Size", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_right,size: 50,))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.animation_rounded),
                          Text("Animations", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          Switch.adaptive(
                            value: sound,
                            onChanged: (value) => {},
                            activeColor: const Color(0xFF6024B4),
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: const Color(0xFF6024B4),
                            inactiveTrackColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: 376,
            height: 257,
            decoration: BoxDecoration(
                color: Color(0xFF321B4F),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23,top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Accessibility",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19,right: 19,top: 9,bottom: 9),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.palette_rounded),
                          Text("Theme", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.wb_sunny_rounded,size: 50,))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.text_fields_rounded),
                          Text("Font Size", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_right,size: 50,))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: 376,
            height: 257,
            decoration: BoxDecoration(
                color: Color(0xFF321B4F),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23,top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sound",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19,right: 19,top: 9,bottom: 9),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FIcon(fIcon: Icons.music_note),
                          Text("Music", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FIcon(fIcon: Icons.text_fields_rounded),
                          Text("Font Size", style: GoogleFonts.arimo(fontWeight: FontWeight.bold,fontSize: 30),),
                          IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_right,size: 50,))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}
