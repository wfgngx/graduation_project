import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

import '../utils/widgets/brand_details.dart';

class ModelDetailsScreen extends StatelessWidget {
  ModelDetailsScreen({Key? key, required this.carModel}) : super(key: key);
  CarModel carModel;
  final List<String> details = [
    'name',
    'length',
    'width',
    'height',
    'acceleration',
    'aerodynamics',
    'bodyType',
    'brandId',
    'cargoVolume',
    'cityFuelConsumption',
    'clyinders',
    'co2Emissions',
    'createdAt',
    'displacement',
    'driveType',
    'frontBreaks',
    'frontRearTrack',
    'fuel',
    'fuelCapacity',
    'fullSystem',
    'FuelConsumptionCombined',
    'gearBox',
    'grossWeightLimit',
    'groundClearance',
    'highwayFuelConsumption',
    'power',
    'price',
    'rearBreaks',
    'sales',
    'tireSize',
    'topSpeed',
    'torque',
    'unladenWeight',
    'updatedAt',
    'wheelBase'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            title: Text(carModel.name),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ]),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.network(
              carModel.img,
              fit: BoxFit.cover,
            ),
             Container(
              padding: EdgeInsets.only(left: 10.w, top: 0.h),
              height: 450.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(64))),
              child: Column(
                children: [
                  Text(
                    carModel.name,
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
                    ],
                  ),
                  SizedBox(
                      height: 130.h,
                      width: 500.w,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // showBrandDetails(details[0], carModel.name),
                          showBrandDetails(details[1], carModel.length),
                          showBrandDetails(details[2], carModel.width),
                          showBrandDetails(details[3], carModel.height),
                          showBrandDetails(details[4], carModel.acceleration),
                          showBrandDetails(details[5], carModel.aerodynamics),
                          showBrandDetails(details[6], carModel.bodyType),
                          // showBrandDetails(details[7], carModel.brandId),
                          showBrandDetails(details[8], carModel.cargoVolume),
                          showBrandDetails(
                              details[9], carModel.cityFuelConsumption),
                          showBrandDetails(details[10], carModel.clyinders),
                          showBrandDetails(details[11], carModel.co2Emissions),
                       //   showBrandDetails(details[12], carModel.createdAt),
                          showBrandDetails(details[13], carModel.displacement),
                          showBrandDetails(details[14], carModel.driveType),
                          showBrandDetails(details[15], carModel.frontBreaks),
                          showBrandDetails(
                              details[16], carModel.frontRearTrack),
                          showBrandDetails(details[17], carModel.fuel),
                          showBrandDetails(details[18], carModel.fuelCapacity),
                          showBrandDetails(details[19], carModel.fullSystem),
                          showBrandDetails(
                              details[20], carModel.FuelConsumptionCombined),
                          showBrandDetails(details[21], carModel.gearBox),
                          showBrandDetails(
                              details[22], carModel.grossWeightLimit),
                          showBrandDetails(
                              details[23], carModel.groundClearance),
                          showBrandDetails(
                              details[24], carModel.highwayFuelConsumption),
                          showBrandDetails(details[25], carModel.power),
                          showBrandDetails(
                              details[26], carModel.price.toString()),
                          showBrandDetails(details[27], carModel.rearBreaks),
                          showBrandDetails(
                              details[28], carModel.sales.toString()),
                          showBrandDetails(details[29], carModel.tireSize),
                          showBrandDetails(details[30], carModel.topSpeed),
                          showBrandDetails(details[31], carModel.torque),
                          showBrandDetails(details[32], carModel.unladenWeight),
                        //  showBrandDetails(details[33], carModel.updatedAt),
                          showBrandDetails(details[34], carModel.wheelBase),
                        ],
                      ))
                ],
              ),
            )
          ],
        )));
  }

  Widget showBrandDetails(String key, String value) {
    return SizedBox(
      width: 150.w,
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: BrandDetails(detail: key, test: value),
      ),
    );
  }
}
