import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/Provider/FireBase/firebase_function.dart';
import 'package:graduation_project/model/car_model.dart';
import 'package:graduation_project/screens/model_details_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:graduation_project/utils/widgets/brand_container.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../api/view/car_api.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<CarModel> myCars = [];

  @override
  void initState() {
    super.initState();
    fetchCars();
  }

  void fetchCars() async {
    List<CarModel> carData = await CarApi().fetchFavorites(
        token: Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myCars = carData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
          title: const Text("Favorite Cars"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              myCars.isEmpty
                  ? Center(
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
                                      "assets/user_cars/fav_car.jpg")),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "There are no favorite cars!",
                                style: GoogleFonts.inter(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )))
                  : Expanded(
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
                      itemCount: myCars.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModelDetailsScreen(
                                        carModel: myCars[index],
                                        listImage: myCars[index].listImage,
                                        productionYears:
                                            myCars[index].yearsOfProduction),
                                  ));
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Delete This Car?",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red)),
                                            onPressed: () async {
                                              await CarApi()
                                                  .deleteFavoriteCar(
                                                      myCars[index].id,
                                                      Provider.of<MyProvider>(
                                                              context,
                                                              listen: false)
                                                          .myToken)
                                                  .then((value) {
                                                setState(() {
                                                  fetchCars();
                                                });
                                                Navigator.pop(context);
                                              });

                                              // setState(() async {
                                              //   await provider.deleteUser(index: index);
                                              //   Navigator.pop(context);
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(const SnackBar(
                                              //           backgroundColor: Colors.red,
                                              //           duration: Duration(seconds: 2),
                                              //           content: Text(
                                              //             'Article Deleted',
                                              //             style: TextStyle(color: Colors.white),
                                              //           )));
                                              // });
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: FadeInImage(
                                        fit: BoxFit.fill,
                                        height: 200,
                                        width: double.infinity,
                                        placeholder:
                                            MemoryImage(kTransparentImage),
                                        image:
                                            NetworkImage(myCars[index].img))),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(32),
                                              bottomRight: Radius.circular(32)),
                                          color: Colors.black54,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 44.w),
                                        child: Column(children: [
                                          Text((myCars[index].name),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.cardo(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                  color: Colors.white)),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              // Container(
                                              //   width: 85,
                                              //   decoration: BoxDecoration(
                                              //       // color: const Color.fromRGBO(234, 233, 233, 1),
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               16)),
                                              //   child: const Row(
                                              //     mainAxisAlignment:
                                              //         MainAxisAlignment
                                              //             .spaceEvenly,
                                              //     children: [
                                              //       Icon(
                                              //         Icons.event_seat,
                                              //         size: 14,
                                              //         color: Colors.white,
                                              //       ),
                                              //       Text(
                                              //         '5 Seats',
                                              //         style: TextStyle(
                                              //             color: Colors.white),
                                              //       )
                                              //     ],
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   width: 10.w,
                                              // ),
                                              Container(
                                                width: 85,
                                                decoration: BoxDecoration(
                                                    // color: const Color.fromRGBO(234, 233, 233, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Icon(
                                                      Icons.speed,
                                                      size: 8,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      myCars[index].topSpeed,
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // const Spacer(),
                                              Container(
                                                width: 85,
                                                decoration: BoxDecoration(
                                                    // color: const Color.fromRGBO(240, 233, 171, 0.71),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Icon(
                                                      Icons.monetization_on,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                    Text(
                                                      myCars[index]
                                                          .avgPrice
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          // fontWeight: FontWeight.w700,
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
                                        ]))),
                              ],
                            ));
                      },
                    ))
            ],
          ),
        ));
  }
}
