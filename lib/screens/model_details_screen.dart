import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/api/view/car_api.dart';
import 'package:graduation_project/screens/agency/agency.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

import '../utils/widgets/brand_details.dart';

class ModelDetailsScreen extends StatelessWidget {
  ModelDetailsScreen(
      {Key? key,
      required this.carModel,
      required this.listImage,
      required this.productionYears})
      : super(key: key);
  CarModel carModel;
  List listImage;
  List productionYears;
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
    'cylinders',
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
  final List<String> iconsPath = [
    'assets/icons/icons8-car-50.png',
    'assets/caricons/width.png',
    'assets/caricons/height.png',
    'assets/caricons/acceleration.png',
    'assets/caricons/aero.png',
    'assets/caricons/icons8-hatchback-50.png',
    'assets/caricons/icons8-cargo-50.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/caricons/piston.png',
    'assets/caricons/icons8-co2-50.png',
    'assets/icons/icons8-car-50.png',
    'assets/caricons/driveType.png',
    'assets/caricons/break.png',
    'assets/caricons/break.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/icons/icons8-gear-stick-50.png',
    'assets/caricons/weight.png',
    'assets/icons/icons8-car-50.png',
    'assets/icons/icons8-fuel-24.png',
    'assets/icons/icons8-car-50.png',
    'assets/caricons/dollar.png',
    'assets/caricons/break.png',
    'assets/caricons/sales.png',
    'assets/caricons/tire_size.png',
    'assets/icons/icons8-speed-50.png',
    'assets/caricons/tire_size.png',
    'assets/caricons/weight.png',
    'assets/caricons/tire_size.png',
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context).myToken;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            title: Text(
              carModel.name,
              style: GoogleFonts.agdasima(
                  letterSpacing: 3, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: secondaryColor,
            // backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () async {
                    await CarApi().addFavoriteCar(carModel.id, provider);
                  },
                  icon: const Icon(Icons.favorite))
            ]),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: listImage.length,
                      itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) =>
                          ClipRRect(
                              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32)),
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Image.network(
                                    listImage[index],
                                    width:
                                        MediaQuery.of(context).size.width + 210,
                                    fit: BoxFit.cover,
                                  ))),
                      options: CarouselOptions(
                        autoPlay: true,
                        // animateToClosest: true,
                        autoPlayCurve: Curves.decelerate,
                        // aspectRatio: constraints.maxWidth / constraints.maxHeight,
                        // height: 300,
                        viewportFraction: 1,
                        // autoPlay: true
                      ),
                    ),
                    // Image.network(
                    //   carModel.img,
                    //   fit: BoxFit.cover,
                    // ),
                    Container(
                      padding: EdgeInsets.only(left: 0.w, top: 0.h),
                      // height: 600.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Overview',
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
                                  showBrandDetails(details[1], carModel.length,
                                      iconsPath[0]),
                                  showBrandDetails(
                                      details[2], carModel.width, iconsPath[1]),
                                  showBrandDetails(details[3], carModel.height,
                                      iconsPath[2]),
                                  showBrandDetails(details[4],
                                      carModel.acceleration, iconsPath[3]),
                                  showBrandDetails(details[5],
                                      carModel.aerodynamics, iconsPath[4]),
                                  showBrandDetails(details[6],
                                      carModel.bodyType, iconsPath[5]),
                                  showBrandDetails(details[8],
                                      carModel.cargoVolume, iconsPath[6]),
                                  showBrandDetails(
                                      details[9],
                                      carModel.cityFuelConsumption,
                                      iconsPath[7]),
                                  showBrandDetails('cylinders',
                                      carModel.clyinders, iconsPath[8]),
                                  showBrandDetails(details[11],
                                      carModel.co2Emissions, iconsPath[9]),
                                  showBrandDetails(details[13],
                                      carModel.displacement, iconsPath[10]),
                                  showBrandDetails(details[14],
                                      carModel.driveType, iconsPath[11]),
                                  showBrandDetails(details[15],
                                      carModel.frontBreaks, iconsPath[12]),
                                  showBrandDetails(details[16],
                                      carModel.frontRearTrack, iconsPath[13]),
                                  showBrandDetails(details[17], carModel.fuel,
                                      iconsPath[14]),
                                  showBrandDetails(details[18],
                                      carModel.fuelCapacity, iconsPath[15]),
                                  showBrandDetails(details[19],
                                      carModel.fullSystem, iconsPath[16]),
                                  showBrandDetails(
                                      details[20],
                                      carModel.fuelConsumptionCombined,
                                      iconsPath[17]),
                                  showBrandDetails(details[21],
                                      carModel.gearBox, iconsPath[18]),
                                  showBrandDetails(details[22],
                                      carModel.grossWeightLimit, iconsPath[19]),
                                  showBrandDetails(details[23],
                                      carModel.groundClearance, iconsPath[20]),
                                  showBrandDetails(
                                      details[24],
                                      carModel.highwayFuelConsumption,
                                      iconsPath[21]),
                                  showBrandDetails(details[25], carModel.power,
                                      iconsPath[22]),
                                  showBrandDetails(
                                      details[26],
                                      carModel.avgPrice.toString(),
                                      iconsPath[23]),
                                  showBrandDetails(details[27],
                                      carModel.rearBreaks, iconsPath[24]),
                                  showBrandDetails(details[28],
                                      carModel.sales.toString(), iconsPath[25]),
                                  showBrandDetails(details[29],
                                      carModel.tireSize, iconsPath[26]),
                                  showBrandDetails(details[30],
                                      carModel.topSpeed, iconsPath[27]),
                                  showBrandDetails(details[31], carModel.torque,
                                      iconsPath[28]),
                                  showBrandDetails(details[32],
                                      carModel.unladenWeight, iconsPath[29]),
                                  showBrandDetails(details[34],
                                      carModel.wheelBase, iconsPath[30]),
                                ],
                              )),
                          // SizedBox(
                          //     height: 130.h,
                          //     width: 500.w,
                          //     child: ListView(
                          //       scrollDirection: Axis.horizontal,
                          //       children: [
                          //         showBrandDetails(details[17], carModel.fuel),
                          //         showBrandDetails(details[18], carModel.fuelCapacity),
                          //         showBrandDetails(details[19], carModel.fullSystem),
                          //         showBrandDetails(
                          //             details[20], carModel.FuelConsumptionCombined),
                          //         showBrandDetails(details[21], carModel.gearBox),
                          //         showBrandDetails(
                          //             details[22], carModel.grossWeightLimit),
                          //         showBrandDetails(
                          //             details[23], carModel.groundClearance),
                          //         showBrandDetails(
                          //             details[24], carModel.highwayFuelConsumption),
                          //         showBrandDetails(details[25], carModel.power),
                          //         showBrandDetails(
                          //             details[26], carModel.avgPrice.toString()),
                          //         showBrandDetails(details[27], carModel.rearBreaks),
                          //         showBrandDetails(
                          //             details[28], carModel.sales.toString()),
                          //         showBrandDetails(details[29], carModel.tireSize),
                          //         showBrandDetails(details[30], carModel.topSpeed),
                          //         showBrandDetails(details[31], carModel.torque),
                          //         showBrandDetails(details[32], carModel.unladenWeight),
                          //         showBrandDetails(details[34], carModel.wheelBase),
                          //       ],
                          //     )),
                          const SizedBox(
                            height: 12,
                          ),
                          Divider(
                            color: Colors.white,
                            height: 1.h,
                            indent: 20.w,
                            endIndent: 20.w,
                          ),
                          const Gap(22),
                          Text(
                            'Years of production',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 50,
                            // width: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productionYears.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      "- ${productionYears[index].toString()}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Divider(
                            color: Colors.white,
                            height: 1.h,
                            indent: 20.w,
                            endIndent: 20.w,
                          ),
                          const Gap(10),
                          Text(
                            'AGENCY',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: 200.h,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 2.3,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Agency(
                                                carColors: carModel.carColors,
                                                listImage: carModel.listImage,
                                                carModel: carModel,
                                                // agencyName: carModel
                                                //     .dealerShips![index]
                                                //     .dealerShipName!
                                                dealerShips: carModel
                                                    .dealerShips![index],
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Container(
                                            // height: 50,
                                            // width: 50,

                                            decoration: BoxDecoration(
                                                // color: third,
                                                color: const Color(0xffACC5D5),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Center(
                                                child: Text(
                                              carModel.dealerShips![index]
                                                  .dealerShipName!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          )));
                                },
                              )
                              // ListView.builder(
                              //   itemCount: carModel.dealerShips!.length,
                              //   itemBuilder: (context, index) {
                              //     return Padding(
                              //         padding: const EdgeInsets.all(16),
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //           children: [
                              //             Text(
                              //               carModel.dealerShips![index].dealerShipName!,
                              //               style: const TextStyle(
                              //                   color: Colors.white,
                              //                   fontSize: 18,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             Text(
                              //               carModel.dealerShips![index].dealerShipPrice
                              //                   .toString(),
                              //               style: const TextStyle(
                              //                   color: Colors.white,
                              //                   fontSize: 18,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             InkWell(
                              //                 onTap: () {
                              //                   launchContactWithNumber(carModel
                              //                       .dealerShips![index]
                              //                       .dealerShipPhone!);
                              //                 },
                              //                 child: const Icon(
                              //                   Icons.call,
                              //                   color: Colors.white,
                              //                 ))
                              //           ],
                              //         )
                              //         // Text(
                              //         //   carModel.dealerShips![index].dealerShipName!,
                              //         //   style: const TextStyle(
                              //         //       color: Colors.white,
                              //         //       fontSize: 18,
                              //         //       fontWeight: FontWeight.bold),
                              //         // )
                              //         );
                              //   },
                              // ),
                              )
                        ],
                      ),
                    ),
                  ],
                ))));
  }

  Widget showBrandDetails(String key, String value, String iconImage) {
    return SizedBox(
      width: 150.w,
      height: 200.h,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: BrandDetails(detail: key, test: value, iconImage: iconImage),
      ),
    );
  }

  void launchContactWithNumber(String phoneNumber) async {
    final url =
        'tel:$phoneNumber'; // Replace with the specific contact's ID or phone number

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // Handle error, e.g., display an error message
      print('Could not launch $url');
    }
  }
}
