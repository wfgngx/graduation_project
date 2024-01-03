import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/admin_core/screens/admin_brands_screen.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:graduation_project/screens/auth_screen/signUp_screen.dart';
import 'package:graduation_project/screens/onBoarding_screens/on_boarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav_bar_screens/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset(
          'assets/on_boarding/onBoradCar.jpg',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Padding(
            padding: EdgeInsets.only(top: 120.h),
            child: AnimatedTextKit(
              animatedTexts: [
                // ScaleAnimatedText('CARIFY',
                //   duration:  Duration(seconds: 3),
                //   scalingFactor: 10,
                //   textStyle: GoogleFonts.italiana(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 64,
                //       color: Colors.white),)
                // RotateAnimatedText(
                //   'CARIFY',
                //   textStyle: GoogleFonts.italiana(
                //       fontWeight: FontWeight.w900,
                //       fontSize: 64,
                //       color: Colors.white),
                // )
                TypewriterAnimatedText(
                  'CARIFY',
                  textStyle: GoogleFonts.italiana(
                      fontWeight: FontWeight.w900,
                      fontSize: 64,
                      color: Colors.white),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 2,
              pause: const Duration(seconds: 2),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ))
      ],
    )
        // Center(
        //   child: CircleAvatar(
        //     radius: 80.r,
        //     backgroundImage: const AssetImage("assets/images/logo_gp.PNG"),
        //   ),

        );
  }

  void navigateToHomeScreen() {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('isLoggedIn') ?? false;
      var welcomed = prefs.getBool('isWelcomed') ?? false;
      // var admin = prefs.getBool('admin') ?? false;

      print("status is $status");
      print("welcome is $welcomed");

      if (status) {
        // dynamic res = await ApiAuth().logIn(userLogin);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // sharedPreferences.getString('email');
        // sharedPreferences.getString('password');

        dynamic res = await ApiAuth().logIn({
          'email': sharedPreferences.getString('email'),
          'password': sharedPreferences.getString('password')
        });
        print(res);
        if (res['success'] == true) {
          Provider.of<MyProvider>(context, listen: false)
              .setToken(res['token']);

          Map<String, dynamic> data = await ApiAuth().getUserData(
              Provider.of<MyProvider>(context, listen: false).myToken);
          print('MU PROFILE DATA $data');

          if (data['success'] == true) {
            Provider.of<MyProvider>(context, listen: false)
                .getProfileData(data);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBar(),
                ));
            // Provider.of<MyProvider>(context, listen: false)
            //     .setProfilePicture(res['result']['profilePicture']);
            print(
                "MY PROVIDER DATA IS ${Provider.of<MyProvider>(context, listen: false).profileData}");
          }
        }
      } else {
        if (welcomed) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return LogInScreen();
            },
          ));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return OnBoardingScreen();
            },
          ));
        }
      }
    });
  }
}
// if (admin == false) {
//   Navigator.pushReplacement(context, MaterialPageRoute(
//     builder: (context) {
//       return BottomNavBar();
//     },
//   ));
// }
// else {
//   Navigator.pushReplacement(context, MaterialPageRoute(
//     builder: (context) {
//       return AdminBrands();
//     },
//   ));
// }
