import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyContainer extends StatelessWidget {
  const CompanyContainer({Key? key, required this.img, required this.brandName})
      : super(key: key);
  final String img;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 90.h,
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Image.asset(
            img,
            fit: BoxFit.contain,
            width: 80,
            height: 80,
          ),
          Text(
            brandName,
            style: const TextStyle(
               color: Colors.white,fontSize: 14),
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}
// 22,37,58
// 17,31,51
