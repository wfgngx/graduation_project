import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/admin_core/screens/admin_brands_screen.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:graduation_project/screens/splash.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.h,
          ),
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
                    color: Colors.white),
              ))),
          Form(
              key: formkey,
              child: Container(
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
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                    width: 160.w,
                                    height: 50.h,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a value';
                                        }
                                        return null;
                                      },
                                      controller: fNameController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          label: Text("First Name"),
                                          suffixIcon: Icon(Icons.person),
                                          hintText: ("First Name")),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                    width: 150.w,
                                    height: 50.h,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a value';
                                        }
                                        return null;
                                      },
                                      controller: lNameController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          label: Text("Last Name"),
                                          suffixIcon: Icon(Icons.person),
                                          hintText: ("Last Name")),
                                    )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    label: Text("E-mail"),
                                    suffixIcon: Icon(Icons.mail),
                                    hintText: ("E-mail"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    label: Text("Password"),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    hintText: ("Password"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, bottom: 25, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  return null;
                                },
                                controller: rePasswordController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            //color: Colors.red
                                            color: Colors.black)),
                                    label: Text("Confirm Password"),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    hintText: ("Confirm Password"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, bottom: 25, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  return null;
                                },
                                controller: roleController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            //color: Colors.red
                                            color: Colors.black)),
                                    label: Text("Role"),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    hintText: ("Role"))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 15, bottom: 25, right: 20),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a value';
                                  }
                                  return null;
                                },
                                controller: genderController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            //color: Colors.red
                                            color: Colors.black)),
                                    label: Text("Gender"),
                                    suffixIcon: Icon(Icons.remove_red_eye),
                                    hintText: ("Gender"))),
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
                                        handleRegister();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const SplashScreen()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: primaryColor),
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
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Privacy policy",
                              style: TextStyle(
                                  fontSize: 12.sp, color: primaryColor),
                            ),
                          ),
                        ],
                      ))))
        ],
      )),
    );
  }

  Future<void> handleRegister() async {
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> userData = {
        "email": emailController.text.toString(),
        "firstName": fNameController.text.toString(),
        "lastName": lNameController.text.toString(),
        "role": roleController.text.toString(),
        "password": passwordController.text.toString(),
        "cPassword": rePasswordController.text.toString(),
        "gender": genderController.text.toString(),
      };
//aadel0022@gmail.com
      // get response from ApiClient
      dynamic res = await ApiAuth().createUserAccount(userData);
      if (res['success'] == true) {
        print(userData);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => roleController.text.trim() == "user"
                  ? BottomNavBar()
                  : const AdminBrands(),
            ));
      } else {
        print(userData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${res['message']}'),
            backgroundColor: Colors.red.shade300,
          ),
        );
      }
    } else {
      print("محمد رضا يلعب");
    }
  }
//
  // Future<void> handleRegister() async {
  //   //the user data to be sent
  //   Map<String, dynamic> userData = {
  //     "email": emailController.text,
  //     "firstName": fNameController,
  //     "lastName": lNameController,
  //     "role": roleController,
  //     "password": passwordController.text,
  //     "cPassword": rePasswordController.text,
  //     "gender": genderController,
  //   };
  //
  //   //get response from ApiClient
  //   dynamic res = await ApiAuth().createUserAccount(userData);
  //   dynamic responseBody = jsonDecode(res);
  //
  //   // ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //
  //   if (responseBody['message'] == "Please check your email !") {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const LogInScreen()));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Error: ${res['Message']}'),
  //       backgroundColor: Colors.red.shade300,
  //     ));
  //   }
  // }
}
