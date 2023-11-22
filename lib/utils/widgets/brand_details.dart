import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandDetails extends StatelessWidget {
  const BrandDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        SizedBox(
          width: 100.w,
          height: 80.h,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffACC5D5),
                  borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.speed),
                    Text('Top Speed'),
                    Row(
                      children: [
                        Text(
                          '360',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Km/h')
                      ],
                    )
                  ],
                ),
              )));
        // SizedBox(
        //     width: 100.w,
        //     height: 80.h,
        //     child: Container(
        //         decoration: BoxDecoration(
        //             color: const Color(0xffACC5D5),
        //             borderRadius: BorderRadius.circular(24)),
        //         child: const Padding(
        //           padding: EdgeInsets.all(6),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Icon(Icons.event_seat),
        //               Text('Capacity'),
        //               Row(
        //                 children: [
        //                   Text(
        //                     '5',
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text('Seats')
        //                 ],
        //               )
        //             ],
        //           ),
        //         )));
  }
}
