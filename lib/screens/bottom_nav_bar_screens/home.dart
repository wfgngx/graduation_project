import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/api/view/brand_api.dart';
import 'package:graduation_project/api/view/home_screen_new_cars.dart';
import 'package:graduation_project/screens/brands_screen.dart';
import 'package:graduation_project/screens/model_details_screen.dart';
import 'package:graduation_project/utils/widgets/brand_container.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../Provider/FireBase/firebase_function.dart';
import '../../api/view/car_api.dart';
import '../../model/brand_model.dart';
import '../../model/car_model.dart';
import '../../utils/widgets/company_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dropDownListItems = ['DATE', 'PRICE', 'SALES'];
  String defaultItemDropDown = "SALES";
  String defaultBrand = 'AUDI';
  List<BrandModel> myBrands = [];
  List<CarModel> myCars = [];
  List<CarModel> myNewCars = [];
  List<CarModel> searchedCars = [];
  int limit = 5;
  bool isLoading = false;
  bool isLoaded = false;
  bool hasData = false;
  bool search = false;
  String searchWord = '';
  final TextEditingController searchController = TextEditingController();
  List<CarModel> searchCars = [];
  @override
  void initState() {
    super.initState();
    fetchBrands();
    fetchCars();
    fetchNewCars();
  }

  void fetchNewCars() async {
    List<CarModel> carData = await NewCars().fetchNewCars(
        // sort: defaultItemDropDown.toLowerCase(),
        // brand: defaultBrand,
        // limit: limit,
        // offset: 0,
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
            : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myNewCars = carData;
      print("carData $carData");
      print(myNewCars);
    });
  }

  void fetchCars() async {
    List<CarModel> carData = await CarApi().fetchCars(
        sort: defaultItemDropDown.toLowerCase(),
        brand: defaultBrand,
        limit: limit,
        offset: 0,
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
            : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myCars = carData;
    });
  }

  void fetchBrands() async {
    List<BrandModel> brandData = await BrandApi().getAllBrands(Provider.of<
                MyProvider>(context, listen: false)
            .myToken
            .isEmpty
        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
        : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myBrands = brandData;
    });
  }

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: searchController,
              surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
              leading: const Icon(Icons.search),
              hintText: 'Search',
              hintStyle:
                  const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              onSubmitted: (value) async {
                if (value.isEmpty) {
                  setState(() {
                    search = false;
                    fetchCars();
                  });
                  return;
                } else {
                  setState(() {
                    search = true;
                    searchWord = value;
                  });
                  searchCars = await CarApi().fetchSearchCars(
                      token: Provider.of<MyProvider>(context, listen: false)
                              .myToken
                              .isEmpty
                          ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                          : Provider.of<MyProvider>(context, listen: false)
                              .myToken,
                      search: searchWord.trim());
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Newest Cars',
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 150.h,
                width: 400,
                child: FutureBuilder(
                  future: NewCars().fetchNewCars(
                      token: Provider.of<MyProvider>(context, listen: false)
                              .myToken
                              .isEmpty
                          ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                          : Provider.of<MyProvider>(context, listen: false)
                              .myToken),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      //   hasData = true;
                      return CarouselSlider.builder(
                        itemCount: myNewCars.length,
                        itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) =>
                            Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ModelDetailsScreen(
                                            productionYears: myNewCars[index]
                                                .yearsOfProduction,
                                            listImage:
                                                myNewCars[index].listImage,
                                            carModel: myNewCars[index],
                                          );
                                        },
                                      ));
                                    },
                                    // child:
                                    // Padding(
                                    //     padding:
                                    //     const EdgeInsets.only(
                                    //         bottom: 10),
                                    //     child: ModelContainer(
                                    //       // fuel:
                                    //       //     "${myCars[index].fuel.substring(0, 1)}...",
                                    //         fuel: myCars[index].fuel,
                                    //         // brandImage:
                                    //         //     myBrands[index].logo,
                                    //         brandImage: brand_equal[
                                    //         defaultBrand],
                                    //         // brandImage: brand_equal[
                                    //         //     myBrands[index].name],
                                    //         speed: myCars[index]
                                    //             .topSpeed,
                                    //         image: myCars[index]
                                    //             .listImage[0],
                                    //         model: myCars[index].name,
                                    //         price: myCars[index]
                                    //             .avgPrice
                                    //             .toString())),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: FadeInImage(
                                                fit: BoxFit.fill,
                                                height: 200,
                                                width: double.infinity,
                                                placeholder: MemoryImage(
                                                    kTransparentImage),
                                                image: NetworkImage(
                                                    myNewCars[index].img))),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8)),
                                                  color: Colors.black54,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                    horizontal: 44.w),
                                                child: Column(children: [
                                                  Text((myNewCars[index].name),
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.cardo(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                          color: Colors.white)),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment.spaceAround,
                                                  //   children: [
                                                  //     Container(
                                                  //       width: 85,
                                                  //       decoration: BoxDecoration(
                                                  //           // color: const Color.fromRGBO(234, 233, 233, 1),
                                                  //           borderRadius:
                                                  //               BorderRadius.circular(16)),
                                                  //       child: const Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment.spaceEvenly,
                                                  //         children: [
                                                  //           Icon(
                                                  //             Icons.event_seat,
                                                  //             size: 14,
                                                  //             color: Colors.white,
                                                  //           ),
                                                  //           Text(
                                                  //             '5 Seats',
                                                  //             style: TextStyle(
                                                  //                 color: Colors.white),
                                                  //           )
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //     // SizedBox(
                                                  //     //   width: 10.w,
                                                  //     // ),
                                                  //     Container(
                                                  //       width: 85,
                                                  //       decoration: BoxDecoration(
                                                  //           // color: const Color.fromRGBO(234, 233, 233, 1),
                                                  //           borderRadius:
                                                  //               BorderRadius.circular(16)),
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment.spaceEvenly,
                                                  //         children: [
                                                  //           const Icon(
                                                  //             Icons.speed,
                                                  //             size: 8,
                                                  //             color: Colors.white,
                                                  //           ),
                                                  //           Text(
                                                  //             myNewCars[index].topSpeed,
                                                  //             style: const TextStyle(
                                                  //                 color: Colors.white),
                                                  //           )
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //     // const Spacer(),
                                                  //     Container(
                                                  //       width: 85,
                                                  //       decoration: BoxDecoration(
                                                  //           // color: const Color.fromRGBO(240, 233, 171, 0.71),
                                                  //           borderRadius:
                                                  //               BorderRadius.circular(16)),
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment.spaceEvenly,
                                                  //         children: [
                                                  //           const Icon(
                                                  //             Icons.monetization_on,
                                                  //             color: Colors.white,
                                                  //             size: 12,
                                                  //           ),
                                                  //           Text(
                                                  //             myNewCars[index]
                                                  //                 .avgPrice
                                                  //                 .toString(),
                                                  //             style: const TextStyle(
                                                  //                 color: Colors.white,
                                                  //                 // fontWeight: FontWeight.w700,
                                                  //                 fontSize: 16),
                                                  //           )
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 6.w,
                                                  //     ),
                                                  //   ],
                                                  // )
                                                ]))),
                                      ],
                                    )))

                        //       void searchedCarsList(String query) {
                        //   setState(() {
                        //     if (query.isEmpty) {
                        //       searchedCars = myCars; // If the query is empty, show all articles
                        //     } else {
                        //       searchedCars = myCars.where((car) => car.name.contains(query)).toList();
                        //     }
                        //   });
                        // }

                        // ClipRRect(
                        //     borderRadius: BorderRadius.circular(0),
                        //     child: Padding(
                        //         padding: const EdgeInsets.all(0),
                        //         child: Image.network(
                        //           myNewCars[index].listImage[1],
                        //           width: MediaQuery.of(context).size.width,
                        //           fit: BoxFit.cover,
                        //         ))),
                        ,
                        options: CarouselOptions(
                          autoPlay: true,
                          // autoPlayInterval: Duration(milliseconds: 30),
                          // autoPlayAnimationDuration: Duration(milliseconds: 30),
                          // animateToClosest: true,
                          autoPlayCurve: Curves.decelerate,
                          // height: 400,
                          viewportFraction: 0.9,
                          // autoPlay: true
                        ),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  },
                )),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              color: Colors.white,
              height: 1.h,
              indent: 20.w,
              endIndent: 20.w,
            ),
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
                          builder: (context) => Brands(myBrands: myBrands),
                        ));
                  },
                  child: const Text(
                    "see all",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Gap(6.h),
            Row(
              children: [
                // hasData
                //     ? CircularProgressIndicator(
                //         color: Colors.white,
                //       )
                //     :
                Expanded(
                    child: SizedBox(
                        height: 105,
                        child: FutureBuilder(
                          future: BrandApi().getAllBrands(Provider.of<
                                      MyProvider>(context, listen: false)
                                  .myToken
                                  .isEmpty
                              ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                              : Provider.of<MyProvider>(context, listen: false)
                                  .myToken),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('No Data Found...');
                            }
                            if (snapshot.hasData) {
                              //   hasData = true;
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
                                            // img: myBrands[index].logo,
                                            img: brandEqual[
                                                myBrands[index].name],
                                            brandName: myBrands[index].name),
                                      ));
                                },
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ));
                          },
                        )))
                // : Center(
                //     child: CircularProgressIndicator(
                //       color: Colors.white,
                //     ),
                //   ),
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
            search
                ? FutureBuilder(
                    future: CarApi().fetchSearchCars(
                      // limit: 20,
                      // offset: 0,
                      // brand: defaultBrand,
                      token: Provider.of<MyProvider>(context, listen: false)
                              .myToken
                              .isEmpty
                          ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                          : Provider.of<MyProvider>(context, listen: false)
                              .myToken,
                      search: searchWord,
                      // sort:defaultItemDropDown.toLowerCase()
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return AnimationLimiter(
                            child: ListView.builder(
                                itemCount: searchCars.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 375),
                                        child: SlideAnimation(
                                            duration:
                                                const Duration(seconds: 2),
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                                child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return ModelDetailsScreen(
                                                      productionYears:
                                                          searchCars[index]
                                                              .yearsOfProduction,
                                                      listImage:
                                                          searchCars[index]
                                                              .listImage,
                                                      carModel:
                                                          searchCars[index],
                                                    );
                                                  },
                                                ));
                                              },
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: ModelContainer(
                                                      brandBool: false,
                                                      // fuel:
                                                      //     "${myCars[index].fuel.substring(0, 1)}...",
                                                      fuel: searchCars[index]
                                                          .fuel,
                                                      brandImage: '',
                                                      // myBrands[index].logo,
                                                      // brandImage: brandEqual[
                                                      //     myCars[index].brandId],
                                                      speed: searchCars[index]
                                                          .topSpeed,
                                                      image: searchCars[index]
                                                          .listImage[0],
                                                      model: searchCars[index]
                                                          .name,
                                                      price: searchCars[index]
                                                          .avgPrice
                                                          .toString())),
                                            ))))));
                      } else {
                        // return shimmerContainer();
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                    },
                  )
                : FutureBuilder(
                    future: CarApi().fetchCars(
                        limit: 20,
                        offset: 0,
                        token: Provider.of<MyProvider>(context, listen: false)
                                .myToken
                                .isEmpty
                            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                            : Provider.of<MyProvider>(context, listen: false)
                                .myToken),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return AnimationLimiter(
                            child: ListView.builder(
                                itemCount: myCars.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 375),
                                        child: SlideAnimation(
                                            duration:
                                                const Duration(seconds: 2),
                                            verticalOffset: 50.0,
                                            child: FadeInAnimation(
                                                child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return ModelDetailsScreen(
                                                      productionYears: myCars[
                                                              index]
                                                          .yearsOfProduction,
                                                      listImage: myCars[index]
                                                          .listImage,
                                                      carModel: myCars[index],
                                                    );
                                                  },
                                                ));
                                              },
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: ModelContainer(

                                                      // fuel:
                                                      //     "${myCars[index].fuel.substring(0, 1)}...",
                                                      fuel: myCars[index].fuel,
                                                      // brandImage:
                                                      //     myBrands[index].logo,
                                                      brandImage: brandEqual[
                                                          defaultBrand],
                                                      // brandImage: brand_equal[
                                                      //     myBrands[index].name],
                                                      speed: myCars[index]
                                                          .topSpeed,
                                                      image: myCars[index]
                                                          .listImage[0],
                                                      model: myCars[index].name,
                                                      price: myCars[index]
                                                          .avgPrice
                                                          .toString())),
                                            ))))));
                      } else {
                        // return shimmerContainer();
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }

  Widget shimmerContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: SizedBox(
        height: 225.h,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            padding: EdgeInsets.only(
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 120,
                          height: 20,
                          color: Colors.white, // Shimmer effect color
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.white, // Shimmer effect color
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 120.h,
                      width: 220.w,
                      color: Colors.white, // Shimmer effect color
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Shimmer effect color
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Shimmer effect color
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Shimmer effect color
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
