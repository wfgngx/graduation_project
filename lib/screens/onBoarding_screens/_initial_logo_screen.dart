import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/onBoarding_screens/on_boarding_screen.dart';

class InitialLogoScreen extends StatefulWidget {
  const InitialLogoScreen({Key? key}) : super(key: key);

  @override
  State<InitialLogoScreen> createState() => _InitialLogoScreenState();
}

class _InitialLogoScreenState extends State<InitialLogoScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "CARIFY",
          style:
              GoogleFonts.goldman(fontSize: 50.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  navigateToOnBoardingScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ));
    });
  }
}
