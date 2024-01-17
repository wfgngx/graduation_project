import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Provider/FireBase/firebase_function.dart';
import '../../api/user/user_apis.dart';
import '../../utils/colors/app_colors.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({Key? key, required this.rent}) : super(key: key);
  final bool rent;

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  TextEditingController userName = TextEditingController();
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
  TextEditingController topSpeed = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String actualCity = 'City';
  File? pickedImageFile0;
  File? pickedImageFile1;
  File? pickedImageFile2;
  File? pickedImageFile3;
  File? pickedImageFile4;
  File? pickedImageFile5;
  File? pickedImageFile6;
  void openCamToTakeImg0(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile0 = File(pickedImage.path);
      images.add(pickedImageFile0!);
    });
  }

  void openCamToTakeImg1(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile1 = File(pickedImage.path);
      images.add(pickedImageFile1!);
    });
  }

  void openCamToTakeImg2(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile2 = File(pickedImage.path);
      images.add(pickedImageFile2!);
    });
  }

  void openCamToTakeImg3(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile3 = File(pickedImage.path);
      images.add(pickedImageFile3!);
    });
  }

  void openCamToTakeImg4(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile4 = File(pickedImage.path);
      images.add(pickedImageFile4!);
    });
  }

  void openCamToTakeImg5(bool gallery) async {
    final pickedImage = await ImagePicker().pickImage(
      source: gallery == false ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile5 = File(pickedImage.path);
      images.add(pickedImageFile5!);
    });
  }

  List<File> images = [];
  bool load = false;

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
  String automatic = "";
  String trans = 'trans';
  String durationType = 'Category';
  List<String> transList = ['Automatic', 'Manual'];
  List<String> durationTypeList = ['days', 'weeks', 'months'];
  // bool rent = false;
  // bool sell = true;
  String brandName = 'Brand';
  List<String> brandList = [
    'ALFA ROMEO',
    'AUDI',
    'BMW',
    'CHEVROLET',
    'CITROEN',
    'DAEWOO',
    'DODGE',
    'FERRARI',
    'FIAT',
    'FORD',
    'GEELY',
    'HONDA',
    'HUMMER',
    'JEEP',
    'KIA',
    'LADA',
    'LAND ROVER',
    'MESERATI',
    'MAZDA',
    'Mercedes-AMG',
    'MERCEDES BENZ',
    'MG',
    'MINI',
    'MITSUBISHI',
    'NISSAN',
    'OPEL',
    'PEUGEOT',
    'PORSCHE',
    'PROTON',
    'RAM Trucks',
    'RENAULT',
    'SKODA',
    'SUBARU',
    'MARUTI',
    'SUZUKI',
    'TESLA',
    'TOYOTA',
    'VOLVO',
    'BYD',
    'SEAT',
    'INFINITI',
    'CUPRA',
    'DAIHATSU',
    'HYUNDAI',
    'VOLKSWAGEN'
  ];

  // Padding(
  // padding: const EdgeInsets.all(16),
  // child: Container(
  // height: 40.h,
  // decoration: const BoxDecoration(
  // color: Colors.white,
  // ),
  // child: Padding(
  // padding: const EdgeInsets.all(12),
  // child: Row(
  // mainAxisAlignment:
  // MainAxisAlignment.spaceBetween,
  // children: [
  // Text(
  // city,
  // style: const TextStyle(
  // color: Colors.black,
  // fontSize: 22,
  // ),
  // ),
  // DropdownButton(
  // underline: const Divider(
  // color: Colors.transparent,
  // ),
  // elevation: 0,
  // iconSize: 32,
  // hint: const Text(
  // 'filter by governorate...',
  // style: TextStyle(color: Colors.white),
  // ),
  // icon: const Icon(
  // Icons.arrow_drop_down,
  // color: Colors.black,
  // ),
  // items:
  // dropDownListItems.map((String items) {
  // return DropdownMenuItem(
  // value: items,
  // child: Text(items),
  // );
  // }).toList(),
  // onChanged: (String? newValue) {
  // setState(() {
  // city = newValue!;
  // getCars();
  // });
  // },
  // )
  // ],
  // ),
  // ))),

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            centerTitle: true,
            backgroundColor: secondaryColor,
            title: const Text(
              "Add a new car",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile0 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg0(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg0(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile0!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile1 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg1(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg1(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile1!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile2 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg2(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg2(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile2!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile3 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg3(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg3(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile3!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile4 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg4(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg4(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile4!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: pickedImageFile5 == null
                                ? Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg5(false);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            openCamToTakeImg5(true);
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  )
                                : Image.file(pickedImageFile5!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(18),
                Form(
                    key: formKey,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: secondaryColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(64))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 12.h,
                            ),
                            const Text(
                              "Your Information",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            // const Text(
                            //   "Your Name",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Gap(12),
                            SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    hintText: "Enter your Name",
                                    hintStyle: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  ),
                                  controller: userName,
                                )),
                            SizedBox(
                              height: 12.h,
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  hintText: "Enter your Phone Number",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                ),
                                controller: phone,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            // const Text(
                            //   "City",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Gap(12),
                            Padding(
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
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
                                            items:
                                                mohafazat.map((String items) {
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
                            const SizedBox(
                              height: 12,
                            ),

                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                controller: location,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.streetAddress,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  hintText: "Enter car Location",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Divider(
                              indent: 30.w,
                              endIndent: 30.w,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            const Text(
                              "Car Specification",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600),
                            ),

                            const SizedBox(
                              height: 8,
                            ),
                            // SizedBox(
                            //   height: 50,
                            //   width: MediaQuery.of(context).size.width,
                            //   child: TextFormField(
                            //     style: const TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w700),
                            //     keyboardType: TextInputType.name,
                            //     decoration: const InputDecoration(
                            //       fillColor: Colors.white,
                            //       filled: true,
                            //       border: OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.white),
                            //           borderRadius: BorderRadius.all(
                            //               Radius.circular(16))),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderRadius:
                            //               BorderRadius.all(Radius.circular(16)),
                            //           borderSide:
                            //               BorderSide(color: Colors.white)),
                            //       enabledBorder: OutlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.grey),
                            //           borderRadius: BorderRadius.all(
                            //               Radius.circular(16))),
                            //       hintText: "Enter car Brand",
                            //       hintStyle: TextStyle(
                            //           color: Colors.black38, fontSize: 16),
                            //     ),
                            //     controller: brand,
                            //   ),
                            // ),
                            Padding(
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            brandName,
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
                                            items:
                                                brandList.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                brandName = newValue!;
                                                // getCars();
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ))),

                            SizedBox(
                              height: 12.h,
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                controller: carName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  hintText: "Enter car name",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                controller: description,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                  hintText: "Enter car Description",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 12.h,
                            // ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    height: 50,
                                    child: TextFormField(
                                      controller: fuel,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        hintText: "Fuel",
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 16),
                                      ),
                                    )),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    height: 50,
                                    child: TextFormField(
                                      controller: topSpeed,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        hintText: "Top speed",
                                        hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 16),
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: TextFormField(
                                    controller: price,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      hintText: "Enter car Price",
                                      hintStyle: TextStyle(
                                          color: Colors.black38, fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: TextFormField(
                                    controller: year,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.datetime,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      hintText: "Enter car model year",
                                      hintStyle: TextStyle(
                                          color: Colors.black38, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: TextFormField(
                                    controller: distance,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      hintText: "Enter car Distance",
                                      hintStyle: TextStyle(
                                          color: Colors.black38, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 40.h,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            trans,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          DropdownButton(
                                            underline: const Divider(
                                              color: Colors.transparent,
                                            ),
                                            elevation: 0,
                                            iconSize: 30,
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            items:
                                                transList.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                trans = newValue!;
                                                // getCars();
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       height: 50,
                            //       width: MediaQuery.of(context).size.width / 2 -
                            //           20,
                            //       decoration: BoxDecoration(
                            //         color: widget.rent == true
                            //             ? Colors.white
                            //             : Colors.white12,
                            //         borderRadius: BorderRadius.circular(16),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           "Rent",
                            //           style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w700,
                            //             color: widget.rent == true
                            //                 ? Colors.black
                            //                 : Colors.white,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     // InkWell(
                            //     //     onTap: () => setState(() {
                            //     //           rent = false;
                            //     //           sell = true;
                            //     //         }),
                            //     //     child: Container(
                            //     //       height: 50,
                            //     //       width: MediaQuery.of(context).size.width /
                            //     //               2 -
                            //     //           20,
                            //     //       decoration: BoxDecoration(
                            //     //         color: sell == true
                            //     //             ? Colors.white
                            //     //             : Colors.white12,
                            //     //         borderRadius: BorderRadius.circular(16),
                            //     //       ),
                            //     //       child: Center(
                            //     //         child: Text(
                            //     //           "Sell",
                            //     //           style: TextStyle(
                            //     //             fontSize: 18,
                            //     //             fontWeight: FontWeight.w700,
                            //     //             color: sell == true
                            //     //                 ? Colors.black
                            //     //                 : Colors.white,
                            //     //           ),
                            //     //         ),
                            //     //       ),
                            //     //     ))
                            //   ],
                            // ),
                            widget.rent == true
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                20,
                                            height: 50,
                                            child: TextFormField(
                                              controller: duration,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                16))),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16)),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16))),
                                                hintText: "Duration",
                                                hintStyle: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              height: 40.h,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  20,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      durationType,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    DropdownButton(
                                                      underline: const Divider(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      elevation: 0,
                                                      iconSize: 30,
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.black,
                                                      ),
                                                      items: durationTypeList
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(items),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          durationType =
                                                              newValue!;
                                                          // getCars();
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  )
                                : const Gap(1),
                            const Gap(22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 150.w,
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            foregroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    primaryColor),
                                            elevation:
                                                MaterialStatePropertyAll(50)),
                                        onPressed: () async {
                                          setState(() {
                                            load = true;
                                          });
                                          Map<String, dynamic> response =
                                              await UserApis().addCar(
                                            carModel: carName.text,
                                            userPhone: phone.text,
                                            type: widget.rent == true
                                                ? 'rent'
                                                : 'sell',
                                            carBrandName: brandName,
                                            modelYear: year.text,
                                            carPrice: price.text,
                                            carDistance: distance.text,
                                            carTransmission: trans,
                                            carDuration: widget.rent == true
                                                ? duration.text
                                                : 4.toString(),
                                            carFuel: fuel.text,
                                            carCity: actualCity,
                                            carLocation: location.text,
                                            carDescription: description.text,
                                            durationType: widget.rent == true
                                                ? durationType
                                                : 'days',
                                            image: images,
                                            topSpeed: topSpeed.text,
                                            token: Provider.of<MyProvider>(
                                                        context,
                                                        listen: false)
                                                    .myToken
                                                    .isEmpty
                                                ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1haG1vdWR5b3Vzc2UyMjBAZ21haWwuY29tIiwiaWQiOiI2NTZkMjUwZGZmOGUyOGRmYzQzOWZmZTAiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMzMDg5NTN9.PdZeJaapalRJytDjIdFGLnz6RZbfUjT_LJE9eMeovRs'
                                                : Provider.of<MyProvider>(
                                                        context,
                                                        listen: false)
                                                    .myToken,
                                          );
                                          //         .then((value) {
                                          //
                                          //   ScaffoldMessenger.of(context)
                                          //       .showSnackBar(const SnackBar(
                                          //           backgroundColor:
                                          //               Colors.green,
                                          //           content: Text(
                                          //               "Car Added Successfully")));
                                          //   // Navigator.pop(context);
                                          //   // Navigator.pop(context);
                                          // });
                                          if (response['success']) {
                                            setState(() {
                                              load = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    content: Text(
                                                        "Car Added Successfully")));
                                            // Navigator.pop(context);
                                          } else {
                                            setState(() {
                                              load = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                        response['message'])));
                                            // Navigator.pop(context);
                                          }
                                        },
                                        child: load
                                            ? const Padding(
                                                padding: EdgeInsets.all(8),
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ))
                                            : const Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                SizedBox(
                                    width: 150.w,
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.white),
                                            elevation:
                                                MaterialStatePropertyAll(10)),
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
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
// Padding(
// padding: const EdgeInsets.only(
// left: 15, right: 15, bottom: 10),
// child: Card(
// shape: const RoundedRectangleBorder(),
// elevation: 5,
// child: TextFormField(
// controller: emailController,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter a value';
// }
// return null;
// },
// decoration: const InputDecoration(
// fillColor: Color(0XFFF2F2F2),
// filled: true,
// border: InputBorder.none,
// suffixIcon: Icon(Icons.email),
// label: Text("E-mail"),
// hintText: ("Enter your e-mail")),
// ),
// )),
// SizedBox(
//   height: 20.h,
// ),
// SizedBox(
//   height: 20.h,
// ),
// CarouselSlider.builder(
//   itemCount: 6,
//   itemBuilder: (BuildContext context, int index,
//           int pageViewIndex) =>
//       Container(
//     height: 300,
//     width: MediaQuery.of(context).size.width - 50,
//     decoration: BoxDecoration(
//       color: secondaryColor,
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: pickedImageFile == null
//         ? Center(
//             child: Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceAround,
//               children: [
//                 const Spacer(),
//                 IconButton(
//                   onPressed: () {
//                     openCamera(false);
//                   },
//                   icon: const Icon(
//                     Icons.camera_alt,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   onPressed: () {
//                     openCamera(true);
//                   },
//                   icon: const Icon(
//                     Icons.camera,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           )
//         : Image.file(pickedImageFile),
//   ),
//   // Padding(
//   //     padding: const EdgeInsets.all(12),
//   //     child:
//   //     ClipRRect(
//   //         borderRadius: BorderRadius.circular(16),
//   //         child: Padding(
//   //             padding: const EdgeInsets.all(0),
//   //             child: Image.network(
//   //               widget.imageList[index].secureUrl,
//   //               width:
//   //               MediaQuery.of(context).size.width + 210,
//   //               fit: BoxFit.cover,
//   //             )))),
//   options: CarouselOptions(
//     autoPlay: true,
//     // animateToClosest: true,
//     autoPlayCurve: Curves.decelerate,
//     // aspectRatio: constraints.maxWidth / constraints.maxHeight,
//     // height: 300,
//     viewportFraction: 1,
//     // autoPlay: true
//   ),
// ),
// Container(
//     height: 300,
//     // width: MediaQuery.of(context).size.width - 50,
//     decoration: BoxDecoration(
//         color: secondaryColor,
//         borderRadius: BorderRadius.circular(16)),
//     child: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         // mainAxisSize: MainAxisSize.max,
//         children: [
//           Expanded(
//               child: Column(
//             children: [
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile0 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg0(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg0(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile0!),
//               ),
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile1 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg1(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg1(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile1!),
//               ),
//             ],
//           )),
//           const VerticalDivider(
//             color: Colors.white,
//           ),
//           Column(
//             children: [
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile2 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg2(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg2(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile2!),
//               ),
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile3 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg3(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg3(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile3!),
//               ),
//             ],
//           ),
//           VerticalDivider(
//             color: Colors.white,
//           ),
//           Column(
//             children: [
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile4 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg4(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg4(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile4!),
//               ),
//               Container(
//                 height: 50.h,
//                 width: 50,
//                 decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius:
//                         BorderRadius.circular(16)),
//                 child: pickedImageFile5 == null
//                     ? Center(
//                         child: Row(
//                           mainAxisAlignment:
//                               MainAxisAlignment
//                                   .spaceAround,
//                           children: [
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg5(
//                                       false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer(),
//                             IconButton(
//                                 onPressed: () {
//                                   openCamToTakeImg5(true);
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera,
//                                   color: Colors.white,
//                                   size: 32,
//                                 )),
//                             const Spacer()
//                           ],
//                         ),
//                       )
//                     : Image.file(pickedImageFile5!),
//               ),
//             ],
//           )
//         ],
//       ),
//     )),
// Container(
//   height: 300,
//   width: MediaQuery.of(context).size.width - 50,
//   decoration: BoxDecoration(
//     color: secondaryColor,
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: pickedImageFile6 == null
//       ? Center(
//           child: Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.spaceAround,
//             children: [
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   openCamToTakeImg5(false);
//                 },
//                 icon: const Icon(
//                   Icons.camera_alt,
//                   color: Colors.white,
//                   size: 32,
//                 ),
//               ),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   openCamToTakeImg5(true);
//                 },
//                 icon: const Icon(
//                   Icons.camera,
//                   color: Colors.white,
//                   size: 32,
//                 ),
//               ),
//               const Spacer(),
//             ],
//           ),
//         )
//       : Image.file(pickedImageFile6!),
// ),
// SizedBox(
//   width: 600,
//   height: 300,
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: [
//         _buildImageContainer(
//             pickedImageFile0, openCamToTakeImg0),
//         const SizedBox(width: 8),
//         _buildImageContainer(
//             pickedImageFile1, openCamToTakeImg1),
//         const SizedBox(width: 8),
//         _buildImageContainer(
//             pickedImageFile2, openCamToTakeImg2),
//         const SizedBox(width: 8),
//       ],
//     ),
//   ),
// ),
