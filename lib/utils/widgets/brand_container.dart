import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';

class ModelContainer extends StatelessWidget {
  const ModelContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      FadeInImage(
                          fit: BoxFit.cover,
                          width: 100.w,
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage(
                              "assets/images/bmw_prev_ui.png")),
                      const Text('BMW'),
                      const Text('Model Test'),
                    ],
                  ),
                  FadeInImage(
                      fit: BoxFit.cover,
                      width: 212.w,
                      placeholder: MemoryImage(kTransparentImage),
                      image: const AssetImage("assets/images/bmw_model.png")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 6.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 233, 233, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Row(
                      children: [Icon(Icons.event_seat), Text('5 Seats')],
                    ),
                  ),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 233, 233, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Row(
                      children: [Icon(Icons.speed), Text('135mph')],
                    ),
                  ),
                  // const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 233, 171, 0.71),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Row(
                      children: [Icon(Icons.monetization_on), Text('5000')],
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
