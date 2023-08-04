import 'package:flutter/material.dart';
import 'package:sociel_app/utils/app_colors.dart';
import 'package:sociel_app/utils/app_strings.dart';
import 'package:sociel_app/utils/app_styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: const Offset(0, 0))
            .animate(_controller);
    _sizeAnimation = Tween<double>(begin: 0, end: 60)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.reset();
    _controller.forward();
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: SlideTransition(
                position: _slideAnimation,
                child: Image.asset(
                  AppStrings.bird,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 50,
                      child: Column(
                        children: [
                          Divider(
                            thickness: 2,
                            color: Colors.red,
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.red,
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.red,
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _textAnimation.value,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Feel ',
                                    style: AppTextStyle.regularBlack30
                                        .copyWith(color: Colors.red)),
                                TextSpan(
                                    text: 'Special Now\n',
                                    style: AppTextStyle.boldBlack30.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.red)),
                                TextSpan(
                                    text: 'More Often',
                                    style: AppTextStyle.regularBlack30
                                        .copyWith(color: Colors.red)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Container(
                          height: _sizeAnimation.value,
                          width: _sizeAnimation.value,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                            size: 26,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
