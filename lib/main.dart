import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sociel_app/Animation/welcome_screen.dart';
import 'package:sociel_app/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.red));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.primarySwatch),
      home: const WelcomeScreen(),
    );
  }
}
