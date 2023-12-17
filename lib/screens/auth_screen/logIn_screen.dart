import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/screens/auth_screen/signUp_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
                height: 210.h,
                width: 360.w,
                color: primaryColor,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            const AssetImage("assets/images/logo_gp.PNG"),
                        radius: 85.r,
                      ),
                    ],
                  ),
                )),
            Form(
                key: formKey,
                child: Container(
                    height: 483.h,
                    width: 380.w,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.white),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 35),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 28.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                suffixIcon: Icon(Icons.email),
                                label: Text("E-mail"),
                                hintText: ("Enter your e-mail")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                suffixIcon: Icon(Icons.remove_red_eye),
                                fillColor: Color(0xfff5f5f5),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.red)),
                                label: Text(
                                  "Password",
                                ),
                                hintText: ("Enter your password")),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(children: []),
                            ),
                          ],
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
                                    loginUsers();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: primaryColor),
                                  child: Text("Sign in",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "By clicking 'Sign in' you agree to our Terms of the",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Privacy policy",
                            style:
                                TextStyle(fontSize: 12.sp, color: primaryColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //  Text("You don`t have an account yet,"),
                            RichText(
                                text: TextSpan(
                                    //style: defaultStyle,
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'You don`t have an account yet,',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp)),
                                  TextSpan(
                                      text: 'Sign up',
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 18.sp),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        })
                                ]))
                          ],
                        )
                      ],
                    ))))
          ]),
        ));
  }

  Future<void> loginUsers() async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> userLogin = {
        "email": emailController.text,
        "password": passwordController.text
      };
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await ApiAuth().logIn(userLogin);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['success'] == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }
}
