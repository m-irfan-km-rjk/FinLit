import 'package:finlit/components/controllers/usb_controller.dart';
import 'package:finlit/components/themes/theme.dart';
import 'package:finlit/pages/home.dart';
import 'package:finlit/pages/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/controllers/question_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  Get.put(QuizController());
  Get.put(UsbController());
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
