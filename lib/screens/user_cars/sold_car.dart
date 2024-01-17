import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/user_cars/users_cars_details.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../api/user/user_apis.dart';
import '../../model/user_cars.dart';
import '../../utils/widgets/brand_container.dart';

class SoldCars extends StatefulWidget {
  const SoldCars({Key? key}) : super(key: key);

  @override
  State<SoldCars> createState() => _SoldCarsState();
}

class _SoldCarsState extends State<SoldCars> {
  List<UserCars> cars = [];
  @override
  void initState() {
    super.initState();
    getCars();
  }

  void getCars() async {
    List<UserCars> test = await UserApis().getCars(Provider.of<MyProvider>(
                context,
                listen: false)
            .myToken
            .isEmpty
        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
        : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      cars = test;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Buy a car"),
          foregroundColor: Colors.white,
          centerTitle: true,
          backgroundColor: secondaryColor,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              cars.isNotEmpty
                  ? Column(children: [
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Padding(
                                  padding: EdgeInsets.only(top: 12, bottom: 12),
                                  child: Divider(
                                    color: Colors.white,
                                    indent: 20,
                                    endIndent: 20,
                                  ));
                            },
                            itemCount: cars.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserCarDetails(
                                              rent: false,
                                              imageList: cars[index].images,
                                              userCars: cars[index]),
                                        ));
                                  },
                                  child:
                                      // Card(
                                      //     color: Colors.white,
                                      //     shadowColor: Colors.white,
                                      //     elevation: 3,
                                      //     child: Container(
                                      //       height: 200,
                                      //       width:
                                      //           MediaQuery.of(context).size.width,
                                      //       decoration: BoxDecoration(
                                      //           // color: Colors.white,
                                      //           color: secondaryColor,
                                      //           borderRadius:
                                      //               BorderRadius.circular(12)),
                                      //       child: Row(
                                      //         children: [
                                      //           ClipRRect(
                                      //               borderRadius:
                                      //                   const BorderRadius.only(
                                      //                       bottomLeft:
                                      //                           Radius.circular(12),
                                      //                       topLeft:
                                      //                           Radius.circular(
                                      //                               12)),
                                      //               child: FadeInImage(
                                      //                   height: 200,
                                      //                   width: 200,
                                      //                   fit: BoxFit.cover,
                                      //                   placeholder: MemoryImage(
                                      //                       kTransparentImage),
                                      //                   image: NetworkImage(
                                      //                       cars[index]
                                      //                           .images[0]
                                      //                           .secureUrl))),
                                      //           const SizedBox(
                                      //             width: 8,
                                      //           ),
                                      //           // Column(
                                      //           //   mainAxisAlignment:
                                      //           //       MainAxisAlignment.spaceEvenly,
                                      //           //   crossAxisAlignment:
                                      //           //       CrossAxisAlignment.start,
                                      //           //   children: [
                                      //           //     Row(
                                      //           //       children: [
                                      //           //         Text(
                                      //           //           'Brand: ',
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         ),
                                      //           //         Text(
                                      //           //           cars[index].brand,
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         )
                                      //           //       ],
                                      //           //     ),
                                      //           //     const SizedBox(
                                      //           //       height: 12,
                                      //           //     ),
                                      //           //     Row(
                                      //           //       children: [
                                      //           //         Text(
                                      //           //           'Name: ',
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         ),
                                      //           //         Text(
                                      //           //           cars[index].name,
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         )
                                      //           //       ],
                                      //           //     ),
                                      //           //     const SizedBox(
                                      //           //       height: 12,
                                      //           //     ),
                                      //           //     Row(
                                      //           //       children: [
                                      //           //         Text(
                                      //           //           'Model: ',
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         ),
                                      //           //         Text(
                                      //           //           cars[index]
                                      //           //               .year
                                      //           //               .toString(),
                                      //           //           style: GoogleFonts.actor(
                                      //           //               color: Colors.white,
                                      //           //               fontWeight:
                                      //           //                   FontWeight.w600,
                                      //           //               fontSize: 19),
                                      //           //         )
                                      //           //       ],
                                      //           //     ),
                                      //           //     const SizedBox(
                                      //           //       height: 12,
                                      //           //     )
                                      //           //   ],
                                      //           // )
                                      //           Column(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.spaceEvenly,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment.start,
                                      //             children: [
                                      //               SingleChildScrollView(
                                      //                   scrollDirection:
                                      //                       Axis.horizontal,
                                      //                   child: Row(
                                      //                     children: [
                                      //                       Text(
                                      //                         'Brand: ',
                                      //                         style:
                                      //                             GoogleFonts.actor(
                                      //                                 color: Colors
                                      //                                     .white,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w600,
                                      //                                 fontSize: 19),
                                      //                       ),
                                      //                       Text(
                                      //                         cars[index].brand,
                                      //                         style:
                                      //                             GoogleFonts.actor(
                                      //                                 color: Colors
                                      //                                     .white,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w600,
                                      //                                 fontSize: 19),
                                      //                       )
                                      //                     ],
                                      //                   )),
                                      //               const SizedBox(
                                      //                 height: 12,
                                      //               ),
                                      //               Row(
                                      //                 children: [
                                      //                   Text(
                                      //                     'Name: ',
                                      //                     style: GoogleFonts.actor(
                                      //                         color: Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight.w600,
                                      //                         fontSize: 19),
                                      //                   ),
                                      //                   Text(
                                      //                     cars[index].name,
                                      //                     style: GoogleFonts.actor(
                                      //                         color: Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight.w600,
                                      //                         fontSize: 19),
                                      //                   )
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(
                                      //                 height: 12,
                                      //               ),
                                      //               Row(
                                      //                 children: [
                                      //                   Text(
                                      //                     'Model: ',
                                      //                     style: GoogleFonts.actor(
                                      //                         color: Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight.w600,
                                      //                         fontSize: 19),
                                      //                   ),
                                      //                   Text(
                                      //                     cars[index]
                                      //                         .year
                                      //                         .toString(),
                                      //                     style: GoogleFonts.actor(
                                      //                         color: Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight.w600,
                                      //                         fontSize: 19),
                                      //                   )
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(
                                      //                 height: 12,
                                      //               )
                                      //             ],
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ))
                                      SingleChildScrollView(
                                          child: Card(
                                              color: Colors.white,
                                              shadowColor: Colors.white,
                                              elevation: 3,
                                              child: Container(
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    // color: Colors.white,
                                                    color: secondaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12)),
                                                        child: FadeInImage(
                                                            height: 200,
                                                            width: 200,
                                                            fit: BoxFit.cover,
                                                            placeholder:
                                                                MemoryImage(
                                                                    kTransparentImage),
                                                            image: NetworkImage(
                                                                cars[index]
                                                                    .images[0]
                                                                    .secureUrl))),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'Brand: ',
                                                                  style: GoogleFonts.actor(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          19),
                                                                ),
                                                                Text(
                                                                  cars[index]
                                                                      .brand,
                                                                  style: GoogleFonts.actor(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          19),
                                                                )
                                                              ],
                                                            )),
                                                        const SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Name: ',
                                                              style: GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                            ),
                                                            Text(
                                                              cars[index].name,
                                                              style: GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Model: ',
                                                              style: GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                            ),
                                                            Text(
                                                              cars[index]
                                                                  .year
                                                                  .toString(),
                                                              style: GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 12,
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ))
                                          // ModelContainer(
                                          //     fuel: cars[index].fuel,
                                          //     speed: 'speed',
                                          //     image: cars[index].images.isNotEmpty
                                          //         ? cars[index].images[0].secureUrl
                                          //         : '',
                                          //     model: cars[index].name,
                                          //     brandImage: 'assets/images/bmw_model.png',
                                          //     price: cars[index].price.toString())
                                          ));
                            },
                          ))
                    ])
                  : Center(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                      'assets/user_cars/no_sold_cars.jpg')),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "There are no cars to buy!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )))
            ]),
          ),
        ));
  }
}

