import 'package:flutter/material.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import '../api/user/user_apis.dart';
import '../model/user_cars.dart';
import '../utils/widgets/brand_container.dart';

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
    List<UserCars> test = await UserApis().getCars();
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
          backgroundColor: const Color.fromRGBO(39, 55, 77, 1.0),
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(children: [
              ListView.builder(
                  itemCount: cars.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                      onLongPress: () => _showAlertDialog(cars[index].id),
                      child: ModelContainer(
                          speed: 'speed',
                          image: cars[index].images.isNotEmpty
                              ? cars[index].images[0].secureUrl
                              : '',
                          model: cars[index].name,
                          brandImage: 'assets/images/bmw_model.png',
                          price: cars[index].price.toString())))
            ]),
          ),
        ));
  }

  Future<void> _showAlertDialog(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(modelName),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await UserApis().deleteCar(id).then((value) {
                  print(id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Car Deleted Successfully")));
                  Navigator.pop(context);
                  setState(() {
                    getCars();
                  });
                });
                // await BrandApiAdmin().deleteBrand(id).then((value) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       backgroundColor: Colors.red,
                //       content: Text(
                //         "Brand Deleted Successfully",
                //         style: TextStyle(color: Colors.white),
                //       )));
                //   Navigator.pop(context);
                //   setState(() {
                //   });
                // });
              },
            ),
          ],
        );
      },
    );
  }
}
// SizedBox(
//   height: 40.h,
// ),
// // SearchBar(
// //   controller: _searchController,
// //   surfaceTintColor:
// //       const MaterialStatePropertyAll(Colors.white),
// //   leading: const Icon(Icons.search),
// //   hintText: 'Search',
// //   hintStyle:
// //       const MaterialStatePropertyAll(TextStyle(fontSize: 18)),
// //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
// //       borderRadius: BorderRadius.circular(8))),
// //   onChanged: (query) {},
// // ),
