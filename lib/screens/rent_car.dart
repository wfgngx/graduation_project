import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import '../Provider/FireBase/firebase_function.dart';
import '../api/user/user_apis.dart';
import '../model/user_cars.dart';
import '../utils/widgets/brand_container.dart';

class RentCars extends StatefulWidget {
  const RentCars({Key? key}) : super(key: key);

  @override
  State<RentCars> createState() => _RentCarsState();
}

class _RentCarsState extends State<RentCars> {
  List<UserCars> cars = [];
  @override
  void initState() {
    super.initState();
    getCars();
  }

  void getCars() async {
    List<UserCars> test = await UserApis().getRentCars(Provider.of<MyProvider>(
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
          title: const Text("Rent a car"),
          foregroundColor: Colors.white,
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              cars.isNotEmpty
                  ? ListView.builder(
                      itemCount: cars.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          // InkWell(
                          // onLongPress: () => _showAlertDialog(cars[index].id),
                          // child:
                          ModelContainer(
                              fuel: cars[index].fuel,
                              speed: 'speed',
                              image: cars[index].images.isNotEmpty
                                  ? cars[index].images[0].secureUrl
                                  : '',
                              model: cars[index].name,
                              brandImage: 'assets/images/bmw_model.png',
                              price: cars[index].price.toString())
                      //   )
                      )
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
                                "There are no cars to rent !",
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

  // Future<void> _showAlertDialog(String id) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         // title: Text(modelName),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text(
  //               'Edit',
  //               style: TextStyle(color: Colors.black),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             style: const ButtonStyle(
  //                 backgroundColor: MaterialStatePropertyAll(Colors.red)),
  //             child: const Text(
  //               'Delete',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             onPressed: () async {
  //               await UserApis()
  //                   .deleteCar(
  //                       id,
  //                       Provider.of<MyProvider>(context, listen: false)
  //                               .myToken
  //                               .isEmpty
  //                           ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
  //                           : Provider.of<MyProvider>(context, listen: false)
  //                               .myToken)
  //                   .then((value) {
  //                 print(id);
  //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //                     content: Text("Car Deleted Successfully")));
  //                 Navigator.pop(context);
  //                 setState(() {
  //                   getCars();
  //                 });
  //               });
  //               // await BrandApiAdmin().deleteBrand(id).then((value) {
  //               //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //               //       backgroundColor: Colors.red,
  //               //       content: Text(
  //               //         "Brand Deleted Successfully",
  //               //         style: TextStyle(color: Colors.white),
  //               //       )));
  //               //   Navigator.pop(context);
  //               //   setState(() {
  //               //   });
  //               // });
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
