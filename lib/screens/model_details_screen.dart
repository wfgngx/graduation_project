import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

import '../utils/widgets/brand_details.dart';

class ModelDetailsScreen extends StatelessWidget {
  const ModelDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ]),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset('assets/images/bmw_model.png'),
            SizedBox(
                child: Container(
              padding: EdgeInsets.only(left: 10.w, top: 0.h),
              height: 450.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(64))),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BMW MODEL',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Thanks to its striking face, a BMW is recognisable at first glance: two kidney-shaped air intakes – the "kidney" grille – with the BMW emblem above and two double-round headlights have been distinguis hing every BMW for more than 40 years. Depending on the character of the vehicle, theindividual features exhibit degrees of  elegance,dynamism or sheer presence.',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white60),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   "Price: 2000",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24.sp),
                      // )
                    ],
                  ),
                  SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return const Padding(
                              padding: EdgeInsets.all(6),
                              child: BrandDetails());
                        },
                      )),
                ],
              ),
            ))
          ],
        )));
  }
}
