import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview/sign_in_screen/view/sign_in_screen.dart';
import 'package:interview/utils/constant_colors.dart';

/// This screen is for showing the splash screen
/// to the user and it contains the logo
/// of our company.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the divice.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  ConstantColors.redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: ConstantColors.whiteColor,
              radius: size.width * 0.2,
              // Logo image.
              child: Image.asset('asset\\images\\eayezy.png'),
            )
          ],
        ),
      ),
    );
  }
}
