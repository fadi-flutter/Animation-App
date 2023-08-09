import 'package:flutter/material.dart';
import 'package:sociel_app/Animation/home_page.dart';
import 'package:sociel_app/utils/app_colors.dart';
import 'package:sociel_app/utils/app_styles.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _navigateController;
  Animation<double>? _navigateAnimation;
  int _turns = 0;
  bool _tap = false;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _navigateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
    increaseTurn();
    super.initState();
  }

  increaseTurn() async {
    for (var i = 0; i < 6; i++) {
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _turns++;
        });
      });
    }
  }

  handleNavigate() async {
    setState(() {
      _tap = true;
    });
    _navigateAnimation = Tween(begin: 1.0, end: 30.0).animate(
        CurvedAnimation(parent: _navigateController, curve: Curves.easeIn));
    _navigateController.forward().then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }).then((value) => _navigateController.reset());
  }

  @override
  void dispose() {
    _controller.dispose();
    _navigateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 25, top: 40),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _turns > 1 || _turns == 1
                        ? TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 30 - value * 29),
                                child: Opacity(
                                  opacity: value,
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'FA',
                                style: AppTextStyle.boldWhite22
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 35),
                    _turns > 2 || _turns == 2
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 30 - value * 29),
                                child: Opacity(opacity: value, child: child),
                              );
                            },
                            child: Text(
                              'WELCOME BACK\nFAHAD ',
                              style: AppTextStyle.boldBlack22.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 30),
                    _turns > 3 || _turns == 3
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 30 - value * 29),
                                child: Opacity(opacity: value, child: child),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Yours latest payment was\n ',
                                      style: AppTextStyle.mediumBlack14
                                          .copyWith(color: Colors.red)),
                                  const WidgetSpan(
                                      child: SizedBox(height: 40),
                                      alignment: PlaceholderAlignment.middle),
                                  TextSpan(
                                      text: 'BIG Trade - \$12.5 / 2 Points',
                                      style: AppTextStyle.boldBlack16
                                          .copyWith(color: Colors.red))
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 30),
                    _turns > 4 || _turns == 4
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 30 - value * 29),
                                child: Opacity(
                                  opacity: value,
                                  child: child,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Points',
                                  style: AppTextStyle.boldBlack22.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '31',
                                  style: AppTextStyle.boldBlack26.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(flex: 3),
                    _turns > 5 || _turns == 5
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 700),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 70 - value * 69,
                                ),
                                child: Opacity(
                                  opacity: value,
                                  child: child,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balance',
                                  style: AppTextStyle.boldBlack22.copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '\$3146.6',
                                  style: AppTextStyle.boldBlack26.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(),
                    _turns > 6 || _turns == 6
                        ? TweenAnimationBuilder(
                            curve: Curves.elasticOut,
                            tween: Tween<double>(begin: 0.0, end: 55),
                            duration: const Duration(milliseconds: 2200),
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 25),
                                    height: value,
                                    width: value,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: value > 26
                                        ? const Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppColors.white,
                                              size: 26,
                                            ),
                                          )
                                        : Container()),
                              );
                            },
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _navigateController,
              builder: (context, _) {
                return Transform.scale(
                  scaleX: _navigateAnimation?.value ?? 1,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: handleNavigate,
                    child: Container(
                        height: double.infinity,
                        color: Colors.red,
                        width: 55,
                        child: !_tap
                            ? AnimatedBuilder(
                                animation: _controller,
                                builder: (context, _) {
                                  return Opacity(
                                    opacity: _animation.value > 0.4
                                        ? 1.0
                                        : _animation.value,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 91 - _animation.value * 71),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const RotatedBox(
                                            quarterTurns: 1,
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0 + _animation.value * 18,
                                          ),
                                          RotatedBox(
                                            quarterTurns: -1,
                                            child: Text(
                                              'My Cards',
                                              style: AppTextStyle.boldWhite20,
                                              textDirection: TextDirection.ltr,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const SizedBox()),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
