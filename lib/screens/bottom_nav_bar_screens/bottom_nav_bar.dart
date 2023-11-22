import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/explore_cars_screen/select_buy_or_rent.dart';
import 'package:graduation_project/screens/bottom_nav_bar_screens/home.dart';
import 'package:graduation_project/screens/take_a_photo.dart';
import 'package:graduation_project/screens/user_cars_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> bottomNavBarScreens = [
    HomeScreen(),
    const Camera(),
    SelectBuyOrRent()
  ];

  int selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'App Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
            backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
            width: 180.w,
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage(
                          'assets/images/circle_avatar_logIn_img.jpg'),
                    ),
                    // SizedBox(height: 12.h,),
                    const Text(
                      '01204154971',
                      style: TextStyle(color: Colors.white30),
                    ),
                    const Text(
                      'Mahmoud Youssef',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
                  ListTile(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const UserCarsScreen(),));
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
                const ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Favorite',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
}
