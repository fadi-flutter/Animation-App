import 'package:flutter/material.dart';
import 'package:sociel_app/Animation/balance_page.dart';
import 'package:sociel_app/utils/app_colors.dart';
import 'package:sociel_app/utils/app_strings.dart';
import 'package:sociel_app/utils/app_styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _containerController;
  late Animation<Offset> _slideAnimation;
  Animation<double>? _containerAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    //controler for text and bird
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    //controler for bottom container
    _containerController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    //slide animation
    _slideAnimation = Tween<Offset>(
            begin: const Offset(-1.5, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //text animation
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    //after 1.8 sec run botttom container animation
    Future.delayed(const Duration(milliseconds: 1800), () {
      _containerAnimation = Tween<double>(begin: 0, end: 55).animate(
        CurvedAnimation(parent: _containerController, curve: Curves.elasticOut),
      );
      _containerController.forward();
    });
  }

  @override
  void dispose() {
    //dispose controllers
    _controller.dispose();
    _containerController.dispose();
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
                    SizedBox(
                      width: 50,
                      child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return Column(
                              children: [
                                Opacity(
                                  opacity: _textAnimation.value,
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.red,
                                    height: 25 - _textAnimation.value * 15,
                                  ),
                                ),
                                Opacity(
                                  opacity: _textAnimation.value,
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.red,
                                    height: 25 - _textAnimation.value * 15,
                                  ),
                                ),
                                Opacity(
                                  opacity: _textAnimation.value,
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.red,
                                    height: 25 - _textAnimation.value * 15,
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    const SizedBox(height: 25),
                    AnimatedBuilder(
                        animation: _controller,
                        builder: (context, _) {
                          return Opacity(
                            opacity: _textAnimation.value,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 41 - _textAnimation.value * 40),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Feel ',
                                        style: AppTextStyle.regularBlack30
                                            .copyWith(color: Colors.red)),
                                    TextSpan(
                                        text: 'Special Now\n',
                                        style: AppTextStyle.boldBlack30
                                            .copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.red)),
                                    TextSpan(
                                        text: 'More Often',
                                        style: AppTextStyle.regularBlack30
                                            .copyWith(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    const Spacer(),
                    AnimatedBuilder(
                      animation: _containerController,
                      builder: (context, _) {
                        double value = _containerAnimation?.value ?? 0;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const BalancePage()));
                          },
                          child: Container(
                            height: _containerAnimation?.value ?? 0,
                            width: _containerAnimation?.value ?? 0,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: value > 26
                                ? const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.white,
                                    size: 26,
                                  )
                                : Container(),
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
