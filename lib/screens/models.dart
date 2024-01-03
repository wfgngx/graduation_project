import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../Provider/FireBase/firebase_function.dart';
import '../api/view/car_api.dart';
import '../model/car_model.dart';
import '../utils/widgets/brand_container.dart';
import 'model_details_screen.dart';

class ModelsScreen extends StatefulWidget {
  const ModelsScreen({Key? key, required this.brandName, required this.image})
      : super(key: key);
  final String brandName;
  final String image;

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> dropDownListItems = ['Date', 'Price', 'Sales'];
  String defaultItemDropDown = "Sales";
  int limit = 20;
  bool isLoading = false;
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
  void initState() {
    super.initState();
    fetchCars();
  }

  List<CarModel> myCars = [];

  void fetchCars() async {
    List<CarModel> carData = await CarApi().fetchCars(
        limit: 20,
        offset: 0,
        brand: widget.brandName,
        sort: defaultItemDropDown.toLowerCase(),
        token: Provider.of<MyProvider>(context, listen: false).myToken.isEmpty
            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
            : Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      myCars = carData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DropdownButton(
                  elevation: 0,
                  iconSize: 32,
                  hint: Text(
                    defaultItemDropDown,
                    style: const TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 14,
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
                ))
          ],
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
          title: Text(
            widget.brandName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                SearchBar(
                  controller: _searchController,
                  surfaceTintColor:
                      const MaterialStatePropertyAll(Colors.white),
                  leading: const Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle:
                      const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  onChanged: (query) {},
                ),
                SizedBox(
                  height: 12.h,
                ),
                ListView.builder(
                    itemCount: myCars.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                                duration: const Duration(seconds: 2),
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ModelDetailsScreen(
                                           productionYears: myCars[index].yearsOfProduction,
                                          listImage: myCars[index].listImage,
                                          carModel: myCars[index],
                                        );
                                      },
                                    ));
                                  },
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ModelContainer(
                                        fuel: myCars[index].fuel,
                                        brandImage: widget.image,
                                        // brandImage: brandEqual[myCars[index].name],
                                        image: myCars[index].listImage[0],
                                        speed: myCars[index].topSpeed,
                                        model: myCars[index].name,
                                        price: myCars[index].avgPrice.toString(),
                                      )),
                                )))))
              ],
            ),
          ),
        ));

//
// /////////////////////////////////////////////////////////////
//
//
//     return Scaffold(
//         appBar: AppBar(
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: const Text(
//             "BMW Models",
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
//         body: Column(
//           children: [
//             SearchBar(
//               controller: _searchController,
//               surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
//               leading: const Icon(Icons.search),
//               hintText: 'Search',
//               hintStyle:
//                   const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
//               shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8))),
//               onChanged: (query) {},
//             ),
//             ListView.builder(
//                 itemCount: 10,
//                 shrinkWrap: true,
//                 // physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) => InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return const ModelDetailsScreen();
//                           },
//                         ));
//                       },
//                       child: const Padding(
//                           padding: EdgeInsets.all(12), child: ModelContainer()),
//                     ))
//           ],
//         ));
  }
}
