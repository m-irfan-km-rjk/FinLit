import 'package:finlit/components/ui/icon_round.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/controllers/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final sound = false;
  final SettingsController controller = Get.put(SettingsController());
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 18, right: 18, top: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF321B4F),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_rounded, size: 33),
                ),
              ),
              SizedBox(width: 27),
              Text(
                "Settings",
                style: GoogleFonts.assistant(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            width: 376,
            decoration: BoxDecoration(
              color: Color(0xFF321B4F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23, top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Appearance",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white, thickness: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.palette_rounded),
                      title: Text(
                        "Theme",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.light_mode_rounded, size: 45),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.text_fields_rounded),
                      title: Text(
                        "Font Size",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Choose Font Size",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "A",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Large"),
                                      onTap: () {
                                        controller.setFontSize(30);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "A",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Medium"),
                                      onTap: () {
                                        controller.setFontSize(20);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "A",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Small"),
                                      onTap: () {
                                        controller.setFontSize(15);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.arrow_right, size: 50),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.animation_rounded),
                      title: Text(
                        "Animations",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      trailing: Obx(
                            () => Switch.adaptive(
                          value: controller.animationsEnabled.value,
                          onChanged: (value) =>
                              controller.toggleAnimations(),
                          activeColor: const Color(0xFF6024B4),
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: const Color(0xFF6024B4),
                          inactiveTrackColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 376,
            decoration: BoxDecoration(
              color: Color(0xFF321B4F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23, top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Accessibility",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white, thickness: 1),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.mic_rounded),
                      title: Text(
                        "Narrator",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      trailing: Obx(
                            () => Switch.adaptive(
                          value: controller.narratorEnabled.value,
                          onChanged: (value) => controller.toggleNarrator(),
                          activeColor: const Color(0xFF6024B4),
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: const Color(0xFF6024B4),
                          inactiveTrackColor: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.record_voice_over_rounded),
                      title: Text(
                        "Speech Rate",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Choose Speech Rate",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ListTile(
                                        leading: Text(
                                          "2x",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        title: Text("Fast"),
                                        onTap: () {
                                          controller.setSpeechRate(2);
                                          Navigator.pop(context);
                                        }),
                                    ListTile(
                                      leading: Text(
                                        "1.5x",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Medium"),
                                      onTap: () {
                                        controller.setSpeechRate(1.5);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "1x",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Normal"),
                                      onTap: () {
                                        controller.setSpeechRate(1);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "0.5x",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Slow"),
                                      onTap: () {
                                        controller.setSpeechRate(0.5);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Text(
                                        "0.25x",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      title: Text("Very Slow"),
                                      onTap: () {
                                        controller.setSpeechRate(0.25);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.arrow_right, size: 50),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 376,
            decoration: BoxDecoration(
              color: Color(0xFF321B4F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23, top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sound",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white, thickness: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.music_note),
                      title: Text(
                        "Music",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Obx(() => Slider(
                        value: controller.musicVolume.value,
                        onChanged: (value) =>
                            controller.setMusicVolume(value),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.volume_up_rounded),
                      title: Text(
                        "Sound Effects",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Obx(() => Slider(
                        value: controller.soundEffectVolume.value,
                        onChanged: (value) =>
                            controller.setSoundEffectVolume(value),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.mic_rounded),
                      title: Text(
                        "Narrator",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Obx(() => Slider(
                        value: controller.narratorVolume.value,
                        onChanged: (value) =>
                            controller.setNarratorVolume(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 376,
            decoration: BoxDecoration(
              color: Color(0xFF321B4F),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23, top: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "App Info",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.arimo(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white, thickness: 1),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.info_rounded),
                      title: Text(
                          "About",
                          style: GoogleFonts.arimo(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.shield_rounded),
                      title: Text(
                        "Privacy Policy",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      leading: FIcon(fIcon: Icons.mail_rounded),
                      title: Text(
                        "Contact Us",
                        style: GoogleFonts.arimo(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
