import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/api/view/brand_api.dart';
import 'package:graduation_project/screens/brands_screen.dart';
import 'package:graduation_project/screens/model_details_screen.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:graduation_project/utils/widgets/brand_container.dart';
import 'package:graduation_project/utils/widgets/home_screen_widgets/search_bar_widget.dart';
import '../../api/view/car_api.dart';
import '../../model/brand_model.dart';
import '../../model/car_model.dart';
import '../../utils/strings.dart';
import '../../utils/widgets/company_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> dropDownListItems = ['DATE', 'PRICE', 'SALES'];
  String defaultItemDropDown = "SALES";
  String defaultBrand = 'AUDI';
  List<BrandModel> myBrands = [];
  List<CarModel> myCars = [];
  List<CarModel> searchedCars = [];
  int limit = 5;
  bool isLoading = false;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchBrands();
    fetchCars();
  }

  void fetchCars() async {
    List<CarModel> carData = await CarApi().fetchCars(
        sort: defaultItemDropDown.toLowerCase(),
        brand: defaultBrand,
        limit: limit,
        offset: 0);
    setState(() {
      myCars = carData;
    });
  }

  void fetchBrands() async {
    List<BrandModel> brandData = await BrandApi().getAllBrands();
    setState(() {
      myBrands = brandData;
    });
  }

  // getUiImage() async {
  //   ByteData data = await rootBundle.load(myCars[1].img);
  //   image = await decodeImageFromList(data.buffer.asUint8List());
  //   await getPNG();
  //   setState(() {
  //     isLoaded = true;
  //   });
  // }

  // getPNG() async {
  //   pngBytes = await image?.toByteData(format: ui.ImageByteFormat.png);
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            SearchBarWidget(searchController: _searchController),
            Gap(6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brands',
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Brands(),
                        ));
                  },
                  child: const Text(
                    "see all",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Gap(6.h),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 105,
                        child: FutureBuilder(
                          future: BrandApi().getAllBrands(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('No Data Found...');
                            }
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: myBrands.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            defaultBrand = myBrands[index].name;
                                            fetchCars();
                                          });
                                        },
                                        child: CompanyContainer(
                                            img: brandEqual[myBrands[index].id],
                                            brandName: myBrands[index].name),
                                      ));
                                },
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ))),
              ],
            ),
            Gap(
              12.h,
            ),
            Divider(
              color: Colors.white,
              height: 1.h,
              indent: 20.w,
              endIndent: 20.w,
            ),
            Gap(
              10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  defaultBrand,
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                ),
                DropdownButton(
                  underline: const Divider(
                    color: Colors.transparent,
                  ),
                  elevation: 0,
                  iconSize: 32,
                  hint: Text(
                    defaultItemDropDown,
                    style: const TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  items: dropDownListItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      defaultItemDropDown = newValue!;
                      fetchCars();
                    });
                  },
                )
              ],
            ),
            const Gap(
              10,
            ),
            FutureBuilder(
              future: CarApi().fetchCars(limit: 20, offset: 0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: myCars.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ModelDetailsScreen(
                                carModel: myCars[index],
                              );
                            },
                          ));
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ModelContainer(
                                brandImage: brandEqual[myCars[index].brandId],
                                speed: myCars[index].topSpeed,
                                image: myCars[index].img,
                                model: myCars[index].name,
                                price: myCars[index].price.toString()))),
                  );
                } else {
                  return const CircularProgressIndicator(
                    color: primaryColor,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
// Stack(
//   children: [
//     ClipRRect(
//         borderRadius: BorderRadius.circular(32),
//         child: FadeInImage(
//             fit: BoxFit.fill,
//             height: 200,
//             width: double.infinity,
//             placeholder:
//                 MemoryImage(kTransparentImage),
//             image:
//                 NetworkImage(myCars[index].img))),
//     Positioned(
//         bottom: 0,
//         right: 0,
//         left: 0,
//         child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(32),
//                   bottomRight: Radius.circular(32)),
//               color: Colors.black54,
//             ),
//             padding: EdgeInsets.symmetric(
//                 vertical: 10.h, horizontal: 44.w),
//             child: Column(children: [
//               Text((myCars[index].name),
//                   maxLines: 2,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   style: GoogleFonts.cardo(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                       color: Colors.white)),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 85,
//                     decoration: BoxDecoration(
//                         // color: const Color.fromRGBO(234, 233, 233, 1),
//                         borderRadius:
//                             BorderRadius.circular(
//                                 16)),
//                     child: const Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceEvenly,
//                       children: [
//                         Icon(
//                           Icons.event_seat,
//                           size: 14,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           '5 Seats',
//                           style: TextStyle(
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: 10.w,
//                   // ),
//                   Container(
//                     width: 85,
//                     decoration: BoxDecoration(
//                         // color: const Color.fromRGBO(234, 233, 233, 1),
//                         borderRadius:
//                             BorderRadius.circular(
//                                 16)),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceEvenly,
//                       children: [
//                         const Icon(
//                           Icons.speed,
//                           size: 8,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           myCars[index].topSpeed,
//                           style: const TextStyle(
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   // const Spacer(),
//                   Container(
//                     width: 85,
//                     decoration: BoxDecoration(
//                         // color: const Color.fromRGBO(240, 233, 171, 0.71),
//                         borderRadius:
//                             BorderRadius.circular(
//                                 16)),
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceEvenly,
//                       children: [
//                         const Icon(
//                           Icons.monetization_on,
//                           color: Colors.white,
//                           size: 12,
//                         ),
//                         Text(
//                           myCars[index]
//                               .price
//                               .toString(),
//                           style: const TextStyle(
//                               color: Colors.white,
//                               // fontWeight: FontWeight.w700,
//                               fontSize: 16),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 6.w,
//                   ),
//                 ],
//               )
//             ]))),
//   ],
// )

  // void searchedCarsList(String query) {
  //   setState(() {
  //     if (query.isEmpty) {
  //       searchedCars = myCars; // If the query is empty, show all articles
  //     } else {
  //       searchedCars = myCars.where((car) => car.name.contains(query)).toList();
  //     }
  //   });
  // }
}
