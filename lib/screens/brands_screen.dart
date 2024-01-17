import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/screens/models.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../Provider/FireBase/firebase_function.dart';
import '../api/view/brand_api.dart';
import '../model/brand_model.dart';
import '../utils/widgets/company_container.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key, required this.myBrands}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
  final List<BrandModel> myBrands;
}

class _BrandsState extends State<Brands> {
  final TextEditingController _searchController = TextEditingController();

  // List<BrandModel> myBrands = [];
  Map brand_equal = {
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
  // @override
  // void initState() {
  //   super.initState();
  //   fetchBrands();
  // }
  //
  // void fetchBrands() async {
  //   List<BrandModel> brandData = await BrandApi().getAllBrands(Provider.of<
  //               MyProvider>(context, listen: false)
  //           .myToken
  //           .isEmpty
  //       ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
  //       : Provider.of<MyProvider>(context, listen: false).myToken);
  //   setState(() {
  //     myBrands = brandData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: secondaryColor,
              centerTitle: true,
              foregroundColor: Colors.white,
              title: const Text("Brands"),
            ),
            backgroundColor: primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // SearchBar(
                  //   controller: _searchController,
                  //   surfaceTintColor:
                  //       const MaterialStatePropertyAll(Colors.white),
                  //   leading: const Icon(Icons.search),
                  //   hintText: 'Search',
                  //   hintStyle:
                  //       const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
                  //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8))),
                  //   onChanged: (query) {},
                  // ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Expanded(
                      child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: widget.myBrands.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModelsScreen(
                                        // image: myBrands[index].logo,
                                        image: brand_equal[
                                            widget.myBrands[index].name],
                                        brandName: widget.myBrands[index].name),
                                  ));
                            },
                            child: CompanyContainer(
                                img: brand_equal[widget.myBrands[index].name],
                                //img: myBrands[index].logo,
                                brandName: widget.myBrands[index].name),
                          ));
                    },
                  )
                      //     GridView.builder(
                      //   itemCount: myBrands.length,
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 3),
                      //   itemBuilder: (context, index) {
                      //     return FutureBuilder(
                      //       future: BrandApi().getAllBrands(Provider.of<MyProvider>(
                      //                   context,
                      //                   listen: false)
                      //               .myToken
                      //               .isEmpty
                      //           ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                      //           : Provider.of<MyProvider>(context, listen: false)
                      //               .myToken),
                      //       builder: (context, snapshot) {
                      //         if (snapshot.connectionState ==
                      //             ConnectionState.waiting) {
                      //           return const CircularProgressIndicator(
                      //             backgroundColor: Colors.transparent,
                      //             color: Colors.transparent,
                      //           );
                      //         }
                      //         if (snapshot.hasError) {
                      //           return const Text('No Data Found...');
                      //         }
                      //         if (snapshot.hasData) {
                      //           // return
                      //           //   ListView.builder(
                      //           //   scrollDirection: Axis.horizontal,
                      //           //   itemCount: myBrands.length,
                      //           //   itemBuilder: (context, index) {
                      //           return Padding(
                      //               padding: const EdgeInsets.all(8),
                      //               child: InkWell(
                      //                 onTap: () {
                      //                   Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                         builder: (context) => ModelsScreen(
                      //                             // image: myBrands[index].logo,
                      //                             image: brand_equal[
                      //                                 myBrands[index].name],
                      //                             brandName: myBrands[index].name),
                      //                       ));
                      //                 },
                      //                 child: CompanyContainer(
                      //                     img: brand_equal[myBrands[index].name],
                      //                     //img: myBrands[index].logo,
                      //                     brandName: myBrands[index].name),
                      //               ));
                      //         }
                      //         return const CircularProgressIndicator(
                      //           backgroundColor: Colors.transparent,
                      //           color: Colors.transparent,
                      //         );
                      //       },
                      //     );
                      //   },
                      // )
                      ),
                ],
              ),
            )));
  }
}
