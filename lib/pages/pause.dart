import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PausePage extends StatefulWidget {
  const PausePage({super.key});

  @override
  State<PausePage> createState() => _PausePageState();
}

class _PausePageState extends State<PausePage> {
  bool sound = false;
  bool music = false;

  @override
  Widget build(BuildContext context) {
    // screen size helpers
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== Title =====
            Text(
              "Paused",
              style: TextStyle(
                fontSize: w * 0.15, // ~15% of width
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: h * 0.04),

            // ====== First Box ======
            Container(
              width: w * 0.9, // 90% of screen width
              padding: EdgeInsets.all(w * 0.04),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.volume_up, size: w * 0.08),
                    title:Text( "Sound"),
                    trailing: Switch.adaptive(
                      value: sound,
                      onChanged: (value) => setState(() => sound = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.music_note, size: w * 0.08),
                    title: Text("Music"),
                    trailing: Switch.adaptive(
                      value: music,
                      onChanged: (value) => setState(() => music = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.text_fields_rounded, size: w * 0.08),
                    title: Text("Font Size"),
                    trailing: IconButton(
                      iconSize: w * 0.12,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.palette, size: w * 0.08),
                    title: Text("Theme"),
                    trailing: IconButton(
                      iconSize: w * 0.12,
                      onPressed: () {},
                      icon: const Icon(Icons.sunny),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.03),

            // ====== Second Box ======
            Container(
              width: w * 0.9,
              padding: EdgeInsets.all(w * 0.04),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings, size: w * 0.08),
                    title: Text("Settings"),
                    trailing: Switch.adaptive(
                      value: sound,
                      onChanged: (value) => setState(() => sound = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  
                  ListTile(
                    leading: Icon(Icons.restart_alt_rounded, size: w * 0.08),
                    title: Text("Restart"),
                    trailing: IconButton(
                      iconSize: w * 0.12,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.stop, size: w * 0.08),
                    title: Text("End Quiz"),
                    trailing: IconButton(
                      iconSize: w * 0.12,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.06),

            // ====== Continue Button ======
            Container(
              width: w * 0.9,
              height: h * 0.1, // ~10% of screen height
              padding: EdgeInsets.symmetric(vertical: h * 0.025),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.08, // ~8% of screen width
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}