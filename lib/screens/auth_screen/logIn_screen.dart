import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/model/user_info.dart';
import 'package:graduation_project/screens/auth_screen/forget_password_screens/email_verify_screen.dart';
import 'package:graduation_project/screens/auth_screen/signUp_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:graduation_project/screens/splash.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool authState = false;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
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
                        SvgPicture.asset('assets/user_cars/Car dutam.svg')
                        // CircleAvatar(
                        //   backgroundImage:
                        //       const AssetImage("assets/images/logo_gp.PNG"),
                        //   radius: 80.r,
                        // ),
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
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.white),
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Gap(18.h),
                          Center(
                            child: Text('Sign in',
                                style: GoogleFonts.inter(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35)),
                          ),
                          Gap(18.h),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(),
                                elevation: 5,
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      fillColor: Color(0XFFF2F2F2),
                                      filled: true,
                                      border: InputBorder.none,
                                      // isDense: true,
                                      // focusedBorder: OutlineInputBorder(
                                      //     borderSide:
                                      //         BorderSide(color: Colors.green)),
                                      // border: OutlineInputBorder(
                                      //     borderSide:
                                      //         BorderSide(color: Colors.red)),
                                      suffixIcon: Icon(Icons.email),
                                      label: Text("E-mail"),
                                      hintText: ("Enter your e-mail")),
                                ),
                              )),
                          Gap(12.h),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(),
                                elevation: 5,
                                child: TextFormField(
                                  obscureText: obscure,
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: const Color(0XFFF2F2F2),
                                      filled: true,
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            obscure = !obscure;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      // fillColor: Color(0xfff5f5f5),
                                      // border: OutlineInputBorder(
                                      //     borderSide: BorderSide(
                                      //         width: 3, color: Colors.red)),
                                      label: Text(
                                        "Password",
                                      ),
                                      hintText: ("Enter your password")),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const EmailVerifyScreen(),
                                            ));
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Forgot Password?',
                                            style: GoogleFonts.inter(
                                                letterSpacing: 1.w,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0XFF154870)),

                                            // TextStyle(
                                            //     letterSpacing: 1.w,
                                            //     color: primaryColor,
                                            //     fontWeight: FontWeight.w600),
                                          ),
                                          Divider(
                                            color: Color(0XFF154870),
                                            indent: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                135.w,
                                          ),
                                        ],
                                      )))),
                          Card(
                              elevation: 15,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 50.h,
                                width: 330.w,
                                child: Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          myProvider.getProfileData(
                                              myProvider.profileData);
                                          loginUsers(myProvider.profileData);
                                          print(
                                              "ciaunckskj${myProvider.profileData}");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: primaryColor),
                                        child: authState
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text("Login",
                                                style: TextStyle(
                                                  letterSpacing: 3.w,
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                )))),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "By clicking 'Log in' you agree to our Terms of the",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text("Privacy policy",
                                style: GoogleFonts.inriaSans(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0XFF730303))
                                // TextStyle(
                                //     fontSize: 12.sp, color: primaryColor),
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 32.h,
                              ),
                              //  Text("You don`t have an account yet,"),
                              RichText(
                                  text: TextSpan(
                                      //style: defaultStyle,
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: 'You don`t have an account yet? ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp)),
                                    TextSpan(
                                        text: 'Create One',
                                        style: GoogleFonts.inter(
                                            letterSpacing: 1.w,
                                            // fontSize: 18.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0XFF154870)),
                                        // TextStyle(
                                        //     color: primaryColor,
                                        //     fontSize: 18.sp),
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
          )),
    );
  }

  Future<void> loginUsers(Map<String, dynamic> provider) async {
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
      print('MY RES LOGIN IS $res');

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res['success'] == true) {
        Provider.of<MyProvider>(context, listen: false)
            .setEmail(emailController.text);
        print(
            "THIS IS MY MAIL SHARED ${Provider.of<MyProvider>(context, listen: false).email}");
        Provider.of<MyProvider>(context, listen: false)
            .setEmail(passwordController.text);
        print(
            "THIS IS MY PASSWORD SHARED ${Provider.of<MyProvider>(context, listen: false).password}");

        Provider.of<MyProvider>(context, listen: false)
            .setEmail(emailController.text);
        Provider.of<MyProvider>(context, listen: false)
            .setPassword(passwordController.text);
        dynamic info = await ApiAuth().getUserData(res['token']);
        print('MY INFO IS $info');
        if (info['success'] == true) {
          Provider.of<MyProvider>(context, listen: false).getProfileData(info);
          print(
              "This is my profile data${Provider.of<MyProvider>(context, listen: false).profileData}");
          // if (info['result']['role'] == 'admin') {
          //   Provider.of<MyProvider>(context, listen: false).setAdminState();
          // }
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
        Provider.of<MyProvider>(context, listen: false).setAuthState();
      } else {
        print(res);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }
}
