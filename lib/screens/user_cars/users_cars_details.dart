import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/model/user_cars.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class UserCarDetails extends StatefulWidget {
  const UserCarDetails(
      {Key? key,
      required this.imageList,
      required this.userCars,
      required this.rent})
      : super(key: key);
  final List<CarImage> imageList;
  final UserCars userCars;
  final bool rent;

  @override
  State<UserCarDetails> createState() => _UserCarDetailsState();
}

class _UserCarDetailsState extends State<UserCarDetails> {
  Map brandEqual = {
    'ALFA ROMEO': 'assets/logo_brand/Al.png',
    'AUDI': 'assets/logo_brand/audi.webp',
    'BMW': 'assets/logo/BMW.png',
    'CHEVROLET': 'assets/logo/Chevrolet_logo_PNG3.png',
    'CITROEN': 'assets/logo/Citroen_logo_PNG4.png',
    'DAEWOO': 'assets/logo/Daewoo_logo_PNG3.png',
    'DODGE': 'assets/logo/Dodge_logo_PNG10.png',
    'FERRARI': 'assets/logo/Ferrari_logo_PNG11.png',
    'FIAT': 'assets/logo/Fiat_logo_PNG1.gif',
    'FORD': 'assets/logo/Ford_logo_PNG2.png',
    'GEELY': 'assets/logo/Geely_logo_PNG2.png',
    'HONDA': 'assets/logo/Honda_logo_PNG4.png',
    'HUMMER': 'assets/logo_brand/Hummer.webp',
    'JEEP': 'assets/logo_brand/jeep.webp',
    'KIA': 'assets/logo/KIA_logo_PNG2.png',
    'LADA': 'assets/logo/Lada_logo_PNG1.png',
    'LAND ROVER': 'assets/logo/Land-Rover_logo_PNG1.png',
    'MESERATI': 'assets/logo_brand/maserati.webp',
    'MAZDA': 'assets/logo/Mazda_logo_PNG5.png',
    'Mercedes-AMG': 'assets/logo_brand/mercedes-amg.png',
    'MERCEDES BENZ': 'assets/logo/Mercedes.png',
    'MG': 'assets/logo/MG_logo_PNG11.png',
    'MINI': 'assets/logo/MINI_logo_PNG2.png',
    'MITSUBISHI': 'assets/logo/Mitsubishi_logo_PNG3.png',
    'NISSAN': 'assets/logo/Nissan_logo_PNG1.png',
    'OPEL': 'assets/logo/Opel_logo_PNG14.png',
    'PEUGEOT': 'assets/logo_brand/Peugeot.webp',
    'PORSCHE': 'assets/logo/Porsche_logo_PNG5.png',
    'PROTON': 'assets/logo/Proton_logo_PNG2.png',
    'RAM Trucks': 'assets/logo/Ram-Logo-PNG_008.png',
    'RENAULT': 'assets/logo_brand/Renault.webp',
    'SKODA': 'assets/logo/Škoda_logo_PNG3.png',
    'SUBARU': 'assets/logo/Subaru_logo_PNG3.png',
    'MARUTI SUZUKI': 'assets/logo/Maruti_Suzuki_Logo_PNG6.png',
    'SUZUKI': 'assets/logo/Suzuki_logo_PNG2.png',
    'TESLA': 'assets/logo/Tesla.png',
    'TOYOTA': 'assets/logo/Toyota_logo_PNG15.png',
    'VOLVO': 'assets/logo/Volvo_logo_PNG1.png',
    'BYD': 'assets/logo/BYD_logo_PNG5.png',
    'SEAT': 'assets/logo/Seat_logo_PNG3-scaled.jpg',
    'INFINITI': 'assets/logo/Infiniti_logo_PNG10.png',
    'CUPRA': 'assets/logo/Cupra_logo_PNG4.png',
    'DAIHATSU': 'assets/logo/Daihatsu_logo_PNG15.png',
    'HYUNDAI': 'assets/logo/Hyundai_logo_PNG2.png',
    'VOLKSWAGEN': 'assets/logo/Volkswagen_logo_PNG1.png'
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              // backgroundColor: Colors.transparent,
              backgroundColor: secondaryColor,

              // elevation: 5,
              foregroundColor: Colors.white,
              title: Text(
                "Car Specification",
                style: GoogleFonts.actor(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.phone,
                  // color: Colors.white,
                ),
                onPressed: () async {
                  Uri phone = Uri.parse('tel:${widget.userCars.phone}');
                  // Uri phone = Uri.parse(
                  if (await launchUrl(phone)) {
                  } else {}
                }),
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
                child: Stack(
              children: [
                Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: widget.imageList.length,
                      itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) =>
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  elevation: 5,
                                  shadowColor: Colors.white70,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        widget.imageList[index].secureUrl,
                                        width:
                                            MediaQuery.of(context).size.width +
                                                210,
                                        fit: BoxFit.cover,
                                      )))),
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
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      // height: 180,
                      width: 344,
                      // width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: Colors.white
                          color: secondaryColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      widget.userCars.name,
                                      style: GoogleFonts.istokWeb(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Image.asset(
                                      'assets/icons/icons8-car-50.png',
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'car name',
                                      style: GoogleFonts.istokWeb(
                                          color: const Color(0xff838080),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '250 Km/h',
                                      // widget.userCars.,
                                      style: GoogleFonts.istokWeb(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Image.asset(
                                      'assets/icons/icons8-speed-50.png',
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Top Speed',
                                      style: GoogleFonts.istokWeb(
                                          color: const Color(0xff838080),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.userCars.year.toString(),
                                      style: GoogleFonts.istokWeb(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Gap(2),
                                    // Image.asset(
                                    //   'assets/icons/icons8-car-50.png',
                                    //   width: 20,
                                    //   color: Colors.white,
                                    // ),
                                    Text(
                                      'Year',
                                      style: GoogleFonts.istokWeb(
                                          color: const Color(0xff838080),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xffCECECE),
                            indent: 20,
                            endIndent: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-car-50.png',
                                  width: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Brand',
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  widget.userCars.brand,
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-gear-stick-50.png',
                                  width: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Transmission',
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  widget.userCars.transmission,
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-fuel-24.png',
                                  width: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Fuel',
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  widget.userCars.fuel,
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-odometer-50.png',
                                  width: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' Odometer   ',
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                Text(
                                  "${widget.userCars.distance.toString()} Km",
                                  style: GoogleFonts.istokWeb(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: secondaryColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Price',
                                style: GoogleFonts.istokWeb(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.userCars.price.toString(),
                                      style: GoogleFonts.istokWeb(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.white)),
                                  const Icon(
                                    Icons.monetization_on,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        if (widget.rent)
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: secondaryColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Duration',
                                  style: GoogleFonts.istokWeb(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                Text(
                                  "${widget.userCars.duration.toString()} ${widget.userCars.durationType}",
                                  style: GoogleFonts.istokWeb(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          )
                        // : const Gap(1),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: secondaryColor),
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(widget.userCars.description))
                        // const Column(
                        //   children: [
                        //     // Row(
                        //     //   children: [
                        //     //     Column(
                        //     //       children: [],
                        //     //     ),
                        //     //     Column(
                        //     //       children: [],
                        //     //     ),
                        //     //     Column(
                        //     //       children: [],
                        //     //     ),
                        //     //   ],
                        //     // ),
                        //     // Divider(
                        //     //   color: Colors.black54,
                        //     //   indent: 20,
                        //     //   endIndent: 20,
                        //     // ),
                        //     // Row(
                        //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     //   children: [Text('Transmission')],
                        //     // )
                        //   ],
                        // ),
                        ),
                    const Gap(30),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Text("Owner Info",
                          style: GoogleFonts.actor(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                    ),
                    const Divider(
                      color: Colors.white30,
                      indent: 150,
                      endIndent: 150,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16)
                            // borderRadius: BorderRadius.circular(16),
                            // border: Border(
                            //     top: BorderSide(color: Colors.white),
                            //     bottom: BorderSide(color: Colors.white),
                            //     left: BorderSide(color: Colors.white),
                            //     right: BorderSide(color: Colors.white))
                            ),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        (" widget.userCars.firstName"),
                                        style: GoogleFonts.istokWeb(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        (" widget.userCars.lastName"),
                                        style: GoogleFonts.istokWeb(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                  // Text(
                                  //   widget.userCars.name,
                                  //   style: GoogleFonts.istokWeb(
                                  //       fontWeight: FontWeight.w500,
                                  //       fontSize: 20,
                                  //       color: Colors.white),
                                  // )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    widget.userCars.phone,
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'City',
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    widget.userCars.city,
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Location',
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    widget.userCars.location,
                                    style: GoogleFonts.istokWeb(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text('Odometer'),
                              //     Text(widget.userCars.distance.toString())
                              //   ],
                              // ),
                              // Row(
                              //   children: [
                              //     const Text('Fuel'),
                              //     Text(widget.userCars.fuel)
                              //   ],
                              // ),
                              // Row(
                              //   children: [Text('Fuel'), Text(widget.userCars.fuel)],
                              // ),
                            ],
                            // itemCount: 5,
                            // itemBuilder: (context, index) {
                            //   return
                            //
                            // },
                          ),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 250,
                    child: Image.asset(
                      brandEqual[widget.userCars.brand],
                      height: 50,
                      width: 50,
                    ))
              ],
            ))));
  }
}
