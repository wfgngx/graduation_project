import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:transparent_image/transparent_image.dart';

class ModelContainer extends StatelessWidget {
  ModelContainer(
      {Key? key,
      required this.speed,
      required this.image,
      required this.model,
      required this.brandImage,
      required this.price})
      : super(key: key);
  String speed;
  String image;
  String price;
  String model;
  String brandImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: SizedBox(
            height: 225.h,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(model,
                                  style: GoogleFonts.cardo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white)),
                              Image.asset(
                                brandImage,
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ))),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage(
                            fit: BoxFit.fill,
                            height: 120.h,
                            width: 220.w,
                            placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(image)),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(234, 233, 233, 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.event_seat), Text('5 Seats')],
                        ),
                      ),
                      // SizedBox(
                      //   width: 10.w,
                      // ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(234, 233, 233, 1),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [const Icon(Icons.speed), Text(speed)],
                        ),
                      ),
                      // const Spacer(),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(240, 233, 171, 0.71),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.monetization_on),
                            Text(
                              price,
                              style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
