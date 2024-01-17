import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

class Agency extends StatefulWidget {
  const Agency(
      {Key? key,
      required this.dealerShips,
      required this.carModel,
      required this.carColors,
      required this.listImage})
      : super(key: key);
  final DealerShips dealerShips;
  final CarModel carModel;
  final List listImage;
  final List carColors;

  @override
  State<Agency> createState() => _AgencyState();
}

class _AgencyState extends State<Agency> {
  bool location = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () async {
          final url = "https://wa.me/${0201204154971}'";

          if (await launchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw 'Could not launch $url';
          }
        }
        // onPressed: () async {
        //   Uri phone = Uri.parse('tel:${widget.dealerShips.dealerShipPhone}');
        //   // Uri map = Uri.parse(
        //   //     'google.navigation:q=30.625780884512597, 31.491054732799576&mode=d');
        //   if (await launchUrl(phone)) {
        //     //dialer opened
        //   } else {
        //     //dailer is not opened
        //   }
        // },
        ,
        child: const Icon(
          Icons.chat_bubble,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.dealerShips.dealerShipName.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                itemCount: widget.listImage.length,
                itemBuilder: (BuildContext context, int index,
                        int pageViewIndex) =>
                    ClipRRect(
                        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32)),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.network(
                              widget.listImage[index],
                              width: MediaQuery.of(context).size.width + 210,
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
            ),
            const SizedBox(height: 24),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(116))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(12),
                  Text(
                    widget.carModel.name,
                    style: GoogleFonts.agdasima(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.dealerShips.dealerShipPrice.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Gap(12),
                                Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Available',
                              style: TextStyle(color: Colors.white),
                            ),
                            widget.dealerShips.stock! > 0
                                ? const Icon(
                                    CupertinoIcons.lightbulb_fill,
                                    color: Colors.yellow,
                                  )
                                : const Icon(
                                    CupertinoIcons.lightbulb_slash_fill,
                                    color: Colors.grey,
                                  )
                            // Text(dealerShips.dealerShipPrice.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    endIndent: 20,
                    indent: 20,
                    color: Colors.white,
                  ),
                  Gap(12),
                  const Center(
                    child: Text(
                      "Available car colors",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.carColors[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        widget.carColors[1],
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        widget.carColors[2],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const Divider(
                    endIndent: 20,
                    indent: 20,
                    color: Colors.white,
                  ),
                  const Gap(12),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Full Option',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    widget.dealerShips.fullOption == true
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                        : const Icon(
                                            Icons.cancel_rounded,
                                            color: Colors.white,
                                            size: 22,
                                          )
                                    // Text(
                                    //   dealerShips.fullOption.toString(),
                                    //   style: TextStyle(color: Colors.white),
                                    // )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Available Car Number',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: secondaryColor),
                                      child: Center(
                                          child: Text(
                                        widget.dealerShips.stock.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))),
                  // if (dealerShips.fullOption!)
                  const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        style: TextStyle(color: Colors.white),
                        'A full option car typically refers to a vehicle equipped with premium features and options, including luxury amenities, advanced technology, safety enhancements, and high-performance elements, making it a comprehensive and top-of-the-line model.',
                      )),
                  InkWell(
                      onTap: () => setState(() {
                            location = true;
                          }),
                      child: Center(
                          child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text(
                          "Locations",
                          style: TextStyle(color: Colors.white),
                        )),
                      ))),
                  if (location)
                    SizedBox(
                        width: 400,
                        height: 300,
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                                child: ListView(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'First 6th of October, Giza Governorate',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            IconButton(
                                                onPressed: () async {
                                                  Uri map = Uri.parse(
                                                      'google.navigation:q=29.980252705044087, 30.97137187334942&mode=d');
                                                  if (await launchUrl(map)) {
                                                    //dialer opened
                                                  } else {
                                                    //dailer is not opened
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Gap(12),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'الكابيتال بيزنس بارك - مبني 7 - مدينة الشيخ زايد،,',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  // Uri phoneno = Uri.parse('tel:${dealerShips.dealerShipPhone}');
                                                  Uri map = Uri.parse(
                                                      'google.navigation:q=30.037928703258974, 31.01325724925538&mode=d');
                                                  if (await launchUrl(map)) {
                                                    //dialer opened
                                                  } else {
                                                    //dailer is not opened
                                                  }
                                                },
                                                // onPressed: () {30.037928703258974, 31.01325724925538},
                                                icon: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'First 6th of October, Giza Governorate',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            IconButton(
                                                onPressed: () async {
                                                  // Uri phoneno = Uri.parse('tel:${dealerShips.dealerShipPhone}');
                                                  Uri map = Uri.parse(
                                                      'google.navigation:q=29.980252705044087, 30.97137187334942&mode=d');
                                                  if (await launchUrl(map)) {
                                                    //dialer opened
                                                  } else {
                                                    //dailer is not opened
                                                  }
                                                },
                                                // onPressed: () {29.980252705044087, 30.97137187334942},
                                                icon: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Gap(12),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'Capital Business Park - Building #B7،',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            IconButton(
                                                onPressed: () async {
                                                  // Uri phoneno = Uri.parse('tel:${dealerShips.dealerShipPhone}');
                                                  Uri map = Uri.parse(
                                                      'google.navigation:q=30.046844677640305, 31.036603196481654&mode=d');
                                                  if (await launchUrl(map)) {
                                                    //dialer opened
                                                  } else {
                                                    //dailer is not opened
                                                  }
                                                },
                                                // onPressed: () {30.046844677640305, 31.036603196481654},
                                                icon: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'Bashtil, Al Warak, Giza Governorate',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            IconButton(
                                                onPressed: () async {
                                                  // Uri phoneno = Uri.parse('tel:${dealerShips.dealerShipPhone}');
                                                  Uri map = Uri.parse(
                                                      'google.navigation:q=30.069428221635775, 31.180112107615624&mode=d');
                                                  if (await launchUrl(map)) {
                                                    //dialer opened
                                                  } else {
                                                    //dailer is not opened
                                                  }
                                                },
                                                // onPressed: () {30.069428221635775, 31.180112107615624},
                                                icon: const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
