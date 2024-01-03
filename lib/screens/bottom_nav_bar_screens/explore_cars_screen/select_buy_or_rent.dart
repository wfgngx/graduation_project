import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/api/user/user_apis.dart';
import 'package:graduation_project/api/view/car_api.dart';
import 'package:graduation_project/model/user_cars.dart';
import 'package:graduation_project/screens/rent_car.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../sold_car.dart';

class SelectBuyOrRent extends StatefulWidget {
  const SelectBuyOrRent({Key? key}) : super(key: key);

  @override
  State<SelectBuyOrRent> createState() => _SelectBuyOrRentState();
}

class _SelectBuyOrRentState extends State<SelectBuyOrRent> {
  // late List<UserCars> test;
  // @override
  // void initState() {
  //   super.initState();
  //   getCars();
  // }
  //
  // void getCars() async {
  //    test = await UserApis().getCars();
  //   print(test);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              const Spacer(),
              const Text(
                'Discover User Cars',
                style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SoldCars(),
                      )),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: FadeInImage(
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              placeholder: MemoryImage(kTransparentImage),
                              image: const AssetImage(
                                  "assets/images/buy_a_car.jpg"))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32)),
                                // borderRadius: BorderRadius.circular(32),
                                color: Colors.black54,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 44.w),
                              child: const Column(children: [
                                Text(
                                  ("Buy a Car"),
                                  maxLines: 2,
                                  // softWrap: true,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]))),
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RentCars(),
                      )),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: FadeInImage(
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                              placeholder: MemoryImage(kTransparentImage),
                              image: const AssetImage(
                                  "assets/images/rent_a_car.jpg"))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32)),
                                color: Colors.black54,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 44.w),
                              child: const Column(children: [
                                Text(
                                  ("Rent a Car"),
                                  maxLines: 2,
                                  // softWrap: true,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ]))),
                    ],
                  )),
              const Spacer(),
            ])));
  }
}
