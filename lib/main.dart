import 'package:finlit/components/themes/theme.dart';
import 'package:finlit/pages/home.dart';
import 'package:finlit/pages/pause.dart';
import 'package:finlit/pages/quiz.dart';
import 'package:finlit/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class AppRoutes {
  static const String SETTINGS = '/settings';
  static const String PAUSE = '/pause';
  static const String QUIZ_RESULTS = '/quiz-results';
}

// GetX Pages configuration
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.PAUSE,
      page: () => const PausePage(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingsPage(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.QUIZ_RESULTS,
      page: () => const QuizScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.darkTheme,
      home: SettingsPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
