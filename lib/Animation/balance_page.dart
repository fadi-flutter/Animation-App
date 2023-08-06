import 'package:flutter/material.dart';
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
  int _turns = 0;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();

    increaseTurn();

    super.initState();
  }

  increaseTurn() async {
    for (var i = 0; i < 3; i++) {
      await Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _turns++;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_turns);
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
                            duration: const Duration(milliseconds: 700),
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
                        : Container(),
                    const SizedBox(height: 35),
                    _turns > 2 || _turns == 2
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 700),
                            builder: (context, value, child) {
                              return Padding(
                                padding: EdgeInsets.only(top: 30 - value * 29),
                                child: Opacity(opacity: value, child: child),
                              );
                            },
                            child: Text(
                              'WELCOME BACK\n FAHAD ',
                              style: AppTextStyle.boldBlack22.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        : Container(),
                    const SizedBox(height: 30),
                    _turns > 3 || _turns == 3
                        ? TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 700),
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
                        : Container(),
                    const Spacer(),
                    Text(
                      'Points',
                      style: AppTextStyle.boldBlack22.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$31',
                      style: AppTextStyle.boldBlack26.copyWith(
                          color: Colors.red, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 13),
                    SizedBox(
                      width: 210,
                      child: Divider(
                        thickness: 1,
                        color: Colors.red.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Text(
                      'Wallet Balance',
                      style: AppTextStyle.boldBlack22.copyWith(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$462.7',
                      style: AppTextStyle.boldBlack26.copyWith(
                          color: Colors.red, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                        size: 26,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _animation.value > 0.4 ? 1.0 : _animation.value,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 91 - _animation.value * 71),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
