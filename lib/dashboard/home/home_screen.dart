import 'package:flutter/material.dart';
import 'package:sociel_app/utils/app_colors.dart';
import 'package:sociel_app/utils/app_strings.dart';
import 'package:sociel_app/utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.format_list_bulleted,
                      size: 25,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(AppStrings.logo),
                      backgroundColor: AppColors.primary,
                      radius: 23,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Fahad 👋',
                      style: AppTextStyle.boldBlack20,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Let's find your dream job",
                      style: AppTextStyle.mediumBlack16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
