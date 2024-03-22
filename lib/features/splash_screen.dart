import 'dart:async';

import 'package:bhavesh_flutter_portfolio/features/home.dart';
import 'package:bhavesh_flutter_portfolio/utils/app_colors.dart';
import 'package:bhavesh_flutter_portfolio/utils/define_width.dart';
import 'package:flutter/material.dart';
import 'package:splash_route/splash_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        SplashRoute(
          targetPage: const HomePage(),
          barrierColor: Colors.white,
          splashColor: Colors.white,
          startFractionalOffset: FractionalOffset.center,
          transitionDuration: const Duration(
            milliseconds: 2000,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkScaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = _controller.value;
                return Transform.translate(
                  offset:
                      Offset(0, 4 * value), // Move the container up and down
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        AppColors.darkPrimaryColor,
                        Colors.blue,
                      ]),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.darkPrimaryColor,
                          offset: Offset(-2, 0),
                          blurRadius: 20,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: Offset(2, 0),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        'assets/flutter_dash.png',
                        height: Responsive.isLargeMobile(context)
                            ? MediaQuery.sizeOf(context).width * 0.2
                            : Responsive.isTablet(context)
                                ? MediaQuery.sizeOf(context).width * 0.14
                                : 200,
                        width: Responsive.isLargeMobile(context)
                            ? MediaQuery.sizeOf(context).width * 0.2
                            : Responsive.isTablet(context)
                                ? MediaQuery.sizeOf(context).width * 0.14
                                : 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                builder: (context, value, child) => Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.deepPurpleAccent,
                      value: value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: AppColors.darkPrimaryColor,
                                blurRadius: 10,
                                offset: Offset(2, 2)),
                            Shadow(
                                color: Colors.blue,
                                blurRadius: 10,
                                offset: Offset(-2, -2)),
                          ]),
                    )
                  ],
                ),
                tween: Tween(begin: 0.0, end: 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
