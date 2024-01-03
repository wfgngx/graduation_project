import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/api/user/user_apis.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Provider/FireBase/firebase_function.dart';
import '../admin_core/widgets/user_image_picker.dart';
import '../model/user_cars.dart';
import '../utils/widgets/brand_container.dart';

class UserCarsScreen extends StatefulWidget {
  const UserCarsScreen({Key? key}) : super(key: key);

  @override
  State<UserCarsScreen> createState() => _UserCarsScreenState();
}

class _UserCarsScreenState extends State<UserCarsScreen> {
  TextEditingController carName = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController distance = TextEditingController();
  TextEditingController transmission = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController fuel = TextEditingController();
  File? pickedImageFile;
  void openCamToTakeImg(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
      images.add(pickedImageFile!);
    });
  }

  List<File> images = [];
  List<UserCars> cars = [];
  @override
  void initState() {
    super.initState();
    getCars();
  }

  void getCars() async {
    print(
        'My token is ${Provider.of<MyProvider>(context, listen: false).myToken}');
    List<UserCars> test = await UserApis().getPrivateCars(
        Provider.of<MyProvider>(context, listen: false).myToken);
    setState(() {
      cars = test;
    });
    print(
        'My token is ${Provider.of<MyProvider>(context, listen: false).myToken}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: cars.isEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const Text(
                        "Add a new car",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 300.h,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: pickedImageFile == null
                            ? Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          openCamToTakeImg(false);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 32,
                                        )),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          openCamToTakeImg(true);
                                        },
                                        icon: const Icon(
                                          Icons.camera,
                                          color: Colors.white,
                                          size: 32,
                                        )),
                                    const Spacer()
                                  ],
                                ),
                              )
                            : Image.file(pickedImageFile!),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Text(
                        "About You",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter your Phone Number",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                        controller: phone,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        indent: 30.w,
                        endIndent: 30.w,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        "About Your Car",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Brand",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car Brand",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                        controller: brand,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Text(
                        "Car Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: carName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car name",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Price",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car Price",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Distance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: distance,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car Distance",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Transmission",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: transmission,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Transmission",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Duration",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: duration,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Duration",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Fuel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: fuel,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Fuel",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: location,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car Location",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "City",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: city,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car City",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: description,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car Description",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Rent-Sell",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: type,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Sell or Rent",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Year",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: year,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          hintText: "Enter car model year",
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 150.w,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      elevation: MaterialStatePropertyAll(10)),
                                  onPressed: () async {
                                    await UserApis()
                                        .addCar(
                                            carModel: carName.text,
                                            userPhone: phone.text,
                                            type: type.text,
                                            carBrandName: brand.text,
                                            modelYear: year.text,
                                            carPrice: price.text,
                                            carDistance: distance.text,
                                            carTransmission: transmission.text,
                                            carDuration: duration.text,
                                            carFuel: fuel.text,
                                            carCity: city.text,
                                            carLocation: location.text,
                                            carDescription: description.text,
                                            image: images,
                                            token: Provider.of<MyProvider>(
                                                        context,
                                                        listen: false)
                                                    .myToken
                                                    .isEmpty
                                                ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                                : Provider.of<MyProvider>(
                                                        context,
                                                        listen: false)
                                                    .myToken)
                                        .then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "Car Added Successfully")));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          SizedBox(
                              width: 150.w,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      elevation: MaterialStatePropertyAll(10)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )))
                        ],
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: cars.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                        onLongPress: () => _showAlertDialog(cars[index].id),
                        child: ModelContainer(
                            fuel: cars[index].fuel,
                            speed: 'speed',
                            image: cars[index].images.isNotEmpty
                                ? cars[index].images[0].secureUrl
                                : '',
                            model: cars[index].name,
                            brandImage: 'assets/images/bmw_model.png',
                            price: cars[index].price.toString()))),
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
                editeCarBottomSheet(context, id);
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
                await UserApis()
                    .deleteCar(
                        id,
                        Provider.of<MyProvider>(context, listen: false)
                                .myToken
                                .isEmpty
                            ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                            : Provider.of<MyProvider>(context, listen: false)
                                .myToken)
                    .then((value) {
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

  Future<void> editeCarBottomSheet(BuildContext context, String id) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: secondaryColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Padding(
                    //     padding: const EdgeInsets.all(12),
                    //     child: Container(
                    //         width: 200.w,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(12),
                    //             border: Border.all(color: Colors.white)),
                    //         child: const Center(
                    //             child: Text(
                    //           "Edit Brand",
                    //           style: TextStyle(
                    //               fontSize: 30,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         )))),
                    // SizedBox(
                    //   height: 12.h,
                    // ),
                    // UserImagePicker(
                    //   // oldImage: oldImage,
                    //   selectedImageFunction: (mySelectedImage) {}, oldImage: '',
                    // ),
                    // Padding(
                    //     padding: EdgeInsets.only(left: 12.w),
                    //     child: Align(
                    //         alignment: AlignmentDirectional.topStart,
                    //         child: Text(
                    //           'Brand Name',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 18.sp),
                    //         ))),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    //   child: TextField(
                    //     // controller: brandNameControllerEdit,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         // brandNameControllerEdit.text = value;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(12),
                    //             borderSide: const BorderSide(
                    //                 color: Colors.transparent)),
                    //         focusedBorder: const OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(color: Colors.transparent)),
                    //         border: const OutlineInputBorder()),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    //   child: TextField(
                    //     // controller: brandCountryControllerEdit,
                    //     onChanged: (value) {
                    //       setState(() {
                    //         // brandCountryControllerEdit.text = value;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(12),
                    //             borderSide: const BorderSide(
                    //                 color: Colors.transparent)),
                    //         focusedBorder: const OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(color: Colors.transparent)),
                    //         border: const OutlineInputBorder()),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 24.h,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            print('Edit');
                            await UserApis()
                                .editCarUser(
                                    carModel: 'Edit car',
                                    carBrandName: 'Test',
                                    carCity: 'cairo',
                                    image: images,
                                    carDescription: 'test',
                                    carDistance: '55',
                                    carDuration: '55',
                                    carFuel: '55',
                                    carLocation: 'fewfwe',
                                    carPrice: '444444',
                                    carTransmission: '555',
                                    modelYear: '2002',
                                    type: 'sell',
                                    id: id,
                                    userPhone: '0120415777',
                                    token: Provider.of<MyProvider>(context,
                                                listen: false)
                                            .myToken
                                            .isEmpty
                                        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                        : Provider.of<MyProvider>(context,
                                                listen: false)
                                            .myToken)
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        "Data Send Successfully",
                                        style: TextStyle(color: Colors.white),
                                      )));
                              Navigator.pop(context);
                              setState(() {
                                getCars();
                              });
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Save Changes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                                child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    )
                  ],
                )));
      },
    );
  }
}
