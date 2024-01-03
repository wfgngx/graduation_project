import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/api/auth/sign_up.dart';
import 'package:graduation_project/screens/auth_screen/forget_password_screens/otp.dart';
import 'package:provider/provider.dart';
import '../../../Provider/FireBase/firebase_function.dart';
import '../../../utils/colors/app_colors.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text("Forgot Password",
                          style: GoogleFonts.inter(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                            "At our app, we take the security of your information seriously.",
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
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      // suffixIcon: Icon(Icons.remove_red_eye),
                      fillColor: Color(0xfff5f5f5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red)),
                      label: Text(
                        "Email",
                      ),
                      hintText: ("Enter your Email")),
                ),
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
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isAuth = true;
                            });
                            dynamic passwordResponse = await ApiAuth()
                                .forgotPasswordGetCode(
                                    emailController.text,
                                    Provider.of<MyProvider>(context,
                                                listen: false)
                                            .myToken
                                            .isEmpty
                                        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                        : Provider.of<MyProvider>(context,
                                                listen: false)
                                            .myToken);
                            if (passwordResponse['success'] == true) {
                              print(passwordResponse);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // builder: (context) => roleController.text.trim() == "user"
                                      builder: (context) => OTPScreen(
                                          email: emailController.text)));
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
                            : Text("Get Code",
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
          )),
    ));
  }
}
