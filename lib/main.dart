import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:graduation_project/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LogInScreen());
        });
  }
}
