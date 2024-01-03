import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Resource/MyColors.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/auth_screen/forget_password_screens/reset_password.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../Provider/FireBase/firebase_function.dart';
import '../../../api/auth/sign_up.dart';
import '../../../utils/colors/app_colors.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  bool isAuth = false;
  bool successPassword = false;

  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  final formKey = GlobalKey<FormState>();
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body:SingleChildScrollView(child:  Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text("OTP Verification",
                          style: GoogleFonts.inter(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                            "Add a PIN number to make your account more secure and easy to sign in.",
                            style: GoogleFonts.inter(
                                color: const Color(0xFF757575),
                                fontWeight: FontWeight.w400,
                                fontSize: 14))),
                    buildPinCodeFields(context),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Divider(
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Form(
                      key: formKey,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
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
                        setState(() {
                          successPassword = true;
                        });
                      },
                      onFail: () {
                        // print("NOT MATCHED");
                      },
                    ),
                    // const Spacer(),
                    SizedBox(
                      height: 46.h,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 50.h,
                      width: 330.w,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isAuth = true;
                                  });
                                  dynamic passwordResponse = await ApiAuth()
                                      .verifyCode(
                                          widget.email,
                                          passwordController.text,
                                          otpCode,
                                          passwordController.text,
                                          Provider.of<MyProvider>(context,
                                                      listen: false)
                                                  .myToken
                                                  .isEmpty
                                              ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                              : Provider.of<MyProvider>(context,
                                                      listen: false)
                                                  .myToken);
                                  if (passwordResponse['success'] == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            // builder: (context) => roleController.text.trim() == "user"
                                            builder: (context) =>
                                                LogInScreen()));
                                  } else {
                                    print(passwordResponse);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Error: ${passwordResponse['message']}'),
                                        backgroundColor: Colors.red.shade300,
                                      ),
                                    );
                                  }
                                }
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
              ),
            ],
          ),
        )));
  }

  Widget buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 60,
          fieldWidth: 50,
          borderWidth: 1,
          activeColor: Colors.green.shade500,
          inactiveColor: primaryColor,
          inactiveFillColor: Colors.grey,
          activeFillColor: Colors.white,
          selectedColor: Colors.black,
          selectedFillColor: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (pinCode) {
        otpCode = pinCode;
      },
      onChanged: (value) {},
      appContext: context,
    );
  }

  // Widget buildVerifyButton(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         // Navigator.push(context, MaterialPageRoute(builder:  (context) =>ResetPassword(),));
  //       },
  //       style: ElevatedButton.styleFrom(
  //           minimumSize: const Size(110, 50),
  //           backgroundColor: primaryColor,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
  //       child: const Text(
  //         'Verify',
  //         style: TextStyle(color: Colors.white, fontSize: 16),
  //       ),
  //     ),
  //   );
  // }
}