// ModelContainer(
//     fuel: cars[index].fuel,
//     speed: 'speed',
//     image: cars[index].images.isNotEmpty
//         ? cars[index].images[0].secureUrl
//         : '',
//     model: cars[index].name,
//     brandImage: 'assets/images/bmw_model.png',
//     price: cars[index].price.toString())
//  )
//       )
// ],
// GridView.builder(
//   itemCount: cars.length,
//   gridDelegate:
//       const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.9),
//   itemBuilder: (context, index) {
//     return Padding(
//         padding: const EdgeInsets.all(4),
//         child: Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context)
//                       .size
//                       .width /
//                   2,
//               decoration: BoxDecoration(
//                   color: secondaryColor,
//                   borderRadius:
//                       BorderRadius.circular(16)),
//             ),
//             Column(children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.only(
//                         topLeft:
//                             Radius.circular(16),
//                         topRight:
//                             Radius.circular(16)),
//                 child: Image.network(cars[index]
//                     .images[0]
//                     .secureUrl),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 cars[index].name,
//                 style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.monetization_on,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       Text(
//                         cars[index]
//                             .price
//                             .toString(),
//                         style: const TextStyle(
//                             color: Colors.white),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.location_city,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       Text(
//                         cars[index]
//                             .location
//                             .toString(),
//                         style: const TextStyle(
//                             color: Colors.white),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ]),
//             // const SizedBox(
//             //   height: 30,
//             // )
//           ],
//         ));
//   },
// )
// ListView.separated(
//     separatorBuilder: (context, index) {
//       return const Padding(
//           padding: EdgeInsets.all(12),
//           child: Divider(
//             indent: 20,
//             endIndent: 20,
//             color: Colors.white,
//           ));
//     },
//     itemCount: cars.length,
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemBuilder: (context, index) => InkWell(
//         // onLongPress: () => _showAlertDialog(cars[index].id),
//         child: Padding(
//             padding:
//                 const EdgeInsets.only(top: 12),
//             child: Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   color: secondaryColor,
//                   borderRadius:
//                       BorderRadius.circular(16)),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                       borderRadius:
//                           const BorderRadius.only(
//                               topLeft:
//                                   Radius.circular(
//                                       16),
//                               bottomLeft:
//                                   Radius.circular(
//                                       16)),
//                       child: Image.network(
//                           width: 200,
//                           cars[index]
//                               .images[0]
//                               .secureUrl)),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons
//                               .branding_watermark),
//                           Text(
//                               cars[index]
//                                   .name
//                                   .toString(),
//                               style: const TextStyle(
//                                   color: Colors
//                                       .white,
//                                   fontWeight:
//                                       FontWeight
//                                           .w700,
//                                   fontSize: 16)),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons
//                               .branding_watermark),
//                           Text(
//                               cars[index]
//                                   .name
//                                   .toString(),
//                               style: const TextStyle(
//                                   color: Colors
//                                       .white,
//                                   fontWeight:
//                                       FontWeight
//                                           .w700,
//                                   fontSize: 16)),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                               Icons.date_range),
//                           Text(
//                               cars[index]
//                                   .year
//                                   .toString(),
//                               style: const TextStyle(
//                                   color: Colors
//                                       .white,
//                                   fontWeight:
//                                       FontWeight
//                                           .w700,
//                                   fontSize: 16)),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons
//                               .monetization_on),
//                           Text(
//                               cars[index]
//                                   .price
//                                   .toString(),
//                               style: const TextStyle(
//                                   color: Colors
//                                       .white,
//                                   fontWeight:
//                                       FontWeight
//                                           .w700,
//                                   fontSize: 16)),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ))))
// onTap: () {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ModelDetailsScreen(
//             carModel: cars[index].price.toString(),
//             listImage: cars[index].duration,
//             productionYears:
//             cars[index].yearsOfProduction),
//       ));
// },
// onLongPress: () {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text(
//         "Delete This Car?",
//         style: TextStyle(fontSize: 18),
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment:
//           MainAxisAlignment.spaceAround,
//           children: [
//             TextButton(
//                 style: const ButtonStyle(
//                     backgroundColor:
//                     MaterialStatePropertyAll(
//                         Colors.red)),
//                 onPressed: () async {
//                   await CarApi()
//                       .deleteFavoriteCar(
//                       myCars[index].id,
//                       Provider.of<MyProvider>(
//                           context,
//                           listen: false)
//                           .myToken)
//                       .then((value) {
//                     setState(() {
//                       fetchCars();
//                     });
//                     Navigator.pop(context);
//                   });
//
//                   // setState(() async {
//                   //   await provider.deleteUser(index: index);
//                   //   Navigator.pop(context);
//                   //   ScaffoldMessenger.of(context)
//                   //       .showSnackBar(const SnackBar(
//                   //           backgroundColor: Colors.red,
//                   //           duration: Duration(seconds: 2),
//                   //           content: Text(
//                   //             'Article Deleted',
//                   //             style: TextStyle(color: Colors.white),
//                   //           )));
//                   // });
//                 },
//                 child: const Text(
//                   'Yes',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18),
//                 )),
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18),
//                 ))
//           ],
//         ),
//       ],
//     ),
//   );
// },
