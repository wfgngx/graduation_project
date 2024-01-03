import 'dart:io';
import 'package:vector_math/vector_math.dart' as math;

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/screens/auth_screen/logIn_screen.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/explore_cars_screen/select_buy_or_rent.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/home.dart';
import 'package:graduation_project/screens/drawer_screens/favourite.dart';
import 'package:graduation_project/screens/drawer_screens/profile.dart';
import 'package:graduation_project/screens/take_a_photo.dart';
import 'package:graduation_project/screens/user_cars_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../api/auth/sign_up.dart';
import '../../utils/widgets/auth_user_image_picker.dart';

class BottomNavBar extends StatefulWidget {
  // BottomNavBar({Key? key, required this.profileInfo}) : super(key: key);
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
  // Map<String, dynamic> profileInfo;
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> bottomNavBarScreens = [
    const HomeScreen(),
    const Camera(),
    const SelectBuyOrRent()
  ];
  File? profilePic;
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context, listen: false);
    print(myProvider.profileData);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('CARIFY',
              style: GoogleFonts.aBeeZee(
                  letterSpacing: 4, fontSize: 22, fontWeight: FontWeight.bold)),
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: secondaryColor,
        ),
        drawer: Drawer(
            backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
            width: 180.w,
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Center(
                        child: WidgetCircularAnimator(
                      innerColor: Colors.white,
                      outerColor: secondaryColor,
                      reverse: true,
                      innerAnimationSeconds: 3,
                      innerAnimation: Curves.bounceIn,
                      outerAnimation: Curves.decelerate,
                      // singleRing: true,
                      size: 110,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[200]),
                        child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: NetworkImage(
                              myProvider.profileData['result']
                                  ['profilePicture']!,
                            )),
                        // Icon(
                        //   Icons.person_outline,
                        //   color: Colors.deepOrange[200],
                        //   size: 60,
                        // ),
                      ),
                    )),
                    // CircleAvatar(
                    //     radius: 40.r,
                    //     backgroundImage: NetworkImage(
                    //       myProvider.profileData['result']['profilePicture']!,
                    //     )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          myProvider.profileData['result']['firstName']!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          myProvider.profileData['result']['lastName']!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                )),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserCarsScreen(),
                        ));
                  },
                  leading: const Icon(
                    Icons.car_rental,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Your Cars',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavouriteScreen(),
                        ));
                  },
                  leading: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Favorite',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // ProfileScreen(profileInfo: widget.profileInfo),
                              const ProfileScreen(),
                        ));
                  },
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                InkWell(
                    onTap: () async {
                      _rotateDialog();
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.clear();
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LogInScreen(),
                      //   ),
                      //   (Route<dynamic> route) => false,
                      // );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: secondaryColor),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(12),
                                Icon(
                                  Icons.logout,
                                  size: 22,
                                  color: Colors.white,
                                )
                              ],
                            ))))
              ],
            )),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color.fromRGBO(64, 82, 105, 1),
            color: const Color.fromRGBO(39, 55, 77, 1.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.decelerate,
            height: 50.h,
            index: selectedScreen,
            onTap: (index) {
              setState(() {
                selectedScreen = index;
              });
            },
            items: const [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.camera,
                color: Colors.white,
              ),
              Icon(
                Icons.car_rental,
                color: Colors.white,
              ),
            ]),
        backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
        body: bottomNavBarScreens[selectedScreen]);
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm logout"),
      content: const Text("Are you sure you want to log out"),
      actions: <Widget>[
        TextButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.black)))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primaryColor)),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  void _rotateDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return Transform.rotate(
          angle: math.radians(a1.value * 360),
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Future<void> showBottomSheetFun(
      BuildContext context, String fName, String lName) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: secondaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white)),
                            child: const Center(
                                child: Text(
                              "Edit Brand",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )))),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'First Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ))),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        // controller: brandNameControllerEdit,
                        onChanged: (value) {
                          setState(() {
                            // brandNameControllerEdit.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: TextField(
                        // controller: brandCountryControllerEdit,
                        onChanged: (value) {
                          setState(() {
                            // brandCountryControllerEdit.text = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            // print('Edit');
                            // await BrandApiAdmin()
                            //     .editBrand(
                            //     name: brandNameControllerEdit.text,
                            //     country: brandCountryControllerEdit.text,
                            //     image: brandLogoEdit,
                            //     id: id)
                            //     .then((value) {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(const SnackBar(
                            //       backgroundColor: Colors.green,
                            //       content: Text(
                            //         "Data Send Successfully",
                            //         style: TextStyle(color: Colors.white),
                            //       )));
                            //   Navigator.pop(context);
                            //   setState(() {
                            //     fetchBrands();
                            //   });
                            // });
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ],
                )));
      },
    );
  }
}
