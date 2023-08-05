import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sociel_app/utils/app_colors.dart';
import 'package:sociel_app/utils/app_styles.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});
  void statusBarChanges() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    statusBarChanges();
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
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
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
                        const SizedBox(
                          width: 50,
                          child: Column(
                            children: [
                              Opacity(
                                opacity: 1,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.red,
                                  height: 10,
                                ),
                              ),
                              Opacity(
                                opacity: 1,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.red,
                                  height: 10,
                                ),
                              ),
                              Opacity(
                                opacity: 1,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.red,
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Text(
                      'WELCOME BACK\n FAHAD ',
                      style: AppTextStyle.boldBlack22.copyWith(
                          color: Colors.red, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 60),
                    Text.rich(
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
                    const Spacer(),
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
            )
          ],
        ),
      ),
    );
  }
}
