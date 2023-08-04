import 'package:flutter/material.dart';
import 'package:sociel_app/Animation/welcome_screen.dart';
import 'package:sociel_app/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      home: const WelcomeScreen(),
    );
  }
}
