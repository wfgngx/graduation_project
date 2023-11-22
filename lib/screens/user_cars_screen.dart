import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class UserCarsScreen extends StatelessWidget {
  const UserCarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Add a new car",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Container(
                  height: 300.h,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 32,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 32,
                            )),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // const Divider(
                //   color: Colors.white,
                // ),
                const Text(
                  "About You",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),

                const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  hintText: "Enter your Name",
                  hintStyle: TextStyle(color: Colors.white30),
                )),

                SizedBox(
                  height: 8.h,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Enter your Phone Number",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),

                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Enter your Address",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),

                // const Divider(
                //   color: Colors.white,
                // ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "About Your Car",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),

                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Enter car Brand",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),

                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Enter car Model",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: "Enter car Price",
                    hintStyle: TextStyle(color: Colors.white30),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 150.w,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                elevation: MaterialStatePropertyAll(10)),
                            onPressed: () {},
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                    SizedBox(
                        width: 150.w,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                elevation: MaterialStatePropertyAll(10)),
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
