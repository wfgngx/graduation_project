import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/user_cars/users_cars_details.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../api/user/user_apis.dart';
import '../../model/user_cars.dart';
import '../../utils/colors/app_colors.dart';

class SearchedRentScreen extends StatefulWidget {
  const SearchedRentScreen({Key? key, required this.city}) : super(key: key);
  final String city;
  @override
  State<SearchedRentScreen> createState() => _SearchedRentScreenState();
}

class _SearchedRentScreenState extends State<SearchedRentScreen> {
  List<UserCars> cars = [];
  String actualCity = 'City';

  @override
  void initState() {
    super.initState();
    getCars();
  }

  final List<String> mohafazat = [
    'Alexandria',
    'Assiut',
    'Aswan',
    'Beheira',
    'Bani Suef',
    'Daqahliya',
    'Damietta',
    'Fayyoum',
    'Gharbiya',
    'Giza',
    'Cairo'
  ];
  void getCars() async {
    List<UserCars> test = await UserApis().getRentCars(
        city: widget.city,
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
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
          title: const Text("Rent a car"),
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
                      Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      actualCity,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    DropdownButton(
                                      underline: const Divider(
                                        color: Colors.transparent,
                                      ),
                                      elevation: 0,
                                      iconSize: 32,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),
                                      items: mohafazat.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          actualCity = newValue!;
                                          // getCars();
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ))),
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
                              return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserCarDetails(
                                                      rent: true,
                                                      userCars: cars[index],
                                                      imageList:
                                                          cars[index].images),
                                            ));
                                      },
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
                                                    BorderRadius.circular(12)),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12)),
                                                    child: FadeInImage(
                                                        height: 200,
                                                        width: 200,
                                                        fit: BoxFit.cover,
                                                        placeholder: MemoryImage(
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Brand: ',
                                                          style:
                                                              GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                        ),
                                                        Text(
                                                          cars[index].brand,
                                                          style:
                                                              GoogleFonts.actor(
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
                                                          'Name: ',
                                                          style:
                                                              GoogleFonts.actor(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 19),
                                                        ),
                                                        Text(
                                                          cars[index].name,
                                                          style:
                                                              GoogleFonts.actor(
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
                                                          style:
                                                              GoogleFonts.actor(
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
                                                          style:
                                                              GoogleFonts.actor(
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
                                          ))));
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
                                "There are no cars to rent in ${widget.city}!",
                                style: GoogleFonts.inter(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )))
            ]),
          ),
        ));
  }
}
