import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/admin_core/screens/admin_brands_screen.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:graduation_project/screens/splash.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String role = "user";
  // TextEditingController rePasswordController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  // TextEditingController roleController = TextEditingController();
  bool successPassword = false;
  bool isAuth = false;

  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          title: Text(
            "Sign up",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.white),
          )),
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 32.h,
          ),
          // Container(
          //     height: 80.h,
          //     width: 350.w,
          //     decoration: const BoxDecoration(color: primaryColor),
          //     child: Center(
          //         child: Text(
          //       "Sign up",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 30.sp,
          //           color: Colors.white),
          //     ))),
          Form(
              key: formKey,
              child: Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          70.r,
                        ),
                      ),
                      color: Colors.white),
                  child: Padding(
                      padding:
                          EdgeInsets.only(top: 30.h, left: 10.w, bottom: 15.h),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 20),
                              child: Card(
                                  shape: RoundedRectangleBorder(),
                                  elevation: 5,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      return null;
                                    },
                                    controller: fNameController,
                                    decoration: const InputDecoration(
                                        fillColor: Color(0XFFF2F2F2),
                                        filled: true,
                                        border: InputBorder.none,

                                        // border: OutlineInputBorder(
                                        //     borderSide:
                                        //         BorderSide(color: Colors.red)),
                                        label: Text("First Name"),
                                        suffixIcon: Icon(Icons.person),
                                        hintText: ("First Name")),
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 20),
                              child: Card(
                                shape: RoundedRectangleBorder(),
                                elevation: 5,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a value';
                                    }
                                    return null;
                                  },
                                  controller: lNameController,
                                  decoration: const InputDecoration(
                                      fillColor: Color(0XFFF2F2F2),
                                      filled: true,
                                      border: InputBorder.none,

                                      // border: OutlineInputBorder(
                                      //     borderSide:
                                      //         BorderSide(color: Colors.red)),
                                      label: Text("Last Name"),
                                      suffixIcon: Icon(Icons.person),
                                      hintText: ("Last Name")),
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 20),
                              child: Card(
                                shape: RoundedRectangleBorder(),
                                elevation: 5,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a value';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                        fillColor: Color(0XFFF2F2F2),
                                        filled: true,
                                        border: InputBorder.none,

                                        // border: OutlineInputBorder(
                                        //     borderSide:
                                        //         BorderSide(color: Colors.red)),
                                        label: Text("E-mail"),
                                        suffixIcon: Icon(Icons.mail),
                                        hintText: ("E-mail"))),
                              )),
                          Stack(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 20),
                              child: Column(
                                children: [
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(),
                                            elevation: 5,
                                            child: TextField(
                                                obscureText: isObscureText,
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                  fillColor: Color(0XFFF2F2F2),
                                                  filled: true,
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                      onPressed: () {
                                                        isObscureText =
                                                            !isObscureText;
                                                        setState(() {});
                                                      },
                                                      icon: const Icon(Icons
                                                          .remove_red_eye)),
                                                  hintText: "Password",
                                                  // border:
                                                  //     const OutlineInputBorder(
                                                  //         borderSide:
                                                  //             BorderSide())
                                                )),
                                          )),
                                      const SizedBox(height: 8),
                                      FlutterPwValidator(
                                        successColor: primaryColor,
                                        key: validatorKey,
                                        controller: passwordController,
                                        minLength: 8,
                                        uppercaseCharCount: 2,
                                        lowercaseCharCount: 3,
                                        numericCharCount: 3,
                                        specialCharCount: 1,
                                        normalCharCount: 3,
                                        width: 400.w,
                                        height: 200.h,
                                        onSuccess: () {
                                          successPassword = true;
                                        },
                                        onFail: () {
                                          // print("NOT MATCHED");
                                        },
                                      ),
                                    ],
                                  ),
                                  //   )
                                ],
                              ),
                            ),
                          ]),
                          Gap(20.h),
                          Card(
                              elevation: 15,
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      // color: Color(0xffbb2f3c),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 50.h,
                                  width: 330.w,
                                  child: Center(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isAuth = true;
                                            });
                                            handleRegister(successPassword);
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             const SplashScreen()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor: primaryColor),
                                          child: isAuth
                                              ? const CircularProgressIndicator(
                                                  color: Colors.white,
                                                )
                                              : const Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    //  backgroundColor: Color(0xffbb2f3c)
                                                  ),
                                                ))))),
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
                              //  Text("You don`t have an account yet,"),
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account yet?  ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.sp)),
                                TextSpan(
                                    text: 'Login',
                                    style: GoogleFonts.inter(
                                        letterSpacing: 1.w,
                                        // fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0XFF154870)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LogInScreen()));
                                      })
                              ]))
                            ],
                          )
                        ],
                      ))))
        ],
      )),
    ));
  }

  Future<void> handleRegister(bool successPass) async {
    if (formKey.currentState!.validate() && successPassword == true) {
      Map<String, dynamic> userData = {
        "email": emailController.text.toString(),
        "firstName": fNameController.text.toString(),
        "lastName": lNameController.text.toString(),
        "role": "user",
        "password": passwordController.text.toString(),
        "cPassword": passwordController.text.toString(),
        "gender": "male",
        // "role": roleController.text.toString(),
        // "cPassword": rePasswordController.text.toString(),
        // "gender": genderController.text.toString(),
      };
      // get response from ApiClient
      // FutureBuilder(
      //   future: ApiAuth().createUserAccount(userData),
      //   builder: (context, snapshot) {
      //
      //     if (snapshot.hasData) {
      //       return Text('Error: ${[snapshot.data]}');
      //     }
      //     return CircularProgressIndicator();
      //   },
      // );
      dynamic res = await ApiAuth().createUserAccount(userData);
      if (res['success'] == true) {
        setState(() {
          isAuth = false;
        });
        print(userData);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(res['message'])));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       // builder: (context) => roleController.text.trim() == "user"
        //       builder: (context) =>
        //           role == "user" ? SplashScreen() : const AdminBrands(),
        //     ));
      } else {
        setState(() {
          isAuth = false;
        });
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
// Padding(
//   padding: const EdgeInsets.only(
//       left: 10, top: 15, right: 20),
//   child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter a value';
//         }
//         return null;
//       },
//       controller: passwordController,
//       decoration: const InputDecoration(
//           border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: Colors.red)),
//           label: Text("Password"),
//           suffixIcon: Icon(Icons.remove_red_eye),
//           hintText: ("Password"))),
// ),

// Padding(
//   padding: const EdgeInsets.only(
//       left: 10, top: 15, bottom: 25, right: 20),
//   child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter a value';
//         }
//         return null;
//       },
//       controller: rePasswordController,
//       decoration: const InputDecoration(
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                   //color: Colors.red
//                   color: Colors.black)),
//           label: Text("Confirm Password"),
//           suffixIcon: Icon(Icons.remove_red_eye),
//           hintText: ("Confirm Password"))),
// ),
// Padding(
//   padding: const EdgeInsets.only(
//       left: 10, top: 15, bottom: 25, right: 20),
//   child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter a value';
//         }
//         return null;
//       },
//       controller: roleController,
//       decoration: const InputDecoration(
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                   //color: Colors.red
//                   color: Colors.black)),
//           label: Text("Role"),
//           suffixIcon: Icon(Icons.remove_red_eye),
//           hintText: ("Role"))),
// ),
// Padding(
//   padding: const EdgeInsets.only(
//       left: 10, top: 15, bottom: 25, right: 20),
//   child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter a value';
//         }
//         return null;
//       },
//       controller: genderController,
//       decoration: const InputDecoration(
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                   //color: Colors.red
//                   color: Colors.black)),
//           label: Text("Gender"),
//           suffixIcon: Icon(Icons.remove_red_eye),
//           hintText: ("Gender"))),
// ),
