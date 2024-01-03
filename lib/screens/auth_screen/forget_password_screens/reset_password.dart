import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors/app_colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  bool isAuth = false;

  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Text("Reset Password",
                              style: GoogleFonts.inter(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24)),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text("Enter a Strong Password.",
                                style: GoogleFonts.inter(
                                    color: const Color(0xFF757575),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                        obscureText: isObscureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                            label: const Text("Password"),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isObscureText = !isObscureText;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                            hintText: "New Password",
                            border: const OutlineInputBorder(
                                borderSide: BorderSide()))),
                  ),
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
                      //  successPassword = true;
                    },
                    onFail: () {
                      // print("NOT MATCHED");
                    },
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50.h,
                    width: 330.w,
                    child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              // if (formKey.currentState!.validate()) {
                              //   setState(() {
                              //     isAuth = true;
                              //   });
                              //   dynamic passwordResponse = await ApiAuth()
                              //       .forgotPasswordGetCode(emailController.text);
                              //   if (passwordResponse['success'] == true) {
                              //     print(passwordResponse);
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           // builder: (context) => roleController.text.trim() == "user"
                              //             builder: (context) => OTPScreen()));
                              //   } else {
                              //     print(passwordResponse);
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //         content: Text(
                              //             'Error: ${passwordResponse['message']}'),
                              //         backgroundColor: Colors.red.shade300,
                              //       ),
                              //     );
                              //   }
                              // }
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: primaryColor),
                            child: isAuth
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Reset Password",
                                    style: GoogleFonts.inter(
                                        letterSpacing: 2,
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600)))),
                  ),
                  SizedBox(
                    height: 18.h,
                  )
                ],
              ),
            )));
  }
}
