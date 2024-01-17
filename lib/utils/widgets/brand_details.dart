import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/model/car_model.dart';

class BrandDetails extends StatelessWidget {
  const BrandDetails({Key? key, required this.detail, required this.test,required this.iconImage})
      : super(key: key);
  final String detail;
  final String test;
  final String iconImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        // height: 80.h,
        child: Container(
            decoration: BoxDecoration(
                // color: Colors.white,
                color: const Color(0xffACC5D5),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const Icon(Icons.speed),
                  Image.asset(iconImage,width: 20,),
                  Text(
                    detail.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        test,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          //   fontWeight: FontWeight.bold
                        ),
                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
