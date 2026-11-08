import 'package:flutter/material.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StudyMateApp());
}

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF5B6CDE);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyMate',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
