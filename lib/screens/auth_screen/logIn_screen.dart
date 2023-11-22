import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/auth_screen/signUp_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:primaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
                height: 210.h,
                width: 360.w,
                color: primaryColor,
                //  color: const Color(0xffbb2f3c),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Image.asset("assets/images/logo_gp.PNG",width: 360.w,height: 200.h,fit: BoxFit.contain,)
                      CircleAvatar(
                        backgroundImage: const AssetImage(
                            "assets/images/logo_gp.PNG"),
                        radius: 85.r,
                      ),

                    ],
                  ),
                )),
            Container(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            suffixIcon: Icon(Icons.email),
                            label: Text("E-mail"),
                            hintText: ("Enter your e-mail")),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            suffixIcon: Icon(Icons.remove_red_eye),
                            fillColor: Color(0xfff5f5f5),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red)),
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
                          child: Row(children: [
                            /*
                          SizedBox(
                              width: 20,
                              height: 20,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.save_rounded,color: Colors.red,),
                                label: Text(""),


                              )),

                               */
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 10),
                            //   child: Text("Remember me"),
                            // ),
                            /*   ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: Text("clickTest"))

                          */
                          ]),
                        ),
                        // Padding(
                        //     padding: EdgeInsets.only(right: 15, bottom: 10),
                        //     child: Column(
                        //       children: [
                        //         Text("Forgot Password"),
                        //
                        //         /*
                        //     Divider(
                        //       color: Colors.orange,
                        //       thickness: 20
                        //       ,height: 100,)
                        //
                        //      */
                        //       ],
                        //     ))
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          // color: Color(0xffbb2f3c),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 50.h,
                      width: 330.w,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //         const HomeScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, backgroundColor:primaryColor
                                  // backgroundColor: const Color(0xffbb2f3c),
                                  // Text Color (Foreground color)
                                  ),
                              child: Text("Sign in",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      //  backgroundColor: Color(0xffbb2f3c)),
                                      )))
                          /*
                        Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),

                         */

                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "By clicking 'Sign in' you agree to our Terms of the",
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Privacy policy",
                        style: TextStyle(fontSize: 12.sp, color: primaryColor),
                      ),
                    ),
                    // Text(
                    //   "Or Sign in with",
                    //   style: TextStyle(fontSize: 18.sp),
                    // ),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Padding(
                    //       padding:
                    //           EdgeInsets.only(right: 35, top: 10, bottom: 10),
                    //       child: CircleAvatar(
                    //         backgroundImage: AssetImage(
                    //             'assets/images/circle_avatar_logIn_img.jpg'),
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
                                      color: Colors.black, fontSize: 14.sp)),
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

                        /*
                        Text(
                          "Sign up",
                          style: TextStyle(color: Colors.red),
                        )

                         */
                      ],
                    )
                  ],
                )))
          ]),
        ));
  }
}
//   Scaffold(
//   body: Column(
//     children: [
//       CircleAvatar(
//         radius: 50.r,
//         backgroundImage:
//             const AssetImage('assets/images/circle_avatar_logIn_img.jpg'),
//       ),
//       SizedBox(
//         height: 40.h,
//       ),
//       const TextField(
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Color(0xeaeaeaff),
//             label: Text("User Name"),
//             prefixIcon: Icon(Icons.person)),
//       ),
//       SizedBox(
//         height: 20.h,
//       ),
//       const TextField(
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Color(0xffeaeaeaff),
//             label: Text("Password"),
//             prefixIcon: Icon(Icons.lock)),
//       ),
//       SizedBox(
//         height: 20.h,
//       ),
//       Container(
//         decoration: const BoxDecoration(color: Color(0xff353c44ff)),
//         height: 20.h,
//         width: 60.w,
//         child: const Text("Login"),
//       ),
//       SizedBox(
//         height: 30.h,
//       ),
//       const Text('Forget Password'),
//       SizedBox(
//         height: 30.h,
//       ),
//       const Row(
//         children: [
//           Text('don`t have an account?'),
//           Text('Sign Up'),
//         ],
//       )
//     ],
//   ),
// );
//   }
// }
