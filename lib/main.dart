import 'package:finlit/components/controllers/usb_controller.dart';
import 'package:finlit/components/themes/theme.dart';
import 'package:finlit/pages/home.dart';
import 'package:finlit/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'dart:developer' as dev;

import 'components/controllers/question_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  Get.put(QuizController());
  Get.put(UsbController());
  await SoLoud.instance.init(
    sampleRate: 44100,      // Audio quality
    bufferSize: 2048,       // Buffer size affects latency
    channels: Channels.stereo,
  );
    Logger.root.level = Level.FINE;
  
  // Listen to log records
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.darkTheme,
      home: Homepage(),
    );
  }
}
