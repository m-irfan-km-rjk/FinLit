import 'package:flutter/material.dart';
import '../components/ui/setting_item.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Paused",
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // ====== First Box ======
            Container(
              width: 376,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SettingItem(
                    fIcon: const Icon(Icons.volume_up, size: 32),
                    fText: "Sound",
                    fWidget: Switch.adaptive(
                      value: sound,
                      onChanged: (value) => setState(() => sound = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SettingItem(
                    fIcon: const Icon(Icons.music_note, size: 32),
                    fText: "Music",
                    fWidget: Switch.adaptive(
                      value: music,
                      onChanged: (value) => setState(() => music = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SettingItem(
                    fIcon: const Icon(Icons.text_fields_rounded, size: 32),
                    fText: "Font Size",
                    fWidget: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SettingItem(
                    fIcon: const Icon(Icons.palette, size: 32),
                    fText: "Theme",
                    fWidget: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: const Icon(Icons.sunny),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            // ====== Second Box ======
            Container(
              width: 376,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SettingItem(
                    fIcon: const Icon(Icons.settings, size: 32),
                    fText: "Settings",
                    fWidget: Switch.adaptive(
                      value: sound,
                      onChanged: (value) => setState(() => sound = value),
                      activeColor: const Color(0xFF6024B4),
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: const Color(0xFF6024B4),
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SettingItem(
                    fIcon: const Icon(Icons.restart_alt_rounded, size: 32),
                    fText: "Restart",
                    fWidget: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SettingItem(
                    fIcon: const Icon(Icons.stop, size: 32),
                    fText: "End Quiz",
                    fWidget: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 62,),
            Container(
              width: 376,
              height: 87,
              padding: EdgeInsets.symmetric(vertical: 25.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}