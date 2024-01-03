import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'dart:io';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import '../../api/auth/sign_up.dart';
import '../../utils/widgets/auth_user_image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdited = false;
  File? profilePic;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var myProfileProvider =
        Provider.of<MyProvider>(context, listen: false).profileData;
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: secondaryColor,
            title: const Text("Profile"),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text('Personal Information',
                        style: GoogleFonts.inter(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)
                        // TextStyle(
                        //     letterSpacing: 2,
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.w700),
                        ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: WidgetCircularAnimator(
                      innerColor: Colors.white,
                      outerColor: secondaryColor,
                      reverse: true,
                      innerAnimationSeconds: 3,
                      innerAnimation: Curves.bounceIn,
                      outerAnimation: Curves.easeInBack,
                      // singleRing: true,
                      size: 205.r,
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                          child: isEdited
                              ? AuthUserImagePicker(
                                  edit: true,
                                  radius: 70.r,
                                  oldImage: myProfileProvider['result']
                                      ['profilePicture']!,
                                  selectedImageFunction:
                                      (mySelectedImage) async {
                                    profilePic = mySelectedImage;
                                    Map<String, dynamic> changePicResponse =
                                        await ApiAuth().editProfilePic(
                                            image: profilePic,
                                            token: Provider.of<MyProvider>(
                                                    context,
                                                    listen: false)
                                                .myToken);
                                    if (changePicResponse['success'] = true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                "Profile Picture Updated Successfully!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                    setState(() {});
                                  },
                                )
                              : CircleAvatar(
                                  radius: 80.r,
                                  backgroundImage: NetworkImage(
                                      myProfileProvider['result']
                                          ['profilePicture']!))
                          // Stack(
                          //   alignment: AlignmentDirectional.bottomCenter,
                          //   children: [
                          //     isEdited
                          //         ? AuthUserImagePicker(
                          //             radius: 80.r,
                          //             oldImage: myProfileProvider['result']
                          //                 ['profilePicture']!,
                          //             selectedImageFunction:
                          //                 (mySelectedImage) async {
                          //               profilePic = mySelectedImage;
                          //               Map<String, dynamic> changePicResponse =
                          //                   await ApiAuth().editProfilePic(
                          //                       image: profilePic,
                          //                       token: Provider.of<MyProvider>(
                          //                               context,
                          //                               listen: false)
                          //                           .myToken);
                          //               if (changePicResponse['success'] =
                          //                   true) {
                          //                 ScaffoldMessenger.of(context)
                          //                     .showSnackBar(const SnackBar(
                          //                         backgroundColor: Colors.green,
                          //                         content: Text(
                          //                           "Profile Picture Updated Successfully!",
                          //                           style: TextStyle(
                          //                               color: Colors.white),
                          //                         )));
                          //               }
                          //               setState(() {});
                          //             },
                          //           )
                          //         : CircleAvatar(
                          //             radius: 80.r,
                          //             backgroundImage: NetworkImage(
                          //                 myProfileProvider['result']
                          //                     ['profilePicture']!))
                          //   ],
                          // )
                          ),
                    )),
                  ],
                ),
              ),
              isEdited == false
                  ? Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: secondaryColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'First Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    myProfileProvider['result']['firstName']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: secondaryColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Last Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    myProfileProvider['result']['lastName']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: secondaryColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    myProfileProvider['result']['email']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: secondaryColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Gender',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    myProfileProvider['result']['gender']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isEdited = true;
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(16)),
                                  width: 200.w,
                                  child: const Center(
                                      child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  )),
                                ))),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )
                  : Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: TextFormField(
                              controller: firstName,
                              validator: (value) {
                                if (firstName.text.isEmpty) {
                                  firstName.text =
                                      myProfileProvider['result']['lastName'];
                                }
                                return null;
                              },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter a value';
                              //   }
                              //   return null;
                              // },
                              decoration: const InputDecoration(
                                  filled: true,
                                  // suffixIcon: Icon(Icons.remove_red_eye),
                                  fillColor: Color(0xfff5f5f5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.red)),
                                  label: Text(
                                    "First Name",
                                  ),
                                  hintText: ("Enter your first name")),
                            ),
                          ),
                          // const Text('Last Name',style: TextStyle(color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: TextFormField(
                              controller: lastName,
                              validator: (value) {
                                if (lastName.text.isEmpty) {
                                  lastName.text =
                                      myProfileProvider['result']['lastName'];
                                  //return 'Please enter a value';
                                }
                                return null;
                              },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     value =
                              //         myProfileProvider['result']['lastName'];
                              //     //return 'Please enter a value';
                              //   }
                              //   return null;
                              // },
                              decoration: const InputDecoration(
                                  filled: true,
                                  // suffixIcon: Icon(Icons.remove_red_eye),
                                  fillColor: Color(0xfff5f5f5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.red)),
                                  label: Text(
                                    "Last Name",
                                  ),
                                  hintText: ("Enter your last name")),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      dynamic changeUserNameResponse =
                                          await ApiAuth()
                                              .changeUserName(
                                                  firstName.text,
                                                  lastName.text,
                                                  Provider.of<MyProvider>(
                                                          context,
                                                          listen: false)
                                                      .myToken)
                                              .then((value) async {
                                        Map<String, dynamic> myData =
                                            await ApiAuth().getUserData(
                                                Provider.of<MyProvider>(context,
                                                        listen: false)
                                                    .myToken);
                                        Provider.of<MyProvider>(context,
                                                listen: false)
                                            .getProfileData(myData);
                                      });
                                      // print(myLastData);

                                      print(changeUserNameResponse);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Name Updated Successfully")));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavBar(),
                                            // MaterialPageRoute(
                                            //   builder: (context) => BottomNavBar(
                                            //       profileInfo: myProfileProvider),
                                          ));
                                    }

                                    // setState(() {
                                    //   isEdited = true;
                                    // });
                                  },
                                  child: Container(
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    width: 100.w,
                                    child: const Center(
                                        child: Text(
                                      "Save",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                  )),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isEdited = false;
                                    });
                                  },
                                  child: Container(
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    width: 100.w,
                                    child: const Center(
                                        child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          letterSpacing: 2,
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                  ))
                            ],
                          )
                        ],
                      ))
              // const Text('Email')
            ],
          ))),
    );
  }
}
