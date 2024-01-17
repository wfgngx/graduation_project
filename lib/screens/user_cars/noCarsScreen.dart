import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/screens/user_cars/user_cars_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class NoCarsScreen extends StatelessWidget {
  const NoCarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/brand_last/Ellipse 3.svg'),
          const Text('There are no cars yet!'),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  UserCarsScreen(),
                        ));
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: secondaryColor),
                    child: const Center(
                      child: Text("Add a car"),
                    ),
                  )),
              // Container(
              //   width: 100,
              //   height: 30,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       color: secondaryColor),
              //   child: Center(
              //     child: Text("Cancel"),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
