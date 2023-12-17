import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/model/car_model.dart';

class BrandDetails extends StatelessWidget {
  const BrandDetails({Key? key,required this.detail,required this.test}) : super(key: key);
  final  String detail;
  final String test;

  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
          width: 100.w,
          // height: 80.h,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffACC5D5),
                  borderRadius: BorderRadius.circular(16)),
              child:  Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.speed),
                    Text(detail.toString()),
                    Row(
                      children: [
                        Text(
                          test,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )));
  }
}
