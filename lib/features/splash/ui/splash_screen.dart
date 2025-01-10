import 'package:flutter/material.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/theming/colors_manager.dart';

import '../../../core/helpers/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushNamedAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        isLoggedIn
            ? Routes.homeScreen
            : isOpened
                ? Routes.loginScreen
                : Routes.onBoardingScreen,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.mainPurpule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/Group 9.png'),
          ],
        ),
      ),
    );
  }
}
