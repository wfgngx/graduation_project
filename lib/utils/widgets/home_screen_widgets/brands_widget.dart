// import 'package:flutter/material.dart';
// import '../../../api/brand_api.dart';
// import '../../../model/brand_model.dart';
// import '../../strings.dart';
// import '../company_container.dart';
//
// class BrandsWidget extends StatefulWidget {
//   const BrandsWidget({Key? key, required this.myBrands}) : super(key: key);
//   final List<BrandModel> myBrands;
//
//   @override
//   State<BrandsWidget> createState() => _BrandsWidgetState();
// }
// //
// class _BrandsWidgetState extends State<BrandsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: SizedBox(
//             height: 105,
//             child: FutureBuilder(
//               future: BrandApi().getAllBrands(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('No Data Found...');
//                 }
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: myBrands.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                           padding: const EdgeInsets.only(right: 8),
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 defaultBrand = myBrands[index].name;
//                                 fetchCars();
//                               });
//                             },
//                             child: CompanyContainer(
//                                 img: brandEqual[myBrands[index].id],
//                                 brandName: myBrands[index].name),
//                           ));
//                     },
//                   );
//                 }
//                 return const CircularProgressIndicator();
//               },
//             )));
//   }
// }
