import 'package:flutter/material.dart';
import 'package:sociel_app/dashboard/home/home_screen.dart';
import 'package:sociel_app/utils/app_colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;
  List screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: AppColors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, top: 9, left: 16, right: 16),
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconWidget(
              icon: Icons.home_outlined,
              iconColor: index == 0 ? AppColors.white : AppColors.grey,
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            IconWidget(
              icon: Icons.person,
              iconColor: index == 1 ? AppColors.white : AppColors.grey,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            IconWidget(
              icon: Icons.add_box_outlined,
              iconColor: index == 2 ? AppColors.white : AppColors.grey,
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            IconWidget(
              icon: Icons.newspaper_outlined,
              iconColor: index == 3 ? AppColors.white : AppColors.grey,
              onPressed: () {
                setState(() {
                  index = 3;
                });
              },
            ),
            IconWidget(
              icon: Icons.settings_outlined,
              iconColor: index == 4 ? AppColors.white : AppColors.grey,
              onPressed: () {
                setState(() {
                  index = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 26,
        color: iconColor,
      ),
    );
  }
}
