import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/splash.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import '../bottom_nav_bar_screens/bottom_nav_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h,),
          Container(
              height: 100.h,
              width: 350.w,
              decoration: const BoxDecoration(color: primaryColor
                  // color: Color(0xffbb2f3c),
                  ),
              child: Center(
                  child: Text(
                "Sign up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                    color:Colors.white),
              ))),
          Container(
              height: 630.h,
              width: 350.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      60,
                    ),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: SizedBox(
                                width: 160.w,
                                height: 50.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      label: Text("First Name"),
                                      suffixIcon: Icon(Icons.person),
                                      hintText: ("First Name")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: SizedBox(
                                width: 150.w,
                                height: 50.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      label: Text("Last Name"),
                                      suffixIcon: Icon(Icons.person),
                                      hintText: ("Last Name")),
                                )),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 15, right: 20),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                label: Text("E-mail"),
                                suffixIcon: Icon(Icons.mail),
                                hintText: ("E-mail"))),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 15, right: 20),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                label: Text("Password"),
                                suffixIcon: Icon(Icons.remove_red_eye),
                                hintText: ("Password"))),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 15, bottom: 25, right: 20),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        //color: Colors.red
                                        color: Colors.black)),
                                label: Text("Confirm Password"),
                                suffixIcon: Icon(Icons.remove_red_eye),
                                hintText: ("Confirm Password"))),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              // color: Color(0xffbb2f3c),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 50.h,
                          width: 330.w,
                          child: Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SplashScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: primaryColor
                                      //  backgroundColor: const Color(0xffbb2f3c),
                                      // Text Color (Foreground color)
                                      ),
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        //  backgroundColor: Color(0xffbb2f3c)
                                        ),
                                  )))),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "By clicking 'Sign up' you agree to our Terms of the",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Privacy policy",
                          style: TextStyle(fontSize: 12.sp, color: primaryColor),
                        ),
                      ),
                      // const Text(
                      //   "Or Sign in with",
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding:
                      //           EdgeInsets.only(right: 35, top: 10, bottom: 10),
                      //       child: CircleAvatar(
                      //         backgroundImage:
                      //             AssetImage('assets/images/face.png'),
                      //         radius: 20,
                      //       ),
                      //     ),
                      //     CircleAvatar(
                      //       backgroundImage: AssetImage(
                      //           'assets/images/gmail-internet-google-logo-trademark.jpg'),
                      //       radius: 20,
                      //     )
                      //   ],
                      // ),
                    ],
                  )))
        ],
      )),
    );
  }
}
