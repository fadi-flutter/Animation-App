import 'package:flutter/material.dart';
import 'package:sociel_app/utils/app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Home',
          style: AppTextStyle.boldWhite26,
        ),
      ),
    );
  }
}
